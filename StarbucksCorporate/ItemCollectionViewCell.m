//
//  ItemCollectionViewCell.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 5/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ItemCollectionViewCell.h"

@implementation ItemCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self buildItemNameLabel];
    [self buildItemDescriptionLabel];
}

#pragma mark - Build Components

-(void) buildItemNameLabel
{
    self.itemNameLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.itemNameLabel.textColor = [UIColor blackColor];
}

-(void) buildItemDescriptionLabel
{
    self.itemDescriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.itemDescriptionLabel.textColor = [UIColor blackColor];
}

#pragma mark - Data

-(void)setData:(Item *)pItem
{
    self.itemImageView.image=nil;
    self.itemNameLabel.text = @"";
    self.itemDescriptionLabel.text = @"";
    self.itemImageView.image=nil;
    
    if (pItem && [pItem isKindOfClass:[Item class]])
    {
        if (pItem.itemName &&
            [pItem.itemName isKindOfClass:[NSString class]])
        {
            self.itemNameLabel.text = pItem.itemName;
        }
        
        if (pItem.itemDescription &&
            [pItem.itemDescription isKindOfClass:[NSString class]])
        {
            self.itemDescriptionLabel.text = pItem.itemDescription;
        }
        NSString* imageId = [NSString stringWithFormat:@"imagen%@",pItem.itemId];
        self.itemImageView.image=[UIImage imageNamed:imageId];
    }
    
}

#pragma mark - Handle Events

#pragma mark - Static Functions

+(NSString *)getReuseIdentifier
{
    return @"ItemCollectionViewCell";
}

#pragma mark - Useful functions


@end
