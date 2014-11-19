//
//  SMMasterViewController.h
//  OnlineCourseProject
//
//  Created by Nick Woodward on 9/3/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMDetailViewController;

@interface SMMasterViewController : UITableViewController

@property (strong, nonatomic) SMDetailViewController *detailViewController;

@end
