//
//  SMJournalViewController.m
//  OnlineCourseProject
//
//  Created by Nick Woodward on 9/4/14.
//  Copyright (c) 2014 softwaremerchant. All rights reserved.
//

#import "SMJournalViewController.h"
#import "SMOnlineCourseWebService.h"
#import "SMSingleton.h"

@interface SMJournalViewController ()

@end

@implementation SMJournalViewController

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
  
    SMOnlineCourseWebService *service = [[SMOnlineCourseWebService alloc]init];
    
    SMSingleton *singleton = [SMSingleton sharedManager];

    NSMutableArray *inputElements = [[NSMutableArray alloc]init];
    [inputElements addObject:@"UserID"];
    
    NSMutableArray *elementValues = [[NSMutableArray alloc]init];
    [elementValues addObject:singleton.username];

    NSDictionary *result = [service doWebService:@"getJournal" withElements:inputElements forValues:elementValues];
    // Do any additional setup after loading the view.
    //int i;
    for(int i = 0;i<[result[@"Answer"] count];i++){
        self.tvJournal.text = [self.tvJournal.text stringByAppendingString:result[@"Question"][i]];
        self.tvJournal.text = [self.tvJournal.text stringByAppendingString:@"\n"];
        
        self.tvJournal.text = [self.tvJournal.text stringByAppendingString:result[@"Answer"][i]];
        self.tvJournal.text = [self.tvJournal.text stringByAppendingString:@"\n\n"];
    }
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
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
