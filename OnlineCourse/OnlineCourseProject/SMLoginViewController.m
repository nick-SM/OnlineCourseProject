//
//  SMLoginViewController.m
//  OnlineCourseProject
//
//  Created by Nick Woodward on 9/3/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "SMLoginViewController.h"
#import "SMOnlineCourseWebService.h"
#import "SMSingleton.h"

@interface SMLoginViewController ()

@end

@implementation SMLoginViewController

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

- (IBAction)login:(id)sender {
    SMOnlineCourseWebService *service = [[SMOnlineCourseWebService alloc]init];
    
    SMSingleton *singleton = [SMSingleton sharedManager];
    NSMutableArray *inputElements = [[NSMutableArray alloc]init];
    [inputElements addObject:@"UserID"];
    [inputElements addObject:@"Password"];
    
    NSMutableArray *elementValues = [[NSMutableArray alloc]init];
    [elementValues addObject:self.tfUsername.text];
    [elementValues addObject:self.tfPassword.text];
    
    NSDictionary *result = [service doWebService:@"IsUserValid" withElements:inputElements forValues:elementValues];
    
    if([result[@"IsUserValidResult"] isEqualToString:@"1"]){
        singleton.username = self.tfUsername.text;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        UIAlertView *alert;
        alert = [[UIAlertView alloc]initWithTitle:@"LOGIN FAILED" message:@"Password was incorrect" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
    
}
@end
