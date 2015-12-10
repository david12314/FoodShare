//
//  HomeTableViewController.m
//  	
//
//  Created by Hu Wenxuan on 12/10/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import "HomeTableViewController.h"
#import "HomeTableViewCell.h"
#import "GuestViewController.h"
#import "ViewController.h"
#import "SettingViewController.h"
@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    [settingsButton addTarget:self action:@selector(gotoSettings) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *home = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    UIBarButtonItem *settings = [[UIBarButtonItem alloc] initWithCustomView:settingsButton];
    self.navigationItem.leftBarButtonItem = home;
    self.navigationItem.rightBarButtonItem = settings;
    self.navigationItem.titleView = notificationsContainer;
    
    UIBarButtonItem *joinEvent = [[UIBarButtonItem alloc] initWithTitle:@"Join New Event" style:UIBarButtonItemStylePlain target:self action:@selector(pressedJoinEvent)];
    UIBarButtonItem *hostEvent = [[UIBarButtonItem alloc] initWithTitle:@"Host New Event" style:UIBarButtonItemStylePlain target:self action:@selector(pressedHostEvent)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self.navigationController setToolbarHidden:NO];
    [self.navigationController.toolbar setBarStyle:UIBarStyleDefault];
    [self setToolbarItems:[NSArray arrayWithObjects:joinEvent, flexibleSpace, hostEvent, nil]];
    
     //Register Home Table Cell
    self.title = @"Events";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeTableViewCell class]) bundle:nil] forCellReuseIdentifier: NSStringFromClass([HomeTableViewCell class])];
    //self.tableView.rowHeight = 185.0;
}

- (void)gotoSettings{
    SettingViewController *_settingsViewController = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
    [self.navigationController pushViewController:_settingsViewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setToolbarHidden:NO animated:animated];
}

- (void)pressedJoinEvent{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GuestViewController *_guestViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"guestViewController"];
    [self.navigationController pushViewController:_guestViewController animated:YES];
}

- (void)pressedHostEvent{
    ViewController *hostAddEvent = [[ViewController alloc] initAsHostAddWithFood:@[] Friends:@[]];
    [self.navigationController pushViewController:hostAddEvent animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath{
    return 183.0f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //This method return Home cell
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeTableViewCell class]) forIndexPath:indexPath];
    
    // Configure the cell...
    NSMutableArray *Foodnamedata = [[NSMutableArray alloc] initWithArray:@[@"Pasta",@"Pizza"]];
    NSMutableArray *Paymentdata = [[NSMutableArray alloc] initWithArray:@[@"Exchange",@"Free"]];
    NSMutableArray *Locationdata = [[NSMutableArray alloc] initWithArray:@[@"Dine in",@"Dine in"]];
    NSMutableArray *Datedata = [[NSMutableArray alloc] initWithArray:@[@"12/12/2015",@"12/12/2015"]];
    NSMutableArray *Timedata = [[NSMutableArray alloc] initWithArray:@[@"12:00 PM",@"06:00 PM"]];
    NSMutableArray *Progressdata = [[NSMutableArray alloc] initWithArray:@[@"6/12",@"5/10"]];
    NSMutableArray *Distancedata = [[NSMutableArray alloc] initWithArray:@[@"5.0 miles",@"2.1 miles"]];
    cell.Foodname.text =  Foodnamedata[indexPath.row];
    cell.Payment.text = Paymentdata[indexPath.row];
    cell.Location.text = Locationdata[indexPath.row];
    cell.Date.text = Datedata[indexPath.row];
    cell.Time.text = Timedata[indexPath.row];
    cell.Progress.text = Progressdata[indexPath.row];
    cell.Distance.text = Distancedata[indexPath.row];
    cell.Distance.textColor = [UIColor colorWithRed:255 green:0 blue:0 alpha:0.7];
    cell.backgroundColor = indexPath.row == 0 ? [UIColor colorWithRed: 100.0/255 green:149.0/255 blue:237.0/255 alpha:1.0] : [UIColor colorWithRed: 224.0/255 green:184.0/255 blue:135.0/255 alpha:1.0];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        ViewController *_guestViewEvent = [[ViewController alloc] initAsGuestViewWithFood:@[@"Fried Rice"] Friends:@[@"Ann", @"Bob"] hasRSVP:YES];
        [self.navigationController pushViewController:_guestViewEvent animated:YES];
    }
    else if (indexPath.row == 1){
        ViewController *_hostEditEvent = [[ViewController alloc] initAsHostEditWithFood:@[@"Pizza", @"Pasta"] Friends:@[@"Carl", @"Dan"]];
        [self.navigationController pushViewController:_hostEditEvent animated:YES];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
