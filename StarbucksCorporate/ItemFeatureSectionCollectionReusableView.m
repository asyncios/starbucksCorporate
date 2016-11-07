//
//  ItemFeatureSectionCollectionReusableView.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 7/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "ItemFeatureSectionCollectionReusableView.h"

@implementation ItemFeatureSectionCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self buildTitleLabel];
}

#pragma mark - Build Components

//Section for changes styles of components, fonts, textColor, etc
-(void) buildTitleLabel
{
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.titleLabel.textColor = [UIColor blackColor];
}

#pragma mark - Data

-(void)setDataWithTitle:(NSString *)pTitle
{
    self.titleLabel.text = @"";
    if (pTitle && [pTitle isKindOfClass:[NSString class]])
    {
        self.titleLabel.text = pTitle;
    }
}

#pragma mark - Handle Events

//Section for Handle Events, Touch Events, etc
//-(IBAction)labelTouchUp:(id) sender
//{
//
//}

#pragma mark - Static Functions

//Only Static functions, like getReuseIdentifier, getCellHeight, etc
+(NSString *)getReuseIdentifier
{
    return @"ItemFeatureSectionCollectionReusableView";
}

#pragma mark - Useful functions

//Section for other functions
@end
