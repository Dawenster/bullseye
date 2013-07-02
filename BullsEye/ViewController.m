//
//  ViewController.m
//  BullsEye
//
//  Created by David Wen on 2013-07-02.
//  Copyright (c) 2013 David Wen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
  UIAlertView *alertView = [[UIAlertView alloc]
    initWithTitle: @"Hello, World"
    message: @"This is my first app!"
    delegate: nil
    cancelButtonTitle: @"Awesome"
    otherButtonTitles: nil];
  
  [alertView show];
}

@end
