//
//  TypeProductSectionTableViewCell.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 5/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TypeProduct.h"

@interface TypeProductSectionTableViewCell : UITableViewCell

#pragma mark - Outlet Components

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

#pragma mark - Outlet Custom Components


#pragma mark - Outlet Constraints


#pragma mark - Delegates


#pragma mark - Data

-(void)setData:(TypeProduct*) pObject;
-(void)setDataWithTitle:(NSString*) pTitle;

#pragma mark - Handle Events


#pragma mark - Static Functions

+(NSString *)getReuseIdentifier;
+(double)getCellHeight;

#pragma mark - Useful functions

@end
