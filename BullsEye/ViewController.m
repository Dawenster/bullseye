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
  int targetValue;
  int score;
  int round;
}

- (void)updateLabels
{
  self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
  self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
  self.roundLabel.text = [NSString stringWithFormat:@"%d", round];
}

- (void)startNewRound
{
  targetValue = 1 + (arc4random() % 100);
  self.slider.value = currentValue;
  round += 1;
}

- (void)viewDidLoad
{
  currentValue = self.slider.value;
  [super viewDidLoad];
  [self startNewRound];
  [self updateLabels];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
  int difference = abs(currentValue - targetValue);
  int points = 100 - difference;
  
  NSMutableString *title = [NSMutableString stringWithFormat:
    @"You scored %d points", points];
  
  if (difference == 0) {
    [title appendString:@" + 100 bonus points for a perfect hit!"];
    points += 100;
  }
  
  score += points;
  
  NSString *message = [NSString stringWithFormat:
    @"The target was %d and you hit %d", targetValue, currentValue];
  
  UIAlertView *alertView = [[UIAlertView alloc]
    initWithTitle:title
    message:message
    delegate:self
    cancelButtonTitle:@"OK"
    otherButtonTitles:nil];
  
  [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
  currentValue = lroundf(slider.value);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
  [self startNewRound];
  [self updateLabels];
}

- (IBAction)startOver
{
  currentValue = 50;
  score = 0;
  round = 0;
  
  [self startNewRound];
  [self updateLabels];
}

@end
