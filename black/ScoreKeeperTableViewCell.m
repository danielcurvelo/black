//
//  PlayerTableViewCell.m
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "ScoreKeeperTableViewCell.h"
#import "PlayerController.h"

@implementation ScoreKeeperTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.playerTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 5, 80, 44)];
    self.playerTextField.placeholder = @"name";
    [self.contentView addSubview:self.playerTextField];
    
    self.playerScore = [[UILabel alloc] initWithFrame:CGRectMake(175, 5, 40, 44)];
    self.playerScore.text = @"0";
    [self.contentView addSubview:self.playerScore];
    
    self.playerStepper = [[UIStepper alloc] initWithFrame:CGRectMake(275, 10, 60, 60)];
    self.playerScore.tintColor = [UIColor blackColor];
    [self.playerStepper addTarget:self action:@selector(changeScore:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.playerStepper];

    Player *player = [PlayerController sharedInstance].arrayOfPlayers[self.index];
    self.textLabel.text = player.name;
    
    return self;
}

- (void)changeScore:(id)sender
{
    double value = [self.playerStepper value];
    self.playerScore.text = [NSString stringWithFormat:@"%d", (int) value];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
