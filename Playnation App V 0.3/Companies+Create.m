//
//  Companies+Create.m
//  Playnation App V 0.3
//
//  Created by Lasse Wingreen on 03/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import "Companies+Create.h"
#import "PlaynationFetcher.h"


@implementation Companies (Create)

+ (Companies *)companyWithInfo:(NSDictionary *)companyDictionary
        inManagedObjectContext:(NSManagedObjectContext *)context
{
    Companies *company = nil;
    

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Companies"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", ID_COMPANY];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || error || ([matches count] > 1)) {
        // handle error
    } else if ([matches count]) {
        company = [matches firstObject];
    } else {
        company = [NSEntityDescription insertNewObjectForEntityForName:@"Companies"
                                              inManagedObjectContext:context];

        
    }
    
    return company;
}

+ (void)loadCompaniesFromArray:(NSArray *)companiesArray // of Flickr NSDictionary
         intoManagedObjectContext:(NSManagedObjectContext *)context
{
    for (NSDictionary *company in companiesArray) {
        [self companyWithInfo:company inManagedObjectContext:context];
    }
}


@end
