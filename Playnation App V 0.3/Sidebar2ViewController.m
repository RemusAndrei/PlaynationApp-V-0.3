////
////  Sidebar2ViewController.m
////  Playnation App V 0.3
////
////  Created by Remus Cicu on 06/02/14.
////  Copyright (c) 2014 Remus Cicu. All rights reserved.
////
//
//#import "Sidebar2ViewController.h"
//#import "MessagesViewController.h"
//#import "SWRevealViewController.h"
//#import "MainViewController.h"
//#import "SidebarCell2.h"
//
//@interface Sidebar2ViewController ()
//
//@property (nonatomic, strong) NSArray* items;
//
//@end
//
//@implementation Sidebar2ViewController
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
//    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
//
//    
//    self.tableView = _tableView;
//    
//    [self.view addSubview:_tableView];
//    self.view.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
//    self.tableView.backgroundColor = [UIColor colorWithWhite:0.2f alpha:1.0f];
//    self.tableView.separatorColor = [UIColor colorWithWhite:0.15f alpha:0.2f];
//    self.profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
//    self.profileImageView.clipsToBounds = YES;
//    self.profileImageView.layer.borderWidth = 4.0f;
//    self.profileImageView.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.5f].CGColor;
//    self.profileImageView.layer.cornerRadius = 35.0f;
//    
//    
//    NSDictionary* object1 = [NSDictionary dictionaryWithObjects:@[ @"Inbox", @"7", @"envelope" ] forKeys:@[ @"title", @"count", @"icon" ]];
//    NSDictionary* object2 = [NSDictionary dictionaryWithObjects:@[ @"Updates", @"7", @"check" ] forKeys:@[ @"title", @"count", @"icon" ]];
//    NSDictionary* object3 = [NSDictionary dictionaryWithObjects:@[ @"Account", @"0", @"account" ] forKeys:@[ @"title", @"count", @"icon" ]];
//    NSDictionary* object4 = [NSDictionary dictionaryWithObjects:@[ @"Settings", @"0", @"settings" ] forKeys:@[ @"title", @"count", @"icon" ]];
//    NSDictionary* object5 = [NSDictionary dictionaryWithObjects:@[ @"Logout", @"0", @"arrow" ] forKeys:@[ @"title", @"count", @"icon" ]];
//     NSDictionary* object6 = [NSDictionary dictionaryWithObjects:@[ @"Logout", @"0", @"arrow" ] forKeys:@[ @"title", @"count", @"icon" ]];
//    
//    self.items = @[object1, object2, object3, object4, object5, object6];
//
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    return 4;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    SidebarCell2* cell = [tableView dequeueReusableCellWithIdentifier:@"SidebarCell2"];
//    
//    NSDictionary* item = self.items[indexPath.row];
//    
//    cell.titleLabel.text = item[@"title"];
//    cell.iconImageView.image = [UIImage imageNamed:item[@"icon"]];
//    
//    NSString* count = item[@"count"];
//    if(![count isEqualToString:@"0"]){
//        cell.countLabel.text = count;
//    }
//    else{
//        cell.countLabel.alpha = 0;
//    }
//    
//    return cell;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 46;
//}
//
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
////- (void)didReceiveMemoryWarning
////{
////    [super didReceiveMemoryWarning];
////    // Dispose of any resources that can be recreated.
////}
////
////#pragma mark - Table view data source
////
////- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
////{
////    return self.cells.count;
////}
////
////- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
////{
////    return self.cells[indexPath.row];
////}
//
////- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
////{
////    // Return the number of sections.
////    return 1;
////}
////
////
////- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
////    
////    static NSString *CellIdentifier = @"Cell";
////    
////    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
////    if (cell == nil) {
////        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
////    }
////    
////    // configure cell...
////    switch(indexPath.row) { // assuming there is only one section
////        case 0:
////            cell.textLabel.text = @"Start:";
////            break;
////        case 1:
////            cell.textLabel.text = @"Duration:";
////            break;
////        case 2:
////            cell.textLabel.text = @"radius";
////            break;
////        case 3;
////            cell.textLabel.text = @"<#string#>"
////        default:
////            break;
////    }
////    
////    return cell;
////}
//
//
//
//- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
//{
//    // Make sure we are using the SWRevealViewControllerSegue
//    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] )
//    {
//        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
//        
//        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc)
//        {
//            // The name of our view controller we want to navigate to
//            NSString *vcName = @"";
//            
//            // Set the name of the Storyboard ID we want to switch to
//            if ([segue.identifier isEqualToString:@"showTabBarMenu"])
//            {
//                vcName = @"tabBarMenu";
//            }
//            
//            else if ([segue.identifier isEqualToString:@"showMessagesMenu"])
//            {
//                vcName = @"messagesMenu";
//            }
//            
//            else if ([segue.identifier isEqualToString:@"showFriendsMenu"])
//            {
//                vcName = @"friendsMenu";
//            }
//            
//            else if ([segue.identifier isEqualToString:@"showMyProfileMenu"])
//            {
//                vcName = @"myProfileMenu";
//            }
//            
//            else if ([segue.identifier isEqualToString:@"showNotificationMenu"])
//            {
//                vcName = @"notificationMenu";
//            }
//            
//            // If we selected a menu item
//            if (vcName.length > 0)
//            {
//                // Get the view controller
//                UIViewController *vcNew = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:vcName];
//                
//                // Swap out the Front view controller and display
//                [self.revealViewController setFrontViewController:vcNew];
//                [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
//            }
//            
//            else
//            {
//                // Could not navigate to view - add logging
//            }
//        };
//    }
//}
//@end
