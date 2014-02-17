//
//  CompaniesCell.h
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 07/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompaniesCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *companiesTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *companiesDescLabel;
@property (strong, nonatomic) IBOutlet UIImageView *companiesImage;

@end
