//
//  PlayerCell.h
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 11/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *playerFirstAndLastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerNickLabel;
@property (strong, nonatomic) IBOutlet UILabel *playerAgeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *playerImageView;
@property (strong, nonatomic) IBOutlet UILabel *playerCountryLabel;


@end
