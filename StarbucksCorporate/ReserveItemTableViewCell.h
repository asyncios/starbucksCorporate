//
//  ReserveItemTableViewCell.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 5/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReserveItem.h"

@interface ReserveItemTableViewCell : UITableViewCell

#pragma mark - Property Paramters

#pragma mark - Outlet Components

@property (strong, nonatomic) IBOutlet UIView *itemBackgroundView;
@property (strong, nonatomic) IBOutlet UIView *itemContainerView;
@property (strong, nonatomic) IBOutlet UIImageView *itemImageView;
@property (strong, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *itemPriceLabel;

#pragma mark - Outlet Custom Components

#pragma mark - Outlet Constraints

#pragma mark - Delegates

#pragma mark - Data

-(void)setData:(ReserveItem *)pReserveItem;

#pragma mark - Handle Events

#pragma mark - Static Functions

+(NSString *)getReuseIdentifier;

#pragma mark - Useful functions
@end
