//
//  CompaniesViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "CompaniesViewController.h"
#import "NSString+StripHTMLwithRegEX.h"
#import "SWRevealViewController.h"
#import "CompaniesCell.h"
#import "Companies.h"
#import "CoreData+MagicalRecord.h"
#import "NSDictionary+LowercaseDicionary.h"

@interface CompaniesViewController ()

@end

@implementation CompaniesViewController

@synthesize companiesTableArray, companiesJsonWrapper, CompaniesTableView ,companiesProfilePic, companyDescription, companyFounded,companyHeadquarter, companyJoined, companyName, companyNoOfEmployees, companyType, companyWebsite;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    //[self refreshData];
    
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.title = @"Companies";
    
    // Custom TableView Background
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    UIEdgeInsets inset = UIEdgeInsetsMake(1, 0, 0, 0);
    self.tableView.contentInset = inset;

    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    //  [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    {
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
        
        NSURL * url = [NSURL URLWithString:@"http://playnation.eu/beta/hacks/getItemiOS.php"];
        NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
        NSString * params =@"tableName=companies";
        [urlRequest setHTTPMethod:@"POST"];
        [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                               
                                                               NSLog(@"Response:%@ %@\n", response, error);
                                                               
                                                               
                                                               if(error == nil)
                                                               {
                                                                   
                                                                   NSLog(@"Data = %@",data);
                                                                   
                                                                   
                                                                   NSError *jsonNewsError = nil;
                                                                   
                                                                   companiesJsonWrapper = [NSJSONSerialization
                                                                                       JSONObjectWithData:data
                                                                                       options:NSJSONReadingAllowFragments
                                                                                       error:&jsonNewsError];
                                                                   
                                                                   if (!companiesJsonWrapper) {
                                                                       NSLog(@"Error parsing JSON: %@", jsonNewsError);
                                                                   }
                                                                   
                                                                   else {
                                                                       NSLog(@"jsonList: %@", companiesJsonWrapper);
                                                                       
                                                                       [CompaniesTableView reloadData];
                                                                       
                                                                       companiesTableArray = companiesJsonWrapper;
                                                                       
                                                                   }
                                                               }
                                                               
                                                           }];
        [dataTask resume];
        
    }
  
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#    // Return the number of rows in the section.
    return [companiesJsonWrapper count];
}

- (UIImage *)cellBackgroundForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowCount = [self tableView:[self tableView] numberOfRowsInSection:0];
    NSInteger rowIndex = indexPath.row;
    UIImage *background = nil;
    
    if (rowIndex == 0) {
        background = [UIImage imageNamed:@"cell_combined"];
    } else if (rowIndex == rowCount - 1) {
        background = [UIImage imageNamed:@"cell_combined"];
    } else {
        background = [UIImage imageNamed:@"cell_combined"];
    }
    
    return background;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CompaniesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"companiesCell"];
    
    if(cell == nil){
        cell = [[CompaniesCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"companiesCell"];
    }
    
//    cell.textLabel.text = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"CompanyName"];
//    cell.detailTextLabel.text = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"CompanyType"];
    
    cell.companiesTitleLabel.text = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"CompanyName"];
    cell.companiesDescLabel.text = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"CompanyDesc"];
    //Set the image of the cell and make it round
    cell.companiesImage.image = [UIImage imageNamed:@"playnationLogo.png"];
    cell.companiesImage.clipsToBounds = YES;
    cell.companiesImage.layer.borderWidth = 2.0f;
    cell.companiesImage.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.5f].CGColor;
    cell.companiesImage.layer.cornerRadius = 25.0f;
    
    UIImage *background = [self cellBackgroundForRowAtIndexPath:indexPath];
    
    UIImageView *cellBackgroundView = [[UIImageView alloc] initWithImage:background];
    cellBackgroundView.image = background;
    cell.backgroundView = cellBackgroundView;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showCompanyDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CompaniesViewController *compDestViewController = segue.destinationViewController;
        compDestViewController.companyName =  [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"CompanyName"];
        compDestViewController.companyType = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"CompanyType"];
        compDestViewController.companyHeadquarter = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"CompanyAddress"];
        compDestViewController.companyFounded = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"Founded"];
        compDestViewController.companyJoined = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"CreatedTime"];
        compDestViewController.companyDescription = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"CompanyDesc"];
        compDestViewController.companyNoOfEmployees = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"Employees"];
        compDestViewController.companyWebsite = [[companiesTableArray objectAtIndex:indexPath.row] objectForKey:@"URL"];
        
    }
}

@end
