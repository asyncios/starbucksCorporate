//
//  ReserveItemTableViewCell.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 5/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ReserveItemTableViewCell.h"

@implementation ReserveItemTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self buildItemNameLabel];
    [self buildItemDescriptionLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - Build Components

-(void) buildItemNameLabel
{
    self.itemNameLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.itemNameLabel.textColor = [UIColor blackColor];
}

-(void) buildItemDescriptionLabel
{
    self.itemPriceLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.itemPriceLabel.textColor = [UIColor blackColor];
}

#pragma mark - Data

-(void)setData:(ReserveItem *)pReserveItem
{
    self.itemImageView.image=nil;
    self.itemNameLabel.text = @"";
    self.itemPriceLabel.text = @"";
    
    if (pReserveItem && [pReserveItem isKindOfClass:[ReserveItem class]] &&
        pReserveItem.item && [pReserveItem.item isKindOfClass:[Item class]])
    {
        if (pReserveItem.item.itemName &&
            [pReserveItem.item.itemName isKindOfClass:[NSString class]])
        {
            self.itemNameLabel.text = pReserveItem.item.itemName;
        }
        
        [pReserveItem calculateFinalPrice];
        if (pReserveItem.finalPrice &&
            [pReserveItem.finalPrice isKindOfClass:[NSNumber class]])
        {
            self.itemPriceLabel.text = [NSString stringWithFormat:@"Precio: %.2lf",[pReserveItem.finalPrice doubleValue]];
        }
        
        NSString* imageId = [NSString stringWithFormat:@"imagen%@",pReserveItem.item.itemId];
        self.itemImageView.image=[UIImage imageNamed:imageId];
    }
}

#pragma mark - Handle Events

#pragma mark - Static Functions

+(NSString *)getReuseIdentifier
{
    return @"ReserveItemTableViewCell";
}

#pragma mark - Useful functions




@end
