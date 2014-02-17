//
//  GroupViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "GroupsViewController.h"
#import "NSString+StripHTMLwithRegEX.h"
#import "SWRevealViewController.h"
#import "NewsOfGroupsView.h"
#import "GroupsCell.h"

@interface GroupsViewController ()

@end

@implementation GroupsViewController

@synthesize GroupsTableView, groupJsonWrapper, groupTableArray;

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
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Custom TableView Background
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    UIEdgeInsets inset = UIEdgeInsetsMake(1, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    
    self.title = @"Groups";
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    {
        NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
        
        NSURL * url = [NSURL URLWithString:@"http://playnation.eu/beta/hacks/getItemiOS.php"];
        NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
        NSString * params =@"tableName=groups";
        [urlRequest setHTTPMethod:@"POST"];
        [urlRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                               
                                                               NSLog(@"Response:%@ %@\n", response, error);
                                                               
                                                               
                                                               if(error == nil)
                                                               {
                                                                   
                                                                   NSLog(@"Data = %@",data);
                                                                 
                                                                   
                                                                   NSError *jsonNewsError = nil;
                                                                   
                                                                   groupJsonWrapper = [NSJSONSerialization
                                                                                           JSONObjectWithData:data
                                                                                           options:NSJSONReadingAllowFragments
                                                                                           error:&jsonNewsError];
                                                                   
                                                                   if (!groupJsonWrapper) {
                                                                       NSLog(@"Error parsing JSON: %@", jsonNewsError);
                                                                   }
                                                                   
                                                                   else {
                                                                       NSLog(@"jsonList: %@", groupJsonWrapper);
                                                                       
                                                                       [GroupsTableView reloadData];
                                                                       
                                                                       groupTableArray = groupJsonWrapper;
                                                                       
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
    return [groupJsonWrapper count];
}

//Set the background of the cell

- (UIImage *)cellBackgroundForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowCount = [self tableView:[self tableView] numberOfRowsInSection:0];
    NSInteger rowIndex = indexPath.row;
    UIImage *background = nil;
    
    if (rowIndex == 0) {
        background = [UIImage imageNamed:@"cell_background"];
    } else if (rowIndex == rowCount - 1) {
        background = [UIImage imageNamed:@"cell_background"];
    } else {
        background = [UIImage imageNamed:@"cell_background"];
    }
    
    return background;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupsCell *cell = (GroupsCell *)[tableView dequeueReusableCellWithIdentifier:@"groupsCell"];
    
    if(cell == nil){
        cell = [[GroupsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"groupsCell"];
    }
    cell.groupNameLabel.text = [[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"GroupName"];
    cell.groupTypeLabel.text = [NSString stringWithFormat:@"%@ - %@ ",[[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"GroupType1"], [[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"GroupType2"] ];
    cell.groupImage.image = [UIImage imageNamed:@"playnationLogo.png"];
    cell.groupImage.clipsToBounds = YES;
    cell.groupImage.layer.borderWidth = 2.0f;
    cell.groupImage.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.5f].CGColor;
    cell.groupImage.layer.cornerRadius = 25.0f;
    cell.groupMemberNoLabel.text = [[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"MemberCount"];
   
    
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

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showGroupsDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        GroupsViewController *groupsDestViewController = segue.destinationViewController;
        groupsDestViewController.groupName =  [[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"GroupName"];
        groupsDestViewController.groupType =  [NSString stringWithFormat:@"%@ - %@ ",[[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"GroupType1"], [[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"GroupType2"] ];
        groupsDestViewController.groupCreatedBy = [[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"DisplayName"];
        groupsDestViewController.groupMembers = [[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"MemberCount"];
        groupsDestViewController.dateCreated = [[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"CreatedTime"];
        groupsDestViewController.groupDescription = [[groupTableArray objectAtIndex:indexPath.row] objectForKey:@"GroupDesc"];
    }
}



@end
