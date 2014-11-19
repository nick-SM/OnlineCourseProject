//
//  SMQuestionViewController.h
//  OnlineCourseProject
//
//  Created by Nick Woodward on 9/4/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMQuestionViewController : UIViewController
- (IBAction)okPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *tvAnswer;

@end
