//
//  AboutViewController.h
//  BullsEye
//
//  Created by David Wen on 2013-07-03.
//  Copyright (c) 2013 David Wen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *webView;

- (IBAction)close;

@end
