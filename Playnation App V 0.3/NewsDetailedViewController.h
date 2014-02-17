//
//  NewsDetailedViewController.h
//  JSONtestApp
//
//  Created by Remus Cicu on 17/01/14.
//  Copyright (c) 2014 Agro52 Aps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsDetailedViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic) IBOutlet UITextView *newsTextView;
@property (weak, nonatomic)NSString *headline;
@property (weak, nonatomic)NSString *newsText;
@property (strong, nonatomic) IBOutlet UIView *firstView;
@property (strong, nonatomic) IBOutlet UIView *secondView;
@property (strong, nonatomic) IBOutlet UIView *thirdView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmenCont;
- (IBAction)segmenValueChanged:(id)sender;
@end
