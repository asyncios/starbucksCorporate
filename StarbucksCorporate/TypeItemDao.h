//
//  TypeItemDao.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TypeItem.h"

@interface TypeItemDao : NSObject

+ (TypeItemDao*)sharedInstance;
-(NSDictionary*) getTypeItemDictionary;
-(TypeItem*) searchTypeItem:(NSString*) stringId;

@end
