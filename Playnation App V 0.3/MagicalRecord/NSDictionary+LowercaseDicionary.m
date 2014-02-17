//
//  NSDictionary+LowercaseDicionary.m
//  PlaynationCoreData
//
//  Created by Lasse Wingreen on 31/01/14.
//  Copyright (c) 2014 Playnation. All rights reserved.
//

#import "NSDictionary+LowercaseDicionary.h"

#import "TransformerKit.h"

@implementation NSDictionary (LowercaseDicionary)

-(NSDictionary *) dictionaryWithLowercaseKeys {
    NSMutableDictionary         *result = [NSMutableDictionary dictionaryWithCapacity:0];
    NSString                    *key;
    
    
    for ( key in self ) {

        
        [[NSValueTransformer valueTransformerForName:TTTLlamaCaseStringTransformerName] transformedValue:key];
        
        
    }

    return result;
}



//    NSString *keyWithFirstCharLowered = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[key substringToIndex:1] lowercaseString]];
//
//    key = [NSString stringWithFormat:@"%@", keyWithFirstCharLowered];


//    NSString *firstChar = [key substringToIndex:1];
//[key replaceCharactersInRange:NSMakeRange(0, 1) withString:[firstChar lowercaseString]]


@end
