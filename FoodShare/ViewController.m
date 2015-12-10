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
#import "AddFoodViewController.h"
#import "SettingViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    EventView *_eventView;
}

- (id)initAsHostAddWithFood:(NSArray *)food Friends:(NSArray *)friends{
    self = [super init];
    if (self) {
        UITableViewController *eventTableViewController = [[EventTableViewController alloc] initWithData:[NSMutableArray arrayWithArray:food]];
        UITableViewController *friendsTableViewController = [[EventTableViewController alloc] initWithData:[NSMutableArray arrayWithArray:friends]];
        _eventView = [[EventView alloc] initAsHostAdd: eventTableViewController Friends:friendsTableViewController VC:self];
        [self addChildViewController:eventTableViewController];
        [self addChildViewController:friendsTableViewController];
    }
    return self;
}

- (id)initAsHostEditWithFood:(NSArray *)food Friends:(NSArray *)friends{
    self = [super init];
    if (self) {
        UITableViewController *eventTableViewController = [[EventTableViewController alloc] initWithData:[NSMutableArray arrayWithArray:food]];
        UITableViewController *friendsTableViewController = [[EventTableViewController alloc] initWithData:[NSMutableArray arrayWithArray:friends]];
        _eventView = [[EventView alloc] initAsHostEdit: eventTableViewController Friends:friendsTableViewController VC:self];
        [self addChildViewController:eventTableViewController];
        [self addChildViewController:friendsTableViewController];
    }
    return self;
}

- (id)initAsGuestViewWithFood:(NSArray *)food Friends:(NSArray *)friends hasRSVP:(BOOL)hasRSVP{
    self = [super init];
    if (self) {
        UITableViewController *eventTableViewController = [[EventTableViewController alloc] initWithData:[NSMutableArray arrayWithArray:food]];
        UITableViewController *friendsTableViewController = [[EventTableViewController alloc] initWithData:[NSMutableArray arrayWithArray:friends]];
        _eventView = [[EventView alloc] initAsGuestView: eventTableViewController Friends:friendsTableViewController VC:self hasRSVP:hasRSVP];
        [self addChildViewController:eventTableViewController];
        [self addChildViewController:friendsTableViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setToolbarHidden:YES animated:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gotoSettings{
    SettingViewController *_settingsViewController = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
    [self.navigationController pushViewController:_settingsViewController animated:YES];
}

- (void)finishedEvent{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)foodPressed{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddFoodViewController *_addFoodViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"addFoodViewController"];
    self.navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self.navigationController pushViewController:_addFoodViewController animated:YES];
}

- (void)friendsPressed{
    NSMutableArray *friendsData = [[NSMutableArray alloc] initWithArray:@[@"Ann",@"Bob"]];
    UITableViewController *friendsTableViewController = [[EventTableViewController alloc] initWithEdit:friendsData];
    self.navigationController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self.navigationController pushViewController:friendsTableViewController animated:YES];
}

- (void)goHome{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)loadView{
    UIImage *homeImage = [UIImage imageNamed:@"home.png"];
    UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    homeButton.bounds = CGRectMake(0, 0, 22, 22);
    [homeButton setImage:homeImage forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(goHome) forControlEvents:UIControlEventTouchUpInside];
    
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
    [settingsButton addTarget:self action:@selector(gotoSettings) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *home = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    UIBarButtonItem *settings = [[UIBarButtonItem alloc] initWithCustomView:settingsButton];
    //self.navigationItem.leftBarButtonItem = home;
    self.navigationItem.rightBarButtonItems = @[settings, home];
    self.navigationItem.titleView = notificationsContainer;
    
    self.view = _eventView;
}

@end
