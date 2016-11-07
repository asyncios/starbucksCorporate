//
//  ViewController.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 4/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ViewController.h"
#import "TypeProductDao.h"
#import "ItemDao.h"
#import "TypeProductSectionTableViewCell.h"
#import "ProductTableViewCell.h"
#import "ItemCollectionViewCell.h"
#import "ReserveItemTableViewCell.h"
#import "ReserveItem.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray* typeProductArray;
    NSMutableArray* reserveItemArray;
    double reserveFinalPrice;
    Product* selectedProduct;
    ReserveItem* selectedReserveItem;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    typeProductArray = [[TypeProductDao sharedInstance] getTypeProductArray];
    reserveItemArray = [[NSMutableArray alloc] init];
    reserveFinalPrice = 0.0f;
    [self buildMasterTableView];
    [self buildDetailCollectionView];
    [self buildPurchaseTableView];
    [self.masterTableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Build Components

//Section for changes styles of components, fonts, textColor, etc
-(void) buildMasterTableView
{
    self.masterTableView.delegate = self;
    self.masterTableView.dataSource = self;
    self.masterTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void) buildPurchaseTableView
{
    self.purchaseTableView.delegate = self;
    self.purchaseTableView.dataSource = self;
    self.purchaseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(void) buildDetailCollectionView
{
    NSString* reuseIdentifier = [ItemCollectionViewCell getReuseIdentifier];
    [self.detailCollectionView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    double pItemWidth = [UIScreen mainScreen].bounds.size.width;
    pItemWidth-=self.masterTableViewWidthConstraint.constant;
    pItemWidth/=3;
    [flowLayout setItemSize:CGSizeMake(pItemWidth, 100)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [flowLayout setMinimumLineSpacing:0.0f];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [self.detailCollectionView setCollectionViewLayout:flowLayout];
    self.detailCollectionView.delegate = self;
    self.detailCollectionView.dataSource = self;
}

-(void) buildPurchaseButton
{
    NSString* amountToPay = [NSString stringWithFormat:@"Total a Pagar: %.2lf",reserveFinalPrice];
    [self.purchaseButton setTitle:amountToPay forState:UIControlStateNormal];
    [self.purchaseButton setTitle:amountToPay forState:UIControlStateSelected];
    [self.purchaseButton setTitle:amountToPay forState:UIControlStateHighlighted];
}

#pragma mark - Data


#pragma mark - Handle Events


#pragma mark - Static Functions


#pragma mark - Useful functions

#pragma mark - TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.masterTableView==tableView)
    {
        return [typeProductArray count];
    }
    else if (self.purchaseTableView==tableView)
    {
        if (reserveItemArray &&
            [reserveItemArray isKindOfClass:[NSArray class]] &&
            [reserveItemArray count]>0)
        {
            return 1;
        }
        return 0;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.masterTableView==tableView)
    {
        TypeProduct* pTypeProduct = [typeProductArray objectAtIndex:section];
        return [pTypeProduct.productArray count];
    }
    else if (self.purchaseTableView==tableView)
    {
        return [reserveItemArray count];
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.masterTableView==tableView)
    {
        NSString *MyIdentifier = [TypeProductSectionTableViewCell getReuseIdentifier];
        TypeProductSectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil){
            [tableView registerNib:[UINib nibWithNibName:MyIdentifier bundle:nil] forCellReuseIdentifier:MyIdentifier];
            cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        }
        
        TypeProduct* pTypeProduct = [typeProductArray objectAtIndex:section];
        [cell setData:pTypeProduct];
        return cell.contentView;
    }
    else if (self.purchaseTableView==tableView)
    {
        NSString *MyIdentifier = [TypeProductSectionTableViewCell getReuseIdentifier];
        TypeProductSectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil){
            [tableView registerNib:[UINib nibWithNibName:MyIdentifier bundle:nil] forCellReuseIdentifier:MyIdentifier];
            cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        }
        
        NSString* pTitle = @"Tu Orden";
        [cell setDataWithTitle:pTitle];
        return cell.contentView;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.masterTableView==tableView)
    {
        return 30.0f;
    }
    else if (self.purchaseTableView==tableView)
    {
        return 50.0f;
    }
    return 0.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.masterTableView==tableView)
    {
        NSString *MyIdentifier = [ProductTableViewCell getReuseIdentifier];
        ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil){
            [tableView registerNib:[UINib nibWithNibName:MyIdentifier bundle:nil] forCellReuseIdentifier:MyIdentifier];
            cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        }
        
        TypeProduct* pTypeProduct = [typeProductArray objectAtIndex:indexPath.section];
        Product* pProduct = [pTypeProduct.productArray objectAtIndex:indexPath.row];
        [cell setData:pProduct];
        return cell;
    }
    else if (self.purchaseTableView==tableView)
    {
        NSString *MyIdentifier = [ReserveItemTableViewCell getReuseIdentifier];
        ReserveItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if (cell == nil){
            [tableView registerNib:[UINib nibWithNibName:MyIdentifier bundle:nil] forCellReuseIdentifier:MyIdentifier];
            cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        }
        
        ReserveItem* pReserveItem = [reserveItemArray objectAtIndex:indexPath.row];
        [cell setData:pReserveItem];
        return cell;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.masterTableView==tableView)
    {
        return 44.0f;
    }
    else if (self.purchaseTableView==tableView)
    {
        return 110.0f;
    }
    return 44.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.masterTableView==tableView)
    {
        return 44.0f;
    }
    else if (self.purchaseTableView==tableView)
    {
        return 110.0f;
    }
    return 44.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.masterTableView==tableView)
    {
        TypeProduct* pTypeProduct = [typeProductArray objectAtIndex:indexPath.section];
        Product* pProduct = [pTypeProduct.productArray objectAtIndex:indexPath.row];
        selectedProduct = pProduct;
        [self.detailCollectionView reloadData];
    }
    else if (self.purchaseTableView==tableView)
    {
        EditReserveViewController* vc = [[EditReserveViewController alloc] init];
        vc.modalPresentationStyle=UIModalPresentationFormSheet;
        vc.reserveItem = [reserveItemArray objectAtIndex:indexPath.row];
        vc.editDelegate = self;
        selectedReserveItem=[reserveItemArray objectAtIndex:indexPath.row];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

#pragma mark - CollectionViewDelegate

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* reuseIdentifier = [ItemCollectionViewCell getReuseIdentifier];
    ItemCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString* itemId = selectedProduct.itemArray[indexPath.row];
    if (itemId && [itemId isKindOfClass:[NSString class]]) {
        Item* pItem = [[ItemDao sharedInstance] searchItem:itemId];
        [cell setData:pItem];
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* itemId = [selectedProduct.itemArray objectAtIndex:indexPath.row];
    Item* pItem = [[ItemDao sharedInstance] searchItem:itemId];
    ReserveItem* pReserveItem = [ReserveItem getReserveItemFrom:pItem];
    if (pItem && [pItem isKindOfClass:[Item class]])
    {
        [reserveItemArray addObject:pReserveItem];
        reserveFinalPrice+=[pReserveItem.finalPrice doubleValue];
        NSString* amountToPay = [NSString stringWithFormat:@"Total a Pagar: %.2lf",reserveFinalPrice];
        [self.purchaseButton setTitle:amountToPay forState:UIControlStateNormal];
        [self.purchaseButton setTitle:amountToPay forState:UIControlStateSelected];
        [self.purchaseButton setTitle:amountToPay forState:UIControlStateHighlighted];
        [self.purchaseTableView reloadData];
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (selectedProduct) {
        return [selectedProduct.itemArray count];
    }
    return 0;
}

#pragma mark - EditReserveViewControllerProtocol

-(void)doneEdit
{
    [self.purchaseTableView reloadData];
}

-(void)deleteEdit
{
    if (selectedReserveItem && [selectedReserveItem isKindOfClass:[ReserveItem class]])
    {
        [reserveItemArray removeObject:selectedReserveItem];
        [self.purchaseTableView reloadData];
    }
}

@end
