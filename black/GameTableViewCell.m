//
//  GameTableViewCell.m
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "GameTableViewCell.h"

@implementation GameTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(163, 5, 60, 50)];
    self.textField.placeholder = @"game";
    [self.contentView addSubview:self.textField];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
