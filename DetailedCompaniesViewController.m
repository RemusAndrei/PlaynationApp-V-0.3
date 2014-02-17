//
//  DetailedCompaniesViewController.m
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 14/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import "DetailedCompaniesViewController.h"
#import "CompaniesViewController.h"

@interface DetailedCompaniesViewController ()

@end

@implementation DetailedCompaniesViewController

@synthesize companyWebsite, companyNoOfEmployees, companyJoined, companiesProfilePic,companyDescription,companyFounded, companyHeadquarter , companyType,companyName,companiesProfilePicImage, companyDescriptionText, companyFoundedLabel, companyHeadquarterLabel, companyJoinedLabel, companyNameLabel, companyNoOfEmployeesLabel, companyTypeLabel, companyWebsiteLabel;

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
    
    companyNameLabel.text = companyName;
    companyTypeLabel.text = companyType;
    companyHeadquarterLabel.text = companyHeadquarter;
    companyNoOfEmployeesLabel.text = [NSString stringWithFormat:@"%@ Employees",companyNoOfEmployees];
    companyFoundedLabel.text = [NSString stringWithFormat:@"Founded: %@", companyFounded];
    companyWebsiteLabel.text = companyWebsite;
    
    
    NSTimeInterval _interval=[companyJoined doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *actualdate=[_formatter stringFromDate:date];
    
    companyJoinedLabel.text = [NSString stringWithFormat:@"Joined: %@", actualdate];
    companyDescriptionText.text = companyDescription;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
