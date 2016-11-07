//
//  ReserveItem.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface ReserveItem : NSObject

@property (nonatomic,strong) Item* item;
@property (nonatomic,strong) NSMutableDictionary* selectedItemFeatureDictionary;
@property (nonatomic,strong) NSNumber* finalPrice;
+(ReserveItem*) getReserveItemFrom:(Item*) pItem;
-(void) calculateFinalPrice;
-(double) calculateFinalPriceFromSelectedDictionary:(NSDictionary*) pSelectedDictionary;
@end
