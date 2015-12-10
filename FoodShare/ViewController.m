//
//  ViewController.m
//  FoodShare
//
//  Created by David Tang on 11/15/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import "ViewController.h"
#import "DefaultView.h"
#import "EventTableViewController.h"
#import "EventView.h"

@interface ViewController ()

@end

@implementation ViewController{
    EventView *_eventHostAddView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)foodPressed{
    
}

- (void)friendsPressed{
    NSMutableArray *friendsData = [[NSMutableArray alloc] initWithArray:@[@"Ann",@"Bob"]];
    UITableViewController *friendsTableViewController = [[EventTableViewController alloc] initWithEdit:friendsData];
    self.navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self.navigationController pushViewController:friendsTableViewController animated:YES];
}

- (void)loadView{
    UIImage *homeImage = [UIImage imageNamed:@"home.png"];
    UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    homeButton.bounds = CGRectMake(0, 0, 22, 22);
    [homeButton setImage:homeImage forState:UIControlStateNormal];
    
    UIView *notificationsContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    UIImage *notificationsImage = [UIImage imageNamed:@"bell.png"];
    UIButton *notificationsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    notificationsButton.bounds = CGRectMake(0, 0, 22, 22);
    [notificationsButton setImage:notificationsImage forState:UIControlStateNormal];
    [notificationsContainer addSubview:notificationsButton];
    
    UIImage *settingsImage = [UIImage imageNamed:@"settings.png"];
    UIButton *settingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingsButton.bounds = CGRectMake(0, 0, 22, 22);
    [settingsButton setImage:settingsImage forState:UIControlStateNormal];
    
    UIBarButtonItem *home = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    UIBarButtonItem *settings = [[UIBarButtonItem alloc] initWithCustomView:settingsButton];
    self.navigationItem.leftBarButtonItem = home;
    self.navigationItem.rightBarButtonItem = settings;
    self.navigationItem.titleView = notificationsContainer;
    
    NSMutableArray *tableData = [[NSMutableArray alloc] initWithArray:@[@"Pizza",@"Rice"]];
    NSMutableArray *friendsData = [[NSMutableArray alloc] initWithArray:@[@"Ann",@"Bob"]];
    UITableViewController *eventTableViewController = [[EventTableViewController alloc] initWithData:tableData];
    UITableViewController *friendsTableViewController = [[EventTableViewController alloc] initWithData:friendsData];
    _eventHostAddView = [[EventView alloc] initAsHostAdd: eventTableViewController Friends:friendsTableViewController VC:self];
    [self addChildViewController:eventTableViewController];
    [self addChildViewController:friendsTableViewController];
    self.view = _eventHostAddView;
}

@end
