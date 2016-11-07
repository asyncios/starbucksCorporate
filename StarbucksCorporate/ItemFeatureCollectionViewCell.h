//
//  ItemFeatureCollectionViewCell.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 7/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemFeature.h"

@interface ItemFeatureCollectionViewCell : UICollectionViewCell

#pragma mark - Property Paramters

#pragma mark - Outlet Components

@property (strong, nonatomic) IBOutlet UIView *itemFeatureBackgroundView;
@property (strong, nonatomic) IBOutlet UIView *itemFeatureContainerView;
@property (strong, nonatomic) IBOutlet UILabel *itemFeatureNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *itemFeatureAditionalPriceLabel;

#pragma mark - Outlet Custom Components

#pragma mark - Outlet Constraints

#pragma mark - Delegates

//Section for changes IBOutlet of components like CustomLabel, CustomScrollView, etc
//@property id<CustomDelegate> customDelegate;

#pragma mark - Data

//Section for pass Data to component
-(void)setData:(ItemFeature*)pItemFeature isSelected:(BOOL)isSelected;

#pragma mark - Handle Events

#pragma mark - Static Functions

+(NSString *)getReuseIdentifier;

#pragma mark - Useful functions

@end
