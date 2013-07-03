//
//  ViewController.m
//  BullsEye
//
//  Created by David Wen on 2013-07-02.
//  Copyright (c) 2013 David Wen. All rights reserved.
//

#import "ViewController.h"
#import "AboutViewController.h"
#import <QuartzCore/QuartzCore.h>

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
  
  UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"]; [self.slider setThumbImage:thumbImageNormal forState:
    UIControlStateNormal];
  UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-ê Highlighted"];
  [self.slider setThumbImage:thumbImageHighlighted forState: UIControlStateHighlighted];
  UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
  [self.slider setMinimumTrackImage:trackLeftImage forState: UIControlStateNormal];
  UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] stretchableImageWithLeftCapWidth:14 topCapHeight:0];
  [self.slider setMaximumTrackImage:trackRightImage forState: UIControlStateNormal];
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
    
  CATransition *transition = [CATransition animation];
  transition.type = kCATransitionFade;
  transition.duration = 1;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:
    kCAMediaTimingFunctionEaseOut];
    
  currentValue = 50;
  score = 0;
  round = 0;
  
  [self startNewRound];
  [self updateLabels];
    
  [self.view.layer addAnimation:transition forKey:nil];
}

- (IBAction)showInfo
{
  AboutViewController *controller = [[AboutViewController alloc]
    initWithNibName:@"AboutViewController" bundle:nil];
  controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  [self presentViewController:controller animated:YES completion:nil];
}

@end
