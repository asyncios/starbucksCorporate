//
//  ItemFeatureSectionDao.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemFeatureSection.h"
@interface ItemFeatureSectionDao : NSObject

+ (ItemFeatureSectionDao*)sharedInstance;
-(NSDictionary*) getItemFeatureSectionDictionary;
-(ItemFeatureSection*) searchItemFeatureSection:(NSString*) stringId;

@end
