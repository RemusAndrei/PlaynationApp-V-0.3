//
//  GamesCell.h
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 12/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamesCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *gamesImage;
@property (strong, nonatomic) IBOutlet UILabel *gamesName;
@property (strong, nonatomic) IBOutlet UILabel *gamesType;
@property (strong, nonatomic) IBOutlet UILabel *gamesReleaseD;

@end
