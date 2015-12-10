//
//  EventView.m
//  	
//
//  Created by David Tang on 12/5/15.
//  Copyright © 2015 David Tang. All rights reserved.
//

#import "ViewController.h"
#import "EventView.h"
#import "EventTableViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation EventView{
    UITextField *_addressTextField;
    UIDatePicker *_timePicker;
    UIButton *_timeButton;
    UITextField *_timeTextField;
    UITableView *_foodTable;
    UIButton *_foodButton;
    UIButton *_friendsButton;
    UITableView *_friendsTable;
    UIProgressView *_eventCapacity;
    UIStepper *_eventStepper;
    UILabel *_eventStepperLabel;
    UIButton *_publicToggle;
    UISegmentedControl *_paymentMethod;
    UIButton *_paymentMethodButton;
    UISegmentedControl *_eatMethod;
    UIButton *_eatMethodButton;
    UIButton *_finishButton;
    NSDictionary *_viewsDictionary;
}

- (UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    CGFloat scale = [[UIScreen mainScreen]scale];
    /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (id)initAsHostAdd: (UITableViewController*) tableViewController Friends:(UITableViewController *)friendsTableViewController VC:(UIViewController *)VC{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.foodTableViewController = tableViewController;
        self.friendsTableViewController = friendsTableViewController;
        
        _addressTextField = [[UITextField alloc] init];
        _addressTextField.placeholder = @"Enter Address";
        _addressTextField.layer.cornerRadius = 3.0f;
        _addressTextField.layer.masksToBounds = YES;
        _addressTextField.layer.borderColor = [UIColor colorWithRed:114.0f/255 green:160.0f/255 blue:193.0f/255 alpha:1.0].CGColor;
        _addressTextField.layer.borderWidth = 1.0f;
        _addressTextField.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_addressTextField];
        
        _timePicker = [[UIDatePicker alloc] init];
        _timePicker.datePickerMode = UIDatePickerModeTime;
        
        UIImage *clockImage = [UIImage imageNamed:@"clock-128.png"];
        clockImage = [self imageResize:clockImage andResizeTo:CGSizeMake(20, 20)];
        _timeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_timeButton setTintColor:[UIColor whiteColor]];
        _timeButton.backgroundColor = [UIColor colorWithRed:114.0f/255 green:160.0f/255 blue:193.0f/255 alpha:1.0];
        [_timeButton setImage:clockImage forState:UIControlStateNormal];
        _timeButton.imageView.contentMode = UIViewContentModeCenter;
        _timeButton.layer.cornerRadius = 4.0f;
        _timeButton.layer.masksToBounds = YES;
        _timeButton.layer.borderColor = [UIColor colorWithRed:114.0f/255 green:160.0f/255 blue:193.0f/255 alpha:1.0].CGColor;
        _timeButton.layer.borderWidth = 1.0f;
        _timeButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_timeButton];
        

        _foodButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_foodButton setTitle:@" + Food" forState:UIControlStateNormal];
        [_foodButton setTintColor:[UIColor blackColor]];
        [_foodButton setBackgroundColor:[UIColor lightGrayColor]];
        _foodButton.layer.borderWidth = 1.0f;
        _foodButton.layer.cornerRadius = 2.0f;
        [_foodButton addTarget:VC action:@selector(foodPressed) forControlEvents:UIControlEventTouchUpInside];
        _foodButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_foodButton];
        
        
        _foodTable = tableViewController.tableView;
        _foodTable.layer.borderWidth = 1.0f;
        _foodTable.layer.cornerRadius = 2.0f;
        _foodTable.layer.borderColor = [UIColor blackColor].CGColor;
        _foodTable.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_foodTable];
        
        _friendsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_friendsButton setTitle:@" + Friends" forState:UIControlStateNormal];
        [_friendsButton setTintColor:[UIColor blackColor]];
        [_friendsButton setBackgroundColor:[UIColor lightGrayColor]];
        _friendsButton.layer.borderWidth = 1.0f;
        _friendsButton.layer.cornerRadius = 2.0f;
        [_friendsButton addTarget:VC action:@selector(friendsPressed) forControlEvents:UIControlEventTouchUpInside];
        _friendsButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_friendsButton];
        
        _friendsTable = friendsTableViewController.tableView;
        _friendsTable.layer.borderWidth = 1.0f;
        _friendsTable.layer.cornerRadius = 2.0f;
        _friendsTable.layer.borderColor = [UIColor blackColor].CGColor;
        _friendsTable.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_friendsTable];
        
        
        
        _eventCapacity = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
        _eventCapacity.progress = 0.75f;
        _eventCapacity.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_eventCapacity];
        
        _eventStepper = [[UIStepper alloc] init];
        _eventStepper.value = 7;
        _eventStepper.maximumValue = 10;
        _eventStepper.minimumValue = 0;
        [_eventStepper addTarget:self action:@selector(incrementedStepper:) forControlEvents:UIControlEventValueChanged];
        _eventStepper.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_eventStepper];
        
        _eventStepperLabel = [UILabel new];
        _eventStepperLabel.text = [NSString stringWithFormat:@"%i/10", (int)_eventStepper.value];
        _eventStepperLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_eventStepperLabel];
        
        _publicToggle = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_publicToggle setTitle:@"Make Event Public" forState:UIControlStateNormal];
        _publicToggle.backgroundColor = [UIColor colorWithRed:45.0f/255 green:179.0f/255 blue:0 alpha:1.0];
        _publicToggle.layer.cornerRadius = 4.0f;
        _publicToggle.layer.borderWidth = 1.0f;
        _publicToggle.layer.borderColor = [UIColor colorWithRed:45.0f/255 green:179.0f/255 blue:0 alpha:1.0].CGColor;
        [_publicToggle setTintColor:[UIColor whiteColor]];
        _publicToggle.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_publicToggle];
        
        _paymentMethod = [[UISegmentedControl alloc] initWithItems:@[@"Free", @"Donation", @"Exchange"]];
        _paymentMethod.selectedSegmentIndex = 1;
        _paymentMethod.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_paymentMethod];
        
        _eatMethod = [[UISegmentedControl alloc] initWithItems:@[@"Dine In", @"Carry Out"]];
        _eatMethod.selectedSegmentIndex = 0;
        _eatMethod.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_eatMethod];
        
        _finishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_finishButton setTitle:@"Create" forState:UIControlStateNormal];
        [_finishButton setTintColor:[UIColor whiteColor]];
        _finishButton.backgroundColor = [UIColor colorWithRed:102.0f/255 green:102.0f/255 blue:1.0 alpha:1.0];
        [_finishButton addTarget:VC action:@selector(finishedEvent) forControlEvents:UIControlEventTouchUpInside];
        _finishButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_finishButton];
        
        
        _viewsDictionary = NSDictionaryOfVariableBindings(_addressTextField, _timeButton, _foodButton, _foodTable, _friendsButton, _friendsTable, _eventCapacity, _eventStepper, _eventStepperLabel, _publicToggle, _paymentMethod, _eatMethod, _finishButton);
        [self makeConstraintsHostAdd];
    }
    return self;
}

