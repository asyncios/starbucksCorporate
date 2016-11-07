//
//  ItemCollectionViewCell.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 5/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface ItemCollectionViewCell : UICollectionViewCell

#pragma mark - Property Paramters

#pragma mark - Outlet Components

@property (strong, nonatomic) IBOutlet UIView *itemBackgroundView;
@property (strong, nonatomic) IBOutlet UIView *itemContainerView;
@property (strong, nonatomic) IBOutlet UIImageView *itemImageView;
@property (strong, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *itemDescriptionLabel;

#pragma mark - Outlet Custom Components

#pragma mark - Outlet Constraints

#pragma mark - Delegates

#pragma mark - Data

-(void)setData:(Item*) pItem;

#pragma mark - Handle Events

#pragma mark - Static Functions

+(NSString *)getReuseIdentifier;

#pragma mark - Useful functions

@end
