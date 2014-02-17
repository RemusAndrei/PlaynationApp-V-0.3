//
//  PlayerViewController.h
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayersViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *PlayersTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (strong,nonatomic) NSArray *playerJsonWrapper;
@property (strong,nonatomic) NSArray *playerTableArray;

@property (strong, nonatomic) NSString *playerNickname;
@property (strong, nonatomic) NSString *playerName;
@property (strong, nonatomic) NSString *playerAddress;
@property (strong, nonatomic) NSString *playerBirthday;
@property (strong, nonatomic) NSString *playerJoined;
@property (strong, nonatomic) NSString *playerRating;


@end
