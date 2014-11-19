//
//  BIDUserName.m
//  InternalApp
//
//  Created by Nick2 on 8/24/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import "SMSingleton.h"

@implementation SMSingleton


+ (id)sharedManager {
    static SMSingleton *sharedMyManager = nil;
    if (sharedMyManager == nil)
        sharedMyManager = [[self alloc] init];
    
    return sharedMyManager;
}


@end
