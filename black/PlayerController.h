//
//  PlayerController.h
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "Player.h"
#import <Foundation/Foundation.h>

static NSString *playerKey = @"player";

@interface PlayerController : NSObject

@property (nonatomic, strong) NSArray *arrayOfPlayers;
@property (nonatomic, assign) NSInteger rows;

+ (PlayerController *)sharedInstance;

- (void)addRow;
- (void)addPlayer:(Player *)player;
- (void)replacePlayer:(Player *)unsavedPlayer withSavedPlayer:(Player *)player;
- (void)loadFromDefaults;
- (void)synchronize;

@end