- (id)initAsGuestView:(UITableViewController *)tableViewController Friends:(UITableViewController *)friendsTableViewController VC:(UIViewController *)VC hasRSVP:(BOOL)hasRSVP{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _addressTextField = [[UITextField alloc] init];
        _addressTextField.text = @"555 Road Dr., Champaign, IL";
        _addressTextField.textAlignment = NSTextAlignmentCenter;
        _addressTextField.layer.cornerRadius = 3.0f;
        _addressTextField.layer.masksToBounds = YES;
        _addressTextField.layer.borderColor = [UIColor colorWithRed:114.0f/255 green:160.0f/255 blue:193.0f/255 alpha:1.0].CGColor;
        _addressTextField.layer.borderWidth = 1.0f;
        _addressTextField.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_addressTextField];
        
        _timePicker = [[UIDatePicker alloc] init];
        _timePicker.datePickerMode = UIDatePickerModeTime;
        
        _timeTextField = [[UITextField alloc] init];
        _timeTextField.text = @"12:30 PM";
        [_timeTextField setTextAlignment:NSTextAlignmentCenter];
        _timeTextField.layer.cornerRadius = 3.0f;
        _timeTextField.layer.masksToBounds = YES;
        _timeTextField.layer.borderColor = [UIColor colorWithRed:114.0f/255 green:160.0f/255 blue:193.0f/255 alpha:1.0].CGColor;
        _timeTextField.layer.borderWidth = 1.0f;
        _timeTextField.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_timeTextField];
        
        
        _foodButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_foodButton setTitle:@"Food" forState:UIControlStateNormal];
        [_foodButton setTintColor:[UIColor blackColor]];
        [_foodButton setBackgroundColor:[UIColor lightGrayColor]];
        _foodButton.layer.borderWidth = 1.0f;
        _foodButton.layer.cornerRadius = 2.0f;
        _foodButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_foodButton];
        
        
        _foodTable = tableViewController.tableView;
        _foodTable.layer.borderWidth = 1.0f;
        _foodTable.layer.cornerRadius = 2.0f;
        _foodTable.layer.borderColor = [UIColor blackColor].CGColor;
        _foodTable.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_foodTable];
        
        
        _friendsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_friendsButton setTitle:@"Friends" forState:UIControlStateNormal];
        [_friendsButton setTintColor:[UIColor blackColor]];
        [_friendsButton setBackgroundColor:[UIColor lightGrayColor]];
        _friendsButton.layer.borderWidth = 1.0f;
        _friendsButton.layer.cornerRadius = 2.0f;
        _friendsButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_friendsButton];
        
        _friendsTable = friendsTableViewController.tableView;
        _friendsTable.layer.borderWidth = 1.0f;
        _friendsTable.layer.cornerRadius = 2.0f;
        _friendsTable.layer.borderColor = [UIColor blackColor].CGColor;
        _friendsTable.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_friendsTable];
        
        
        
        _eventCapacity = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
        _eventCapacity.progress = 0.2f;
        _eventCapacity.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_eventCapacity];
        
        _eventStepperLabel = [UILabel new];
        _eventStepperLabel.text = @"2/12";
        _eventStepperLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_eventStepperLabel];
        
        _paymentMethodButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_paymentMethodButton setTitle:@"Free" forState:UIControlStateNormal];
        _paymentMethodButton.backgroundColor = [UIColor colorWithRed:179.0f/255 green:179.0f/255 blue:179.0f/255 alpha:1.0];
        _paymentMethodButton.layer.cornerRadius = 4.0f;
        _paymentMethodButton.layer.borderWidth = 1.0f;
        _paymentMethodButton.layer.borderColor = [UIColor colorWithRed:179.0f/255 green:179.0f/255 blue:179.0f/255 alpha:1.0].CGColor;
        [_paymentMethodButton setTintColor:[UIColor blackColor]];
        _paymentMethodButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_paymentMethodButton];
        
        _eatMethodButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_eatMethodButton setTitle:@"Dine In" forState:UIControlStateNormal];
        _eatMethodButton.backgroundColor = [UIColor colorWithRed:179.0f/255 green:179.0f/255 blue:179.0f/255 alpha:1.0];
        _eatMethodButton.layer.cornerRadius = 4.0f;
        _eatMethodButton.layer.borderWidth = 1.0f;
        _eatMethodButton.layer.borderColor = [UIColor colorWithRed:179.0f/255 green:179.0f/255 blue:179.0f/255 alpha:1.0].CGColor;
        [_eatMethodButton setTintColor:[UIColor blackColor]];
        _eatMethodButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_eatMethodButton];
        
        
        
        _finishButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_finishButton setTintColor:[UIColor whiteColor]];
        
        if (hasRSVP) {
            [_finishButton setTitle:@"Remove RSVP" forState:UIControlStateNormal];
            _finishButton.backgroundColor = [UIColor redColor];
        }
        else{
            [_finishButton setTitle:@"RSVP" forState:UIControlStateNormal];
            
            _finishButton.backgroundColor = [UIColor colorWithRed:45.0f/255 green:179.0f/255 blue:0 alpha:1.0];
        }
        [_finishButton addTarget:VC action:@selector(finishedEvent) forControlEvents:UIControlEventTouchUpInside];
        _finishButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_finishButton];
        
        
        _viewsDictionary = NSDictionaryOfVariableBindings(_addressTextField, _timeTextField, _foodButton, _foodTable, _friendsButton, _friendsTable, _eventCapacity, _eventStepperLabel, _paymentMethodButton, _eatMethodButton, _finishButton);
        [self makeConstraintsGuestView];
    }
    return self;
    
}

