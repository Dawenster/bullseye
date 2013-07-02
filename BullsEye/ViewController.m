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
{
  int currentValue;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  currentValue = 50;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
  NSString *message = [NSString stringWithFormat:
    @"The value of the slider is: %d", currentValue];
  
  UIAlertView *alertView = [[UIAlertView alloc]
    initWithTitle:@"Hello, World!"
    message:message
    delegate:nil
    cancelButtonTitle:@"OK"
    otherButtonTitles:nil];
  
  [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
  currentValue = lroundf(slider.value);
}

@end
