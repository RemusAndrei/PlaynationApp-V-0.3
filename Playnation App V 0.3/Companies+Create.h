//
//  Companies+Create.h
//  Playnation App V 0.3
//
//  Created by Lasse Wingreen on 03/02/14.
//  Copyright (c) 2014 Remus Cicu. All rights reserved.
//

#import "Companies.h"

@interface Companies (Create)

+ (Companies *)companyWithInfo:(NSDictionary *)companyDictionary
        inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)loadCompaniesFromArray:(NSArray *)companiesArray // of Flickr NSDictionary
         intoManagedObjectContext:(NSManagedObjectContext *)context;



@end
