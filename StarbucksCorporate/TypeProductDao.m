//
//  TypeProductDao.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 4/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "TypeProductDao.h"
#import "TypeItemDao.h"
#import "ItemDao.h"
#import "ItemFeatureDao.h"
#import "ItemFeatureSectionDao.h"

@implementation TypeProductDao
{
    NSArray* typeProductArray;
    NSDictionary* typeProductDictionary;
}

+ (TypeProductDao*)sharedInstance
{
    static TypeProductDao *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TypeProductDao alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(NSArray*) getTypeProductArray
{
    [[ItemFeatureDao sharedInstance] getItemFeatureDictionary];
    [[ItemFeatureSectionDao sharedInstance] getItemFeatureSectionDictionary];
    [[TypeItemDao sharedInstance] getTypeItemDictionary];
    [[ItemDao sharedInstance] getItemDictionary];
    if (!typeProductArray)
    {
        NSMutableDictionary* tempDictionary = [[NSMutableDictionary alloc] init];
        NSMutableArray* tempArray = [[NSMutableArray alloc] init];
        TypeProduct* pTypeProduct;
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"typeProduct"
                                                             ofType:@"json"
                                                        inDirectory:@"Data"];
        NSData *starbucksData = [[NSData alloc] initWithContentsOfFile:fileName];
        NSError *error;
        NSDictionary *typeProductJson = [NSJSONSerialization JSONObjectWithData:starbucksData
                                                              options:0
                                                                error:&error];
        
        if (error) {
            NSLog(@"Something went wrong! %@", error.localizedDescription);
            return nil;
        }
        else {
            NSArray* typeProductArrayJson = [typeProductJson objectForKey:@"typeProduct"];
            for (NSDictionary* pDict in typeProductArrayJson)
            {
                pTypeProduct = [[TypeProduct getParser] parseDictionary:pDict];
                if (pTypeProduct && [pTypeProduct isKindOfClass:[TypeProduct class]])
                {
                    [tempDictionary setObject:pTypeProduct forKey:pTypeProduct.typeProductId];
                    [tempArray addObject:pTypeProduct];
                }
                
            }
        }
        
        typeProductArray = [tempArray copy];
        typeProductDictionary = [tempDictionary copy];
    }
    return typeProductArray;
}

-(TypeProduct*) searchTypeProduct:(NSString*) stringId
{
    [self getTypeProductArray];
    if (stringId && [stringId isKindOfClass:[NSString class]] && [stringId length]>0)
    {
        return [typeProductDictionary objectForKey:stringId];
    }
    return nil;
}
@end
