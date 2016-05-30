//
//  Environment.m
//  ChangeConfigTest
//
//  Created by crazy on 16/5/30.
//  Copyright © 2016年 crazy. All rights reserved.
//

#import "Environment.h"

@implementation Environment

static Environment *sharedInstance = nil;

- (id)init
{
    self = [super init];
    
    if (self) {
        // Do Nada
    }
    
    return self;
}

- (void)initializeSharedInstance
{
    NSString* configuration = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"Configuration"];
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* envsPListPath = [bundle pathForResource:@
                               "Environments" ofType:@"plist"];
    NSDictionary* environments = [[NSDictionary alloc] initWithContentsOfFile:envsPListPath];
    NSDictionary* environment = [environments objectForKey:configuration];
    
    self.myAPIURL = [environment valueForKey:@"Host_URL"];
}

#pragma mark - Lifecycle Methods

+ (Environment *)sharedInstance
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
            [sharedInstance initializeSharedInstance];
        }
        return sharedInstance;
    }
}
@end
