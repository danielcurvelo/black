//
//  Player.h
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

static NSString *nameKey = @"name";
static NSString *scoreKey = @"score";
static NSString *stepperKey = @"stepper";

@interface Player : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *score;
@property (nonatomic) UIStepper *stepper;

- (NSDictionary *)playerDictionary;
- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
