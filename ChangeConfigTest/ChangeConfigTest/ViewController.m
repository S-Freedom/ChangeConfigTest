//
//  ViewController.m
//  ChangeConfigTest
//
//  Created by crazy on 16/5/30.
//  Copyright © 2016年 crazy. All rights reserved.
//

#import "ViewController.h"

#import "PrefixHeader.pch"

@interface ViewController ()
@property (strong,nonatomic) UIWindow *keywin;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    NSString *testHost = TESTHOST;
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"CANCLE" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:testHost preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}


- (NSString *)readValueFromConfigurationFile {
    NSBundle*bundle = [NSBundle mainBundle];
    NSString *path =[bundle pathForResource:@"Environments"ofType:@"plist"];
    NSDictionary *config = [NSDictionary dictionaryWithContentsOfFile:path];
    return config[@"Host_URL"];
}
@end
