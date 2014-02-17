//
//  NewsOfGroupsView.m
//  Playnation App V 0.3
//
//  Created by Remus Cicu on 03/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import "NewsOfGroupsView.h"
#import "GroupsViewController.h"

@implementation NewsOfGroupsView
@synthesize groupName, groupname2;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    groupname2.text = groupName;
    
    
	// Do any additional setup after loading the view.
}

@end
