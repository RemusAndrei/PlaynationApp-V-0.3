//
//  DetailedGroupViewController.h
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 13/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedGroupViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UILabel *groupNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *groupTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *groupCreatedByLabel;
@property (strong, nonatomic) IBOutlet UILabel *groupMembersLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateCreatedLabel;
@property (strong, nonatomic) IBOutlet UITextView *groupDescriptionText;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *groupMembersPic;
@property (strong, nonatomic) IBOutlet UIImageView *groupProfilePicImage;

- (IBAction)segControl:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *wallScreen;
@property (strong, nonatomic) IBOutlet UIView *newsScreen;
@property (strong, nonatomic) IBOutlet UIView *eventsScreen;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segValue;

@property (weak,nonatomic) NSString *groupName;
@property (weak,nonatomic) NSString *groupType;
@property (weak,nonatomic) NSString *groupCreatedBy;
@property (weak,nonatomic) NSString *groupMembers;
@property (weak,nonatomic) NSString *dateCreated;
@property (weak,nonatomic) NSString *groupDescription;


@end
