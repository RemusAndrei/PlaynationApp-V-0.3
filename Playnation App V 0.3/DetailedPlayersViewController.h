//
//  DetailedPlayersViewController.h
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 14/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedPlayersViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UILabel *playerNicknameLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerAddressLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerBirthdayLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerJoinedLabel;
@property (strong, nonatomic) IBOutlet UIImageView *playerAvatarImage;
@property (strong, nonatomic) IBOutlet UILabel *playerRatingLabel;

@property (strong, nonatomic) IBOutlet UISegmentedControl *valueChangeSeg;
- (IBAction)segControl:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *wallScreen;
@property (strong, nonatomic) IBOutlet UIView *gamesScreen;
@property (strong, nonatomic) IBOutlet UIView *friendsScreen;


@property (strong, nonatomic) NSString *playerNickname;
@property (strong, nonatomic) NSString *playerName;
@property (strong, nonatomic) NSString *playerAddress;
@property (strong, nonatomic) NSString *playerBirthday;
@property (strong, nonatomic) NSString *playerJoined;
@property (strong, nonatomic) NSString *playerRating;



@end
