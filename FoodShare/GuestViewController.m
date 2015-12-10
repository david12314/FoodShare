//
//  GuestViewController.m
//  Guest
//
//  Created by Jimmy on 12/10/15.
//  Copyright © 2015 FoodShare. All rights reserved.
//

#import "GuestViewController.h"

@interface GuestViewController ()
- (IBAction)SegmentedControlClick:(id)sender;

@end

@implementation GuestViewController

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
