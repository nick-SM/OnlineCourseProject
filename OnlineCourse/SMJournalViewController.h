//
//  SMJournalViewController.h
//  OnlineCourseProject
//
//  Created by Nick Woodward on 9/4/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMJournalViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tvJournal;
- (IBAction)okPressed:(id)sender;

@end
