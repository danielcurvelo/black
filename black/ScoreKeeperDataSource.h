//
//  ScoreKeeperDataSource.h
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ScoreKeeperDataSource : NSObject <UITableViewDataSource>

- (NSIndexPath *)addNewCell:(UITableView *)tableView;

@end
