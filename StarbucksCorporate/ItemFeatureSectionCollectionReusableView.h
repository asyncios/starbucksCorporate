//
//  ItemFeatureSectionCollectionReusableView.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 7/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemFeatureSectionCollectionReusableView : UICollectionReusableView

#pragma mark - Property Paramters

#pragma mark - Outlet Components

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

#pragma mark - Outlet Custom Components


#pragma mark - Outlet Constraints

#pragma mark - Delegates


#pragma mark - Data

//Section for pass Data to component
-(void)setDataWithTitle:(NSString*) pTitle;

#pragma mark - Handle Events

#pragma mark - Static Functions
+(NSString *)getReuseIdentifier;

#pragma mark - Useful functions

//Section for other functions
@end
