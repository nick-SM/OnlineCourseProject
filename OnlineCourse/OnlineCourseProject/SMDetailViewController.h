//
//  SMDetailViewController.h
//  OnlineCourseProject
//
//  Created by Nick Woodward on 9/3/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface SMDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
- (IBAction)journalPressed:(id)sender;

@property MPMoviePlayerController *mov;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