- (id)initAsHostEdit:(UITableViewController *)tableViewController Friends:(UITableViewController *)friendsTableViewController VC:(UIViewController *)VC{
    self = [self initAsHostAdd:tableViewController Friends:friendsTableViewController VC:VC];
    
    _finishButton.backgroundColor = [UIColor colorWithRed:45.0f/255 green:179.0f/255 blue:0 alpha:1.0];
    [_finishButton setTitle:@"Edit" forState:UIControlStateNormal];
    [_finishButton addTarget:VC action:@selector(finishedEvent) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}

+ (BOOL)requiresConstraintBasedLayout{
    return YES;
}

- (void)makeConstraintsGuestView{
    [self removeConstraints:self.constraints];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_addressTextField]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_timeTextField]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_foodButton]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_foodTable]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_friendsButton]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_friendsTable]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_eventCapacity]-10-[_eventStepperLabel]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_friendsTable]-30-[_eventStepperLabel(20)]" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_paymentMethodButton]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_eatMethodButton]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_finishButton]|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[_addressTextField(30)]-10-[_timeTextField(30)]-20-[_foodButton(30)][_foodTable(100)]-10-[_friendsButton(30)][_friendsTable(100)]-30-[_eventCapacity(20)]-40-[_paymentMethodButton(30)]-20-[_eatMethodButton(30)]" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_finishButton(50)]-|" options:0 metrics:nil views:_viewsDictionary]];
}

- (void)makeConstraintsHostAdd{
    [self removeConstraints:self.constraints];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_addressTextField]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_timeButton]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_foodButton]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_foodTable]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_friendsButton]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_friendsTable]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_eventCapacity]-10-[_eventStepperLabel]-5-[_eventStepper]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_friendsTable]-30-[_eventStepper(10)]" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_friendsTable]-30-[_eventStepperLabel(20)]" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_publicToggle]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_paymentMethod]-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_eatMethod]-50-|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_finishButton]|" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[_addressTextField(30)]-10-[_timeButton(30)]-20-[_foodButton(30)][_foodTable(100)]-10-[_friendsButton(30)][_friendsTable(100)]-30-[_eventCapacity(20)]-30-[_publicToggle(30)]-40-[_paymentMethod(20)]-20-[_eatMethod(20)]" options:0 metrics:nil views:_viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_finishButton(50)]-|" options:0 metrics:nil views:_viewsDictionary]];
}

- (void)incrementedStepper: (UIStepper *)stepper{
    _eventStepperLabel.text = [NSString stringWithFormat:@"%i/10", (int)stepper.value];
    _eventCapacity.progress = stepper.value/10;
}


@end
