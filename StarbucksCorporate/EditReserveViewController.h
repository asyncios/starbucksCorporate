//
//  EditReserveViewController.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReserveItem.h"
@protocol EditReserveViewControllerProtocol

-(void) doneEdit;
-(void) deleteEdit;

@end

@interface EditReserveViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

#pragma mark - Property Paramters
@property (strong,nonatomic) ReserveItem * reserveItem;

#pragma mark - Outlet Components

@property (strong, nonatomic) IBOutlet UIView *itemBackgroundView;
@property (strong, nonatomic) IBOutlet UIView *itemContainerView;
@property (strong, nonatomic) IBOutlet UIImageView *itemImageView;
@property (strong, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *itemDescriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *itemFinalPriceLabel;
@property (strong, nonatomic) IBOutlet UICollectionView *itemFeatureSectionCollectionView;

#pragma mark - Outlet Custom Components

#pragma mark - Outlet Constraints

#pragma mark - Delegates
@property id<EditReserveViewControllerProtocol> editDelegate;

#pragma mark - Data

#pragma mark - Handle Events
- (IBAction)doneTouchUp:(id)sender;
- (IBAction)deleteTouchUp:(id)sender;
- (IBAction)cancelTouchUp:(id)sender;


#pragma mark - Static Functions

#pragma mark - Useful functions

@end
