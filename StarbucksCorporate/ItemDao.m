//
//  ItemDao.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 5/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ItemDao.h"
#import "TypeItemDao.h"

@implementation ItemDao
{
    NSDictionary* itemDictionary;
}

+ (ItemDao*)sharedInstance
{
    static ItemDao *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ItemDao alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(NSDictionary*) getItemDictionary
{
    if (!itemDictionary)
    {
        NSMutableDictionary* tempDictionary = [[NSMutableDictionary alloc] init];
        
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"item"
                                                             ofType:@"json"
                                                        inDirectory:@"Data"];
        NSData *starbucksData = [[NSData alloc] initWithContentsOfFile:fileName];
        NSError *error;
        NSDictionary *itemJson = [NSJSONSerialization JSONObjectWithData:starbucksData
                                                                        options:0
                                                                          error:&error];
        if (error)
        {
            return nil;
        }
        else
        {
            itemJson = [itemJson objectForKey:@"item"];
            Item* pItem;
            NSArray* arrayKey = [itemJson allKeys];
            for (NSString* pKey in arrayKey)
            {
                pItem = [[Item getParser] parseDictionary:[itemJson objectForKey:pKey]];
                if (pItem && [pItem isKindOfClass:[Item class]])
                {
                    [tempDictionary setObject:pItem forKey:pKey];
                }
                
            }
            itemDictionary = [tempDictionary copy];
        }
    }
    return itemDictionary;
}

-(Item*) searchItem:(NSString*) stringId
{
    [self getItemDictionary];
    if (stringId && [stringId isKindOfClass:[NSString class]] && [stringId length]>0)
    {
        Item* pItem = [itemDictionary objectForKey:stringId];
        if (pItem && [pItem isKindOfClass:[Item class]])
        {
            
        }
        return [itemDictionary objectForKey:stringId];
    }
    return nil;
}
@end
