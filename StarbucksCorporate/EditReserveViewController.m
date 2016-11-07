//
//  EditReserveViewController.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 6/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "EditReserveViewController.h"
#import "Util.h"
#import "ItemFeatureSectionCollectionReusableView.h"
#import "ItemFeatureCollectionViewCell.h"
#import "ItemFeatureSectionDao.h"
#import "ItemFeatureDao.h"

@interface EditReserveViewController ()
{
    NSMutableDictionary* editSelectedFeatureDictionary;
}

@end

@implementation EditReserveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self buildItemNameLabel];
    [self buildItemDescriptionLabel];
    [self buildItemPriceLabel];
    [self buildItemFinalPriceLabel];
    [self buildItemFeatureSectionCollectionView];
    
    if (self.reserveItem &&
        [self.reserveItem isKindOfClass:[ReserveItem class]])
    {
        if (self.reserveItem.selectedItemFeatureDictionary &&
            [self.reserveItem.selectedItemFeatureDictionary isKindOfClass:[NSMutableDictionary class]])
        {
            editSelectedFeatureDictionary = [self.reserveItem.selectedItemFeatureDictionary mutableCopy];
        }
        
        
        if (self.reserveItem.item && [self.reserveItem.item isKindOfClass:[Item class]])
        {
            //itemNameLabel
            self.itemNameLabel.text = self.reserveItem.item.itemName;
            
            //itemDescriptionLabel
            self.itemDescriptionLabel.text = self.reserveItem.item.itemDescription;
            
            //itemPriceLabel
            NSNumber* pNumber;
            pNumber = [Util stringToNumber:self.reserveItem.item.itemBasicPrice];
            if (pNumber && [pNumber isKindOfClass:[NSNumber class]])
            {
                self.itemPriceLabel.text = [NSString stringWithFormat:@"Precio Base: %.2lf",[pNumber doubleValue]];
            }
            
            //itemFinalPriceLabel
            double pFinalPrice = [self.reserveItem calculateFinalPriceFromSelectedDictionary:editSelectedFeatureDictionary];
            self.itemFinalPriceLabel.text = [NSString stringWithFormat:@"Precio Final: %.2lf",pFinalPrice];
            
            NSString* imageId = [NSString stringWithFormat:@"imagen%@",self.reserveItem.item.itemId];
            UIImage* pImage = [UIImage imageNamed:imageId];
            self.itemImageView.image=[UIImage imageNamed:imageId];
        }
        
        
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Build Components

-(void) buildItemNameLabel
{
    self.itemNameLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.itemNameLabel.textColor = [UIColor blackColor];
    self.itemNameLabel.text = @"";
}

-(void) buildItemDescriptionLabel
{
    self.itemDescriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.itemDescriptionLabel.textColor = [UIColor blackColor];
    self.itemDescriptionLabel.text = @"";
}

-(void) buildItemPriceLabel
{
    self.itemPriceLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.itemPriceLabel.textColor = [UIColor blackColor];
    self.itemPriceLabel.text = @"";
}

-(void) buildItemFinalPriceLabel
{
    self.itemFinalPriceLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.itemFinalPriceLabel.textColor = [UIColor blackColor];
    self.itemFinalPriceLabel.text = @"";
}

-(void) buildItemFeatureSectionCollectionView
{
    NSString* reuseIdentifier = [ItemFeatureSectionCollectionReusableView getReuseIdentifier];
    [self.itemFeatureSectionCollectionView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier];
    
    reuseIdentifier = [ItemFeatureCollectionViewCell getReuseIdentifier];
    [self.itemFeatureSectionCollectionView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    double pItemWidth = 540;
    pItemWidth-=0;
    pItemWidth/=3;
    flowLayout.headerReferenceSize = CGSizeMake(self.itemFeatureSectionCollectionView.frame.size.width, 30.f);
    [flowLayout setItemSize:CGSizeMake(150, 80)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [flowLayout setMinimumLineSpacing:0.0f];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [self.itemFeatureSectionCollectionView setCollectionViewLayout:flowLayout];
    self.itemFeatureSectionCollectionView.delegate = self;
    self.itemFeatureSectionCollectionView.dataSource = self;
}

#pragma mark - Data

#pragma mark - Handle Events

#pragma mark - Static Functions

#pragma mark - Useful functions

#pragma mark - CollectionViewDelegate

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSString* reuseIdentifier = [ItemFeatureSectionCollectionReusableView getReuseIdentifier];
    ItemFeatureSectionCollectionReusableView* pView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString* sectionId = [self.reserveItem.item.itemFeatureSectionIdArray objectAtIndex:indexPath.section];
    ItemFeatureSection* pItemFeatureSection = [[ItemFeatureSectionDao sharedInstance] searchItemFeatureSection:sectionId];
    if (pItemFeatureSection && [pItemFeatureSection isKindOfClass:[ItemFeatureSection class]])
    {
        [pView setDataWithTitle:pItemFeatureSection.itemFeatureSectionName];
    }
    return pView;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* reuseIdentifier = [ItemFeatureCollectionViewCell getReuseIdentifier];
    ItemFeatureCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString* sectionId = [self.reserveItem.item.itemFeatureSectionIdArray objectAtIndex:indexPath.section];
    ItemFeatureSection* pItemFeatureSection = [[ItemFeatureSectionDao sharedInstance] searchItemFeatureSection:sectionId];
    if (pItemFeatureSection && [pItemFeatureSection isKindOfClass:[ItemFeatureSection class]])
    {
        NSString* pItemId = [pItemFeatureSection.itemFeatureIdArray objectAtIndex:indexPath.row];
        ItemFeature*pItemFeature = [[ItemFeatureDao sharedInstance] searchItemFeature:pItemId];
        if (pItemFeature && [pItemFeature isKindOfClass:[ItemFeature class]])
        {
            NSString* pSelectedFeatureId = [editSelectedFeatureDictionary objectForKey:sectionId];
            NSNumber* pNumber = [Util stringToNumber:pSelectedFeatureId];
            BOOL isSelected = NO;
            if (pNumber && [pNumber isKindOfClass:[NSNumber class]]) {
                isSelected = indexPath.row==[pNumber integerValue];
            }
            [cell setData:pItemFeature isSelected:isSelected];
        }
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* sectionId = [self.reserveItem.item.itemFeatureSectionIdArray objectAtIndex:indexPath.section];
    [editSelectedFeatureDictionary setObject:[NSString stringWithFormat:@"%ld",indexPath.row] forKey:sectionId];
    double pFinalPrice = [self.reserveItem calculateFinalPriceFromSelectedDictionary:editSelectedFeatureDictionary];
    self.itemFinalPriceLabel.text = [NSString stringWithFormat:@"Precio Final: %.2lf",pFinalPrice];
    [self.itemFeatureSectionCollectionView reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.reserveItem.item.itemFeatureSectionIdArray count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSString* sectionId = [self.reserveItem.item.itemFeatureSectionIdArray objectAtIndex:section];
    ItemFeatureSection* pItemFeatureSection = [[ItemFeatureSectionDao sharedInstance] searchItemFeatureSection:sectionId];
    if (pItemFeatureSection && [pItemFeatureSection isKindOfClass:[ItemFeatureSection class]])
    {
        return [pItemFeatureSection.itemFeatureIdArray count];
    }
    return 0;
}


- (IBAction)doneTouchUp:(id)sender
{
    self.reserveItem.selectedItemFeatureDictionary= [editSelectedFeatureDictionary mutableCopy];
    [self.editDelegate doneEdit];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deleteTouchUp:(id)sender
{
    [self.editDelegate deleteEdit];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelTouchUp:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
