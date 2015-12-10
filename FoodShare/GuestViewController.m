//
//  GuestViewController.m
//  Guest
//
//  Created by Jimmy on 12/10/15.
//  Copyright © 2015 FoodShare. All rights reserved.
//

#import "GuestViewController.h"
#import "SettingViewController.h"

@interface GuestViewController ()
- (IBAction)SegmentedControlClick:(id)sender;

@end

@implementation GuestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
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
    
    [self.navigationController setToolbarHidden:YES animated:animated];
}

- (void)goHome{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)gotoSettings{
    SettingViewController *_settingsViewController = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
    [self.navigationController pushViewController:_settingsViewController animated:YES];
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

- (IBAction)SegmentedControlClick:(id)sender {
    UISegmentedControl * segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    if(selectedSegment == 0){
        //toggle map
        [self.TableViewContainer setHidden:YES];
        [self.MapViewContainer setHidden:NO];
    }
    else{
        [self.MapViewContainer setHidden:YES];
        [self.TableViewContainer setHidden:NO];
    }
}
@end
