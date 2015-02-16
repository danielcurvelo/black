//
//  PlayerTableViewCell.h
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "Player.h"
#import <UIKit/UIKit.h>

@interface ScoreKeeperTableViewCell : UITableViewCell

@property (nonatomic, strong) UITextField *playerTextField;
@property (nonatomic, strong) UILabel *playerScore;
@property (nonatomic, strong) UIStepper *playerStepper;
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) Player *player;

@end
