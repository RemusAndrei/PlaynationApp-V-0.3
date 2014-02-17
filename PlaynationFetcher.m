//
//  PlaynationFetcher.m
//  Playnation App V 0.3
//
//  Created by Lasse Wingreen on 04/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import "PlaynationFetcher.h"
#import "CompanyDatabaseAvailability.h"
#import "Companies+Create.h"

@interface PlaynationFetcher() <NSURLSessionDownloadDelegate>

@property (copy, nonatomic) void (^playnationDownloadBackgroundURLSessionCompletionHandler)();

@property (strong, nonatomic) NSURLSession *playnationDownloadSession;
@property (strong, nonatomic) NSTimer *playnationForegroundFetchTimer;
@property (strong, nonatomic) NSManagedObjectContext *companyDatabaseContext;


#define playnation_FETCH @"Playnation Data Fetch"
#define tableName @"companies"

@end

@implementation PlaynationFetcher


- (void)setCompanyDatabaseContext:(NSManagedObjectContext *)companyDatabaseContext
{
    _companyDatabaseContext = companyDatabaseContext;
    
    // every time the context changes, we'll restart our timer
    // so kill (invalidate) the current one
    // (we didn't get to this line of code in lecture, sorry!)
    [self.playnationForegroundFetchTimer invalidate];
    self.playnationForegroundFetchTimer = nil;
    
    if (self.companyDatabaseContext)
    {
        // this timer will fire only when we are in the foreground
        self.playnationForegroundFetchTimer = [NSTimer scheduledTimerWithTimeInterval:10
                                                                               target:self
                                                                             selector:@selector(startplaynationFetch:)
                                                                             userInfo:nil
                                                                              repeats:YES];
    }
    
    // let everyone who might be interested know this context is available
    // this happens very early in the running of our application
    // it would make NO SENSE to listen to this radio station in a View Controller that was segued to, for example
    // (but that's okay because a segued-to View Controller would presumably be "prepared" by being given a context to work in)
    NSDictionary *userInfo = self.companyDatabaseContext ? @{ CompanyDatabaseAvailabilityContext : self.companyDatabaseContext } : nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:CompanyDatabaseAvailabilityNotification
                                                        object:self
                                                      userInfo:userInfo];
}

#pragma mark - playnation Fetching

// this will probably not work (task = nil) if we're in the background, but that's okay
// (we do our background fetching in performFetchWithCompletionHandler:)
// it will always work when we are the foreground (active) application

- (void)startPlaynationFetch
{
    // getTasksWithCompletionHandler: is ASYNCHRONOUS
    // but that's okay because we're not expecting startplaynationFetch to do anything synchronously anyway
    [self.playnationDownloadSession getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
        // let's see if we're already working on a fetch ...
        if (![downloadTasks count]) {
            // ... not working on a fetch, let's start one up
            NSURL * PlaynationURL = [NSURL URLWithString:@"http://playnation.eu/beta/hacks/getItemiOS.php"];
            NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:PlaynationURL];
            NSString *params = [ NSString stringWithFormat:@"tableName=%@",tableName];
            [urlRequest setHTTPMethod:@"POST"];
            [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];

            
            
            NSURLSessionDownloadTask *task = [self.playnationDownloadSession downloadTaskWithURL:PlaynationURL];
            
            
            
            task.taskDescription = playnation_FETCH;
            [task resume];
        } else {
            // ... we are working on a fetch (let's make sure it (they) is (are) running while we're here)
            for (NSURLSessionDownloadTask *task in downloadTasks) [task resume];
        }
    }];
}

- (void)startplaynationFetch:(NSTimer *)timer // NSTimer target/action always takes an NSTimer as an argument
{
    [self startPlaynationFetch];
}

// the getter for the playnationDownloadSession @property

