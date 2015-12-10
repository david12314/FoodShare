//
//  SettingViewController.m
//  	
//
//  Created by Hu Wenxuan on 12/10/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import "SettingViewController.h"
#import "ViewController.h"

@interface SettingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *Address;
@property (weak, nonatomic) IBOutlet UILabel *Setting;
@property (weak, nonatomic) IBOutlet UILabel *REVP;
@property (weak, nonatomic) IBOutlet UILabel *Before_Event;
@property (weak, nonatomic) IBOutlet UISwitch *RSVP_but;
@property (weak, nonatomic) IBOutlet UILabel *Full_Event;
@property (weak, nonatomic) IBOutlet UISwitch *Before_Event_but;
@property (weak, nonatomic) IBOutlet UISwitch *Full_Event_but;


@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:YES animated:animated];
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
