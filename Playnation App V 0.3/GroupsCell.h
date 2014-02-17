//
//  GroupsCell.h
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 07/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *groupNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupTypeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *groupImage;
@property (strong, nonatomic) IBOutlet UILabel *groupMemberNoLabel;

@end
