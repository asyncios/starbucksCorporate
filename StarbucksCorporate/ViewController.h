//
//  ViewController.h
//  StarbucksCorporate
//
//  Created by josue cadillo on 4/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditReserveViewController.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,
                                             UICollectionViewDelegate,UICollectionViewDataSource,EditReserveViewControllerProtocol>

@property (strong, nonatomic) IBOutlet UIButton *purchaseButton;
@property (strong, nonatomic) IBOutlet UITableView *masterTableView;
@property (strong, nonatomic) IBOutlet UITableView *purchaseTableView;
@property (strong, nonatomic) IBOutlet UICollectionView *detailCollectionView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *masterTableViewWidthConstraint;

@end

