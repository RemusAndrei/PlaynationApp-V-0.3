//
//  Companies.h
//  Playnation App V 0.3
//
//  Created by Lasse Wingreen on 03/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Companies : NSManagedObject

@property (nonatomic, retain) NSString * companyAddress;
@property (nonatomic, retain) NSString * companyDesc;
@property (nonatomic, retain) NSString * companyName;
@property (nonatomic, retain) NSString * companyType;
@property (nonatomic, retain) NSString * createdTime;
@property (nonatomic, retain) NSNumber * employees;
@property (nonatomic, retain) NSNumber * eventCount;
@property (nonatomic, retain) NSDate * founded;
@property (nonatomic, retain) NSNumber * gameCount;
@property (nonatomic, retain) NSNumber * iD_COMPANY;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSString * isLiked;
@property (nonatomic, retain) NSNumber * newsCount;
@property (nonatomic, retain) NSString * ownership;
@property (nonatomic, retain) NSString * socialRating;
@property (nonatomic, retain) NSString * uRL;

@end
