//
//  SecondEventPopupViewController.m
//  Guest
//
//  Created by Jimmy on 12/10/15.
//  Copyright © 2015 FoodShare. All rights reserved.
//

#import "SecondEventPopupViewController.h"
#import "ViewController.h"

@interface SecondEventPopupViewController ()
- (IBAction)DetailsClick:(id)sender;
- (IBAction)CancelRSVPClick:(id)sender;

@end

@implementation SecondEventPopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)DetailsClick:(id)sender {
    ViewController *guestViewEvent = [[ViewController alloc] initAsGuestViewWithFood:@[@"Pizza", @"Pasta"] Friends:@[@"Carl", @"Dan"] hasRSVP:YES];
    [self.navigationController pushViewController:guestViewEvent animated:YES];
}

- (IBAction)CancelRSVPClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
