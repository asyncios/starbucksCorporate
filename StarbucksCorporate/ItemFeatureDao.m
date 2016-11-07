//
//  ItemFeatureDao.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ItemFeatureDao.h"

@implementation ItemFeatureDao
{
    NSDictionary* itemFeatureDictionary;
}

+ (ItemFeatureDao*)sharedInstance
{
    static ItemFeatureDao *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ItemFeatureDao alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(NSDictionary*) getItemFeatureDictionary
{
    if (!itemFeatureDictionary)
    {
        NSMutableDictionary* tempDictionary = [[NSMutableDictionary alloc] init];
        
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"itemFeature"
                                                             ofType:@"json"
                                                        inDirectory:@"Data"];
        NSData *starbucksData = [[NSData alloc] initWithContentsOfFile:fileName];
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:starbucksData
                                                                 options:0
                                                                   error:&error];
        if (error)
        {
            return nil;
        }
        else
        {
            json = [json objectForKey:@"itemFeature"];
            ItemFeature* pItemFeature;
            NSArray* arrayKey = [json allKeys];
            for (NSString* pKey in arrayKey)
            {
                pItemFeature = [[ItemFeature getParser] parseDictionary:[json objectForKey:pKey]];
                if (pItemFeature && [pItemFeature isKindOfClass:[ItemFeature class]])
                {
                    [tempDictionary setObject:pItemFeature forKey:pKey];
                }
                
            }
            itemFeatureDictionary = [tempDictionary copy];
        }
    }
    return itemFeatureDictionary;
}

-(ItemFeature *)searchItemFeature:(NSString *)stringId
{
    [self getItemFeatureDictionary];
    if (stringId && [stringId isKindOfClass:[NSString class]] && [stringId length]>0)
    {
        ItemFeature* pItemFeature = [itemFeatureDictionary objectForKey:stringId];
        if (pItemFeature && [pItemFeature isKindOfClass:[ItemFeature class]])
        {
            
        }
        return [itemFeatureDictionary objectForKey:stringId];
    }
    return nil;
}

@end
