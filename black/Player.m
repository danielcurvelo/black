//
//  Player.m
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "Player.h"

@implementation Player

- (NSDictionary *)playerDictionary
{
    NSMutableDictionary *dictionaryOfPlayers = [NSMutableDictionary new];
    if (self.name) {
        [dictionaryOfPlayers setObject:self.name forKey:nameKey];
    }
    if (self.score) {
        [dictionaryOfPlayers setObject:self.score forKey:scoreKey];
    }
    if (self.stepper) {
        [dictionaryOfPlayers setObject:self.stepper forKey:stepperKey];
    }
    return dictionaryOfPlayers;
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.name = dictionary[nameKey];
        self.score = dictionary[scoreKey];
        self.stepper = dictionary[stepperKey];
    }
    return self;
}

@end
