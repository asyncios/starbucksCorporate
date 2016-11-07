//
//  ItemFeatureCollectionViewCell.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 7/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ItemFeatureCollectionViewCell.h"
#import "Util.h"

@implementation ItemFeatureCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self buildItemFeatureNameLabel];
    [self buildItemFeatureAditionalPriceLabel];
}

#pragma mark - Build Components

//Section for changes styles of components, fonts, textColor, etc
-(void) buildItemFeatureNameLabel
{
    self.itemFeatureNameLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.itemFeatureNameLabel.textColor = [UIColor blackColor];
}

-(void) buildItemFeatureAditionalPriceLabel
{
    self.itemFeatureAditionalPriceLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.itemFeatureAditionalPriceLabel.textColor = [UIColor blackColor];
}

#pragma mark - Data

-(void)setData:(ItemFeature*)pItemFeature isSelected:(BOOL)isSelected
{
    self.itemFeatureNameLabel.text = @"";
    self.itemFeatureAditionalPriceLabel.text = @"";
    if (pItemFeature && [pItemFeature isKindOfClass:[ItemFeature class]])
    {
        self.itemFeatureNameLabel.text = pItemFeature.itemFeatureName;
        
        NSNumber* pNumber = [Util stringToNumber:pItemFeature.itemFeatureAdicionalPrice];
        if (pNumber && [pNumber isKindOfClass:[NSNumber class]])
        {
            self.itemFeatureAditionalPriceLabel.text = [NSString stringWithFormat:@"+ %.2lf",[pNumber doubleValue]];
        }
        
        if (isSelected)
        {
            self.itemFeatureContainerView.backgroundColor=[UIColor grayColor];
        }
        else
        {
            self.itemFeatureContainerView.backgroundColor=[UIColor whiteColor];
        }
    }
}

#pragma mark - Handle Events


#pragma mark - Static Functions

+(NSString *)getReuseIdentifier
{
    return @"ItemFeatureCollectionViewCell";
}

#pragma mark - Useful functions

//Section for other functions
@end
