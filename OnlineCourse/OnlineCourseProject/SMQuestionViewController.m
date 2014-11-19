//
//  SMQuestionViewController.m
//  OnlineCourseProject
//
//  Created by Nick Woodward on 9/4/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "SMQuestionViewController.h"
#import "SMSingleton.h"
#import "SMOnlineCourseWebService.h"

@interface SMQuestionViewController ()

@end

@implementation SMQuestionViewController{
    NSIndexPath *questionNumberIndexPath;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)okPressed:(id)sender {
    SMSingleton *singleton = [SMSingleton sharedManager];
    SMOnlineCourseWebService *service = [[SMOnlineCourseWebService alloc]init];
    
    NSMutableArray *inputElements = [[NSMutableArray alloc]init];
    [inputElements addObject:@"UserID"];
    [inputElements addObject:@"QuestionID"];
    [inputElements addObject:@"QuestionAnswer"];
    [inputElements addObject:@"DateAnswered"];
    
    NSMutableArray *elementValues = [[NSMutableArray alloc]init];
    [elementValues addObject:singleton.username];
    [elementValues addObject:[[[NSNumber alloc]initWithInt:questionNumberIndexPath.row]stringValue]];
    [elementValues addObject:self.tvAnswer.text];
    [elementValues addObject:[[NSDate date] description]];
    
    NSDictionary *result = [service doWebService:@"With_x0020_DateAnswer" withElements:inputElements forValues:elementValues];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
