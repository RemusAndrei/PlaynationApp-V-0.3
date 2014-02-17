//
//  DetailedGroupViewController.m
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 13/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import "DetailedGroupViewController.h"
#import "UITabBarController+ShowHideBar.h"

@interface DetailedGroupViewController ()

@end

@implementation DetailedGroupViewController

@synthesize groupCreatedBy, groupDescription, groupMembers, groupName, groupType, dateCreated,segValue;
@synthesize groupDescriptionText, groupNameLabel, groupTypeLabel, dateCreatedLabel, groupCreatedByLabel, groupMembersLabel;

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
    
    groupNameLabel.text = groupName;
    groupTypeLabel.text = groupType;
    groupCreatedByLabel.text = groupCreatedBy;
    groupMembersLabel.text = [NSString stringWithFormat:@"%@ Members", groupMembers];
    groupDescriptionText.text = groupDescription;
    dateCreatedLabel.text = dateCreated;
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)hidesBottomBarWhenPushed{
    return YES;
}


- (IBAction)segControl:(id)sender {
    if (segValue.selectedSegmentIndex == 0) {
        self.newsScreen.hidden = YES;
        self.wallScreen.hidden = NO;
        self.eventsScreen.hidden = YES;
    }
    else if (segValue.selectedSegmentIndex == 1){
        self.newsScreen.hidden = NO;
        self.wallScreen.hidden = YES;
        self.eventsScreen.hidden = YES;
    }
    
    else if (segValue.selectedSegmentIndex == 2){
        self.newsScreen.hidden = YES;
        self.wallScreen.hidden = YES;
        self.eventsScreen.hidden = NO;
    }
}
@end
