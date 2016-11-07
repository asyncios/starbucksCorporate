//
//  Util.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "Util.h"

@implementation Util

+(BOOL) objectIsNotNull:(id) object{
    if(!object || object==NULL || object==[NSNull null])
        return NO;
    return YES;
}

+(NSNumber*) stringToNumber:(id) numberString{
    if (![Util objectIsNotNull:numberString]){
        return nil;
    }
    
    if([numberString isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)numberString;
    }
    
    if(![numberString isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    @try {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *myNumber = [f numberFromString:numberString];
        return myNumber;
    }
    @catch (NSException *exception) {
        return nil;
    }
    
}


+(NSString*) numberToString:(id) number{
    if (![Util objectIsNotNull:number] ) {
        return nil;
    }
    
    if ([number isKindOfClass:[NSString class]]) {
        return  (NSString*)number;
    }
    
    if (![number isKindOfClass:[NSNumber class]]) {
        return  nil;
    }
    
    @try {
        return [number stringValue];
    }
    @catch (NSException *exception) {
        return nil;
    }
    
}

@end
