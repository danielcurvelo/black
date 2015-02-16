//
//  PlayerController.m
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "Player.h"
#import "PlayerController.h"

@implementation PlayerController

+ (PlayerController *)sharedInstance {
    static PlayerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PlayerController alloc] init];
    });
    return sharedInstance;
}

- (void)addRow
{
    self.rows++;
}

- (void)addPlayer:(Player *)player
{
    if (!player) {
        return;
    }
    NSMutableArray *arrayOfPlayers = [[NSMutableArray alloc] initWithArray:self.arrayOfPlayers];
    [arrayOfPlayers addObject:player];
    
    self.arrayOfPlayers = arrayOfPlayers;
    [self synchronize];
}

- (void)replacePlayer:(Player *)unsavedPlayer withSavedPlayer:(Player *)player
{
    if (!unsavedPlayer || !player) {
        return;
    }
    NSMutableArray *updatePlayers = [[NSMutableArray alloc] initWithArray:self.arrayOfPlayers];
    NSInteger index = [updatePlayers indexOfObject:unsavedPlayer];
    [updatePlayers replaceObjectAtIndex:index withObject:player];
    
    self.arrayOfPlayers = updatePlayers;
    [self synchronize];
}

- (void)loadFromDefaults
{
    NSMutableDictionary *fatherDictionary = [[NSMutableDictionary alloc] objectForKey:playerKey];
    
    NSMutableArray *arrayWithinFather = [NSMutableArray new];
    
    for (NSDictionary *child in fatherDictionary) {
        Player *player = [[Player alloc] initWithDictionary:child];
        [arrayWithinFather addObject:player];
    }
//    self.arrayOfPlayers = arrayWithinFather;
}

- (void)synchronize
{
    NSMutableArray *playerDictionary = [NSMutableArray new];
    
    
    for (Player *player in playerDictionary) {
        [playerDictionary addObject:[player playerDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:playerDictionary forKey:playerKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
