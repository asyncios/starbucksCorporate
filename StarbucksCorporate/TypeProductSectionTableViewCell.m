//
//  TypeProductSectionTableViewCell.m
//  StarbucksCorporate
//
//  Created by josue cadillo on 5/11/16.
//  Copyright © 2016 josue cadillo. All rights reserved.
//

#import "TypeProductSectionTableViewCell.h"

@implementation TypeProductSectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self buildTitleLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Build Components

//Section for changes styles of components, fonts, textColor, etc
-(void) buildTitleLabel
{
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
    self.titleLabel.textColor = [UIColor blackColor];
}

#pragma mark - Data

-(void)setData:(TypeProduct*) pObject
{
    self.titleLabel.text = @"";
    if (pObject && [pObject isKindOfClass:[TypeProduct class]])
    {
        self.titleLabel.text = pObject.typeProductName;
    }

}
-(void)setDataWithTitle:(NSString*) pTitle
{
    self.titleLabel.text = @"";
    if (pTitle && [pTitle isKindOfClass:[NSString class]])
    {
        self.titleLabel.text = pTitle;
    }
}
#pragma mark - Handle Events


#pragma mark - Static Functions

+(NSString *)getReuseIdentifier
{
    return @"TypeProductSectionTableViewCell";
}

+(double)getCellHeight
{
    return 44.0f;
}

#pragma mark - Useful functions


@end
