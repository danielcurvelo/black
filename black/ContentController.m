//
//  ContentController.m
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "ViewController.h"
#import "ContentController.h"

@implementation ContentController

+ (ContentController *)sharedInstance {
    static ContentController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ContentController alloc] init];
        
    });
    return sharedInstance;
}

@end
