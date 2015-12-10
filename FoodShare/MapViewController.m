//
//  MapViewController.m
//  Guest
//
//  Created by Jimmy on 12/10/15.
//  Copyright © 2015 FoodShare. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
- (IBAction)OverlayClick:(id)sender;
- (IBAction)RedButtonClick:(id)sender;
- (IBAction)GreenButtonClick:(id)sender;
@end

@implementation MapViewController

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

- (IBAction)OverlayClick:(id)sender {
    [self.FirstEventView setHidden:YES];
    [self.SecondEventView setHidden:YES];
}

- (IBAction)RedButtonClick:(id)sender {
    [self.FirstEventView setHidden:NO];
}

- (IBAction)GreenButtonClick:(id)sender {
    [self.SecondEventView setHidden:NO];
}
@end
