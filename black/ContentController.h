//
//  ContentController.h
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentController : NSObject

@property (nonatomic, strong) NSArray *content;

+ (ContentController *)sharedInstance;

@end
