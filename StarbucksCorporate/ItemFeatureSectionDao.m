//
//  ItemFeatureSectionDao.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ItemFeatureSectionDao.h"

@implementation ItemFeatureSectionDao
{
    NSDictionary* itemFeatureSectionDictionary;
}

+ (ItemFeatureSectionDao*)sharedInstance
{
    static ItemFeatureSectionDao *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ItemFeatureSectionDao alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(NSDictionary*) getItemFeatureSectionDictionary
{
    if (!itemFeatureSectionDictionary)
    {
        NSMutableDictionary* tempDictionary = [[NSMutableDictionary alloc] init];
        
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"itemFeatureSection"
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
            json = [json objectForKey:@"itemFeatureSection"];
            ItemFeatureSection* pItemFeatureSection;
            NSArray* arrayKey = [json allKeys];
            for (NSString* pKey in arrayKey)
            {
                pItemFeatureSection = [[ItemFeatureSection getParser] parseDictionary:[json objectForKey:pKey]];
                if (pItemFeatureSection && [pItemFeatureSection isKindOfClass:[ItemFeatureSection class]])
                {
                    [tempDictionary setObject:pItemFeatureSection forKey:pKey];
                }
                
            }
            itemFeatureSectionDictionary = [tempDictionary copy];
        }
    }
    return itemFeatureSectionDictionary;
}

-(ItemFeatureSection *)searchItemFeatureSection:(NSString *)stringId
{
    [self getItemFeatureSectionDictionary];
    if (stringId && [stringId isKindOfClass:[NSString class]] && [stringId length]>0)
    {
        ItemFeatureSection* pItemFeatureSection = [itemFeatureSectionDictionary objectForKey:stringId];
        if (pItemFeatureSection && [pItemFeatureSection isKindOfClass:[ItemFeatureSection class]])
        {
            
        }
        return [itemFeatureSectionDictionary objectForKey:stringId];
    }
    return nil;
}

@end
