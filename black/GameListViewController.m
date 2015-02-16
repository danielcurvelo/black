//
//  GameListViewController.m
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "PageViewController.h"
#import "GameTableViewCell.h"
#import "GameListDataSource.h"
#import "ViewController.h"
#import "GameListViewController.h"

@interface GameListViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) GameListDataSource *dataSource;

@end

@implementation GameListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.font = [UIFont fontWithName:@"Sans-Serif" size:14];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.title = @"score keeper";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.parentViewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.1 blue:0.5 alpha:0.1];
    [self.view addSubview:self.tableView];
    
    self.dataSource = [GameListDataSource new];
    self.tableView.dataSource = self.dataSource;
    [self.tableView registerClass:[GameTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.delegate = self;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"O" style:UIBarButtonItemStylePlain target:self action:@selector(pageView:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)pageView:(id)sender
{
    PageViewController *viewController = [PageViewController new];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ViewController *viewControler = [ViewController new];
    [self.navigationController pushViewController:viewControler animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
