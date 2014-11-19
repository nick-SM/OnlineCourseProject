//
//  BIDUserName.h
//  InternalApp
//
//  Created by Nick2 on 8/24/14.
//  Copyright (c) 2014 Softwaremerchant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMSingleton : NSObject

@property (nonatomic, strong) NSString *username;

+ (id)sharedManager;
@end
