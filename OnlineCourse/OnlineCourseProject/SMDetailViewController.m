//
//  SMDetailViewController.m
//  OnlineCourseProject
//
//  Created by Nick Woodward on 9/3/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "SMDetailViewController.h"

@interface SMDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation SMDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        NSURL *url=[NSURL URLWithString:self.detailItem[1]];
        self.mov = [[MPMoviePlayerController alloc] initWithContentURL:url];
        [self.mov.view setFrame:CGRectMake(0,64,self.view.frame.size.width,self.view.frame.size.height/2)];
        [self.view addSubview:self.mov.view];
        //[MPMoviePlayerController setScalingMode:MPMovieScalingModeFill];
        [self.mov setScalingMode:MPMovieScalingModeAspectFit];
        
        self.mov.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.mov.movieSourceType = MPMovieSourceTypeStreaming;
        
        [self.mov play];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.mov];

        //self.detailDescriptionLabel.text = [self.detailItem description];
    }
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self.mov.view setFrame:CGRectMake(0,64,self.view.frame.size.width,self.view.frame.size.height/2)];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   /* NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"Property List.plist"];
    NSDictionary *plistDict = [NSDictionary dictionaryWithContentsOfFile:finalPath];
    NSDictionary *embededPlistDict = plistDict[@"IPA"];
    NSDictionary *attributes = embededPlistDict[@"Two Brothers Cane & Ebel"];
    NSArray *keys = [attributes allKeys];
    for(int i = 0;i<4;i++){
        NSLog(@"%@",keys[i]);
        NSLog(@"%@",attributes[keys[i]]);
    }*/
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    UIViewController *controller = [board instantiateViewControllerWithIdentifier:@"loginView"];
    [self presentViewController:controller animated:YES completion: nil];
    
    controller.view.superview.bounds=CGRectMake(0,0,500,500);
    
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

-(void)movieDidFinish:(NSNotification *)notification{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    UIViewController *controller = [board instantiateViewControllerWithIdentifier:@"question"];
    [controller setValue:self.detailItem[0] forKeyPath:@"questionNumberIndexPath"];

    [self presentViewController:controller animated:YES completion: nil];
    controller.view.superview.bounds=CGRectMake(0,0,500,500);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
    //[self.mov.view setFrame:CGRectMake(0,64,self.view.frame.size.width,self.view.frame.size.height/2)];
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
    //[self.mov.view setFrame:CGRectMake(0,64,self.view.frame.size.width,self.view.frame.size.height/2)];
}

- (IBAction)journalPressed:(id)sender {
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    UIViewController *controller = [board instantiateViewControllerWithIdentifier:@"journal"];
    
    [self presentViewController:controller animated:YES completion: nil];
    controller.view.superview.bounds=CGRectMake(0,0,500,500);
}
@end
