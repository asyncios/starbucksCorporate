//
//  TypeItemDao.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "TypeItemDao.h"

@implementation TypeItemDao
{
    NSDictionary* typeItemDictionary;
}

+ (TypeItemDao*)sharedInstance
{
    static TypeItemDao *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TypeItemDao alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(NSDictionary*) getTypeItemDictionary
{
    if (!typeItemDictionary)
    {
        NSMutableDictionary* tempDictionary = [[NSMutableDictionary alloc] init];
        
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"typeItem"
                                                             ofType:@"json"
                                                        inDirectory:@"Data"];
        NSData *starbucksData = [[NSData alloc] initWithContentsOfFile:fileName];
        NSError *error;
        NSDictionary *typeItemJson = [NSJSONSerialization JSONObjectWithData:starbucksData
                                                                 options:0
                                                                   error:&error];
        if (error)
        {
            return nil;
        }
        else
        {
            typeItemJson = [typeItemJson objectForKey:@"typeItem"];
            TypeItem* pItem;
            NSArray* arrayKey = [typeItemJson allKeys];
            for (NSString* pKey in arrayKey)
            {
                pItem = [[TypeItem getParser] parseDictionary:[typeItemJson objectForKey:pKey]];
                if (pItem && [pItem isKindOfClass:[TypeItem class]])
                {
                    [tempDictionary setObject:pItem forKey:pKey];
                }
                
            }
            typeItemDictionary = [tempDictionary copy];
        }
    }
    return typeItemDictionary;
}

-(TypeItem*) searchTypeItem:(NSString*) stringId
{
    [self getTypeItemDictionary];
    if (stringId && [stringId isKindOfClass:[NSString class]] && [stringId length]>0)
    {
        return [typeItemDictionary objectForKey:stringId];
    }
    return nil;
}

@end
