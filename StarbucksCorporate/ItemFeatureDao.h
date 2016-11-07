//
//  ItemFeatureDao.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemFeature.h"

@interface ItemFeatureDao : NSObject

+ (ItemFeatureDao*)sharedInstance;
-(NSDictionary*) getItemFeatureDictionary;
-(ItemFeature*) searchItemFeature:(NSString*) stringId;

@end
