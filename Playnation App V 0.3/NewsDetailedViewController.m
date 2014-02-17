//
//  NewsDetailedViewController.m
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import "NewsDetailedViewController.h"
#import "UITabBarController+ShowHideBar.h"


@interface NewsDetailedViewController ()

@end

@implementation NewsDetailedViewController
@synthesize headerLabel,newsTextView;
@synthesize headline,newsText;
@synthesize firstView,secondView,thirdView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  
    headerLabel.text = headline;
    newsTextView.text = newsText;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Overriden UIViewController methods
//hide tab bar
- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

- (IBAction)segmenValueChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.secondView.hidden = YES;
            self.thirdView.hidden = NO;
            self.firstView.hidden = YES;
            break;
            
        case 1:
            self.secondView.hidden = YES;
            self.thirdView.hidden = YES;
            self.firstView.hidden = NO;
            break;
        
        case 2:
            self.secondView.hidden = NO;
            self.thirdView.hidden = YES;
            self.firstView.hidden = YES;
            break;
            
        default:
            break;
    }
    
    
    
    
}
@end
