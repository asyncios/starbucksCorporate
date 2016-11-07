//
//  ReserveItem.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ReserveItem.h"
#import "ItemFeatureSectionDao.h"
#import "ItemFeatureDao.h"
#import "Util.h"

@implementation ReserveItem

+(ReserveItem*) getReserveItemFrom:(Item*) pItem
{
    ReserveItem* pReserveItem = [[ReserveItem alloc] init];
    pReserveItem.item = pItem;
    pReserveItem.selectedItemFeatureDictionary = [[NSMutableDictionary alloc] init];
    for (NSString* pItemFeatureSectionId in pItem.itemFeatureSectionIdArray)
    {
        ItemFeatureSection* pItemSection = [[ItemFeatureSectionDao sharedInstance] searchItemFeatureSection:pItemFeatureSectionId];
        if (pItemSection && [pItemSection isKindOfClass:[ItemFeatureSection class]])
        {
            if (pItemSection.itemFeatureSectionDefaultId && [pItemSection.itemFeatureSectionDefaultId isKindOfClass:[NSString class]] &&
                pItemSection.itemFeatureSectionId && [pItemSection.itemFeatureSectionId isKindOfClass:[NSString class]] )
            {
                [pReserveItem.selectedItemFeatureDictionary setObject:pItemSection.itemFeatureSectionDefaultId forKey:pItemSection.itemFeatureSectionId];
            }
            
        }
    }
    [pReserveItem calculateFinalPrice];
    return pReserveItem;
}

-(void)calculateFinalPrice
{
    double pFinalPrice = [self calculateFinalPriceFromSelectedDictionary:self.selectedItemFeatureDictionary];
    self.finalPrice = [NSNumber numberWithDouble:pFinalPrice];
}

-(double) calculateFinalPriceFromSelectedDictionary:(NSDictionary*) pSelectedDictionary
{
    double pFinalPrice = 0.0f;
    if (self.item && [self.item isKindOfClass:[Item class]] &&
        self.item.itemBasicPrice && [self.item.itemBasicPrice isKindOfClass:[NSString class]])
    {
        NSNumber* pPriceNumber;
        pPriceNumber = [Util stringToNumber:self.item.itemBasicPrice];
        if (pPriceNumber && [pPriceNumber isKindOfClass:[NSNumber class]])
        {
            pFinalPrice += [pPriceNumber doubleValue];
        }
        pPriceNumber=nil;
        NSArray* pSelectedKeyArray = [pSelectedDictionary allKeys];
        for (NSString* sKey in pSelectedKeyArray)
        {
            
            if (sKey && [sKey isKindOfClass:[NSString class]])
            {
                ItemFeatureSection* pItemFeatureSection = [[ItemFeatureSectionDao sharedInstance] searchItemFeatureSection:sKey];
                NSString* sSelectedKey = [pSelectedDictionary objectForKey:sKey];
                NSNumber* pNumber = [Util stringToNumber:sSelectedKey];
                if (pNumber && [pNumber isKindOfClass:[NSNumber class]])
                {
                    NSString* pItemFeatureId = [pItemFeatureSection.itemFeatureIdArray objectAtIndex:[pNumber integerValue]];
                    ItemFeature* pItemFeature = [[ItemFeatureDao sharedInstance] searchItemFeature:pItemFeatureId];
                    if (pItemFeature && [pItemFeature isKindOfClass:[pItemFeature class]])
                    {
                        pPriceNumber = [Util stringToNumber:pItemFeature.itemFeatureAdicionalPrice];
                    }
                }
            }
            if (pPriceNumber && [pPriceNumber isKindOfClass:[NSNumber class]])
            {
                pFinalPrice += [pPriceNumber doubleValue];
            }
        }
    }
    
    return pFinalPrice;
}
@end
