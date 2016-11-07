//
//  ItemDao.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 5/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface ItemDao : NSObject

+ (ItemDao*)sharedInstance;
-(NSDictionary*) getItemDictionary;
-(Item*) searchItem:(NSString*) stringId;

@end
