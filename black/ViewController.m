//
//  ViewController.m
//  black
//
//  Created by Trace Pomplun on 2/15/15.
//  Copyright (c) 2015 Trace Pomplun. All rights reserved.
//

#import "ScoreKeeperDataSource.h"
#import "ScoreKeeperTableViewCell.h"
#import "PlayerController.h"
#import "Player.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *score;
@property (nonatomic, strong) UIStepper *stepper;

@property (nonatomic, strong) ScoreKeeperDataSource *SDataSource;

@property (nonatomic, strong) Player *player;

@end

@implementation ViewController

- (void)updateWithEntry:(Player *)player {
    self.player = player;
    
    self.textField.text = player.name;
    self.score.text = player.score;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.font = [UIFont fontWithName:@"Sans-Serif" size:14];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    self.tableView.backgroundColor =  [UIColor clearColor];
//    self.parentViewController.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.1 blue:0.9 alpha:0.1];
    [self.view addSubview:self.tableView];
    
    self.SDataSource = [ScoreKeeperDataSource new];
    self.tableView.dataSource = self.SDataSource;
    [self.tableView registerClass:[ScoreKeeperTableViewCell class] forCellReuseIdentifier:@"scoreK"];
    
    UIBarButtonItem *addPlayers = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(addPlayers)];
    self.navigationItem.rightBarButtonItem = addPlayers;
    
    UIBarButtonItem *savePlayers = [[UIBarButtonItem alloc] initWithTitle:@"save" style:UIBarButtonItemStylePlain target:self action:@selector(savePlayers:)];
    self.navigationItem.leftBarButtonItem = savePlayers;
}

- (void)addPlayers
{
    ScoreKeeperTableViewCell *cell = [ScoreKeeperTableViewCell new];
    Player *player = [[Player alloc] initWithDictionary:@{nameKey:cell.playerTextField.text, scoreKey: cell.playerScore.text, stepperKey: cell.playerStepper}];
    player.name = cell.playerTextField.text;
    player.score = cell.playerScore.text;
    player.stepper = cell.playerStepper;
    
//    NSIndexPath *indexPath = [self.SDataSource addNewCell:self.tableView];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    [[PlayerController sharedInstance] addPlayer:player];
    
    NSLog(@"%lu", (unsigned long)[PlayerController sharedInstance].arrayOfPlayers.count);
}

- (void)savePlayers:(id)sender
{
    Player *player = [Player new];
    
    if (self.player) {
        [[PlayerController sharedInstance] addPlayer:player];
    }
    else {
        [[PlayerController sharedInstance] replacePlayer:self.player withSavedPlayer:player];
        NSLog(@"%lu", (unsigned long)[PlayerController sharedInstance].arrayOfPlayers.count);
    }

    [self.navigationController popToRootViewControllerAnimated:YES];
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
