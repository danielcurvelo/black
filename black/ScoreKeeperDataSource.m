//
//  ScoreKeeperDataSource.m
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "ScoreKeeperTableViewCell.h"
#import "PlayerController.h"
#import "ScoreKeeperDataSource.h"

@implementation ScoreKeeperDataSource

- (NSIndexPath *)addNewCell:(UITableView *)tableView
{
    Player *player = [[Player alloc] init];
    NSInteger lastRow = [[PlayerController sharedInstance].arrayOfPlayers indexOfObject:player];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    return indexPath;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [PlayerController sharedInstance].arrayOfPlayers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScoreKeeperTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scoreK"];
    cell.backgroundColor = [UIColor colorWithRed:0.0 green:0.1 blue:0.5 alpha:0.1];
    Player *player = [PlayerController sharedInstance].arrayOfPlayers[indexPath.row];
    cell.textLabel.text = player.name;
    return cell;
}

@end