- (NSURLSession *)playnationDownloadSession // the NSURLSession we will use to fetch playnation data in the background
{
    if (!_playnationDownloadSession) {
        static dispatch_once_t onceToken; // dispatch_once ensures that the block will only ever get executed once per application launch
        dispatch_once(&onceToken, ^{
            // notice the configuration here is "backgroundSessionConfiguration:"
            // that means that we will (eventually) get the results even if we are not the foreground application
            // even if our application crashed, it would get relaunched (eventually) to handle this URL's results!
            NSURLSessionConfiguration *urlSessionConfig = [NSURLSessionConfiguration backgroundSessionConfiguration:playnation_FETCH];
            _playnationDownloadSession = [NSURLSession sessionWithConfiguration:urlSessionConfig
                                                                       delegate:self    // we MUST have a delegate for background configurations
                                                                  delegateQueue:nil];   // nil means "a random, non-main-queue queue"
        });
    }
    return _playnationDownloadSession;
}

// standard "get company information from playnation URL" code

- (NSArray *)playnationDataAtURL:(NSURL *)url
{
    NSArray *playnationDataArray;
    NSData *playnationJSONData = [NSData dataWithContentsOfURL:url];  // will block if url is not local!
    if (playnationJSONData) {
        playnationDataArray = [NSJSONSerialization JSONObjectWithData:playnationJSONData
                                                                 options:0
                                                                   error:NULL];
        
        
        
        
        
        
    }
    return playnationDataArray;
}

// gets the playnation company dictionaries out of the url and puts them into Core Data
// this was moved here after lecture to give you an example of how to declare a method that takes a block as an argument
// and because we now do this both as part of our background session delegate handler and when background fetch happens

- (void)loadPlaynationCompanysFromLocalURL:(NSURL *)localFile
                               intoContext:(NSManagedObjectContext *)context
                       andThenExecuteBlock:(void(^)())whenDone
{
    if (context) {
        NSArray *companys = [self playnationDataAtURL:localFile];
        [context performBlock:^{
            [Companies loadCompaniesFromArray:companys intoManagedObjectContext:context];
            [context save:NULL]; // NOT NECESSARY if this is a UIManagedDocument's context
            if (whenDone) whenDone();
        }];
    } else {
        if (whenDone) whenDone();
    }
}

#pragma mark - NSURLSessionDownloadDelegate

// required by the protocol
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)localFile
{
    // we shouldn't assume we're the only downloading going on ...
    if ([downloadTask.taskDescription isEqualToString:playnation_FETCH]) {
        // ... but if this is the playnation fetching, then process the returned data
        [self loadPlaynationCompanysFromLocalURL:localFile
                                     intoContext:self.companyDatabaseContext
                             andThenExecuteBlock:^{
                                 [self playnationDownloadTasksMightBeComplete];
                             }
         ];
    }
}

// required by the protocol
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes
{
    // we don't support resuming an interrupted download task
}

// required by the protocol
- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    // we don't report the progress of a download in our UI, but this is a cool method to do that with
}

// not required by the protocol, but we should definitely catch errors here
// so that we can avoid crashes
// and also so that we can detect that download tasks are (might be) complete
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (error && (session == self.playnationDownloadSession)) {
        NSLog(@"playnation background download session failed: %@", error.localizedDescription);
        [self playnationDownloadTasksMightBeComplete];
    }
}

// this is "might" in case some day we have multiple downloads going on at once

- (void)playnationDownloadTasksMightBeComplete
{
    if (self.playnationDownloadBackgroundURLSessionCompletionHandler) {
        [self.playnationDownloadSession getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
            // we're doing this check for other downloads just to be theoretically "correct"
            //  but we don't actually need it (since we only ever fire off one download task at a time)
            // in addition, note that getTasksWithCompletionHandler: is ASYNCHRONOUS
            //  so we must check again when the block executes if the handler is still not nil
            //  (another thread might have sent it already in a multiple-tasks-at-once implementation)
            if (![downloadTasks count]) {  // any more playnation downloads left?
                // nope, then invoke playnationDownloadBackgroundURLSessionCompletionHandler (if it's still not nil)
                void (^completionHandler)() = self.playnationDownloadBackgroundURLSessionCompletionHandler;
                self.playnationDownloadBackgroundURLSessionCompletionHandler = nil;
                if (completionHandler) {
                    completionHandler();
                }
            } // else other downloads going, so let them call this method when they finish
        }];
    }
}


@end
