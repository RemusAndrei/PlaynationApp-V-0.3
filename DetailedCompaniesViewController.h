//
//  DetailedCompaniesViewController.h
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 14/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedCompaniesViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UIImageView *companiesProfilePicImage;
@property (strong, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *companyTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *companyHeadquarterLabel;
@property (strong, nonatomic) IBOutlet UILabel *companyNoOfEmployeesLabel;
@property (strong, nonatomic) IBOutlet UILabel *companyFoundedLabel;
@property (strong, nonatomic) IBOutlet UILabel *companyWebsiteLabel;
@property (strong, nonatomic) IBOutlet UILabel *companyJoinedLabel;
@property (strong, nonatomic) IBOutlet UITextView *companyDescriptionText;




@property (strong, nonatomic) NSString *companiesProfilePic;
@property (strong, nonatomic) NSString *companyName;
@property (strong, nonatomic) NSString *companyType;
@property (strong, nonatomic) NSString *companyHeadquarter;
@property (strong, nonatomic) NSString *companyNoOfEmployees;
@property (strong, nonatomic) NSString *companyFounded;
@property (strong, nonatomic) NSString *companyWebsite;
@property (strong, nonatomic) NSString *companyJoined;
@property (strong, nonatomic) NSString *companyDescription;

@end
