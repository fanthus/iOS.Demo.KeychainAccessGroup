//
//  ViewController.m
//  iOSWriteKeychain
//
//  Created by Fan's iMac  on 11/23/17.
//  Copyright © 2017 Fan's iMac . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"write keychain " forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(50, 50, 100, 100);
    [self.view addSubview:btn];
}

- (void)btnPressed:(id)sender {
    NSLog(@"sender = %@",sender);
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setObject:(__bridge NSString *)kSecClassGenericPassword forKey:(__bridge NSString *)kSecClass];
    [dict setObject:@"DZQ5YNVEU2.frank" forKey:(__bridge NSString *)kSecAttrAccessGroup];
    [dict setObject:@"this is account" forKey:(__bridge NSString *)kSecAttrAccount];
    [dict setObject:@"this is service" forKey:(__bridge NSString *)kSecAttrService];
    [dict setObject:[@"this is password" dataUsingEncoding:NSUTF8StringEncoding] forKey:(__bridge NSString *)kSecValueData];
    NSInteger result = SecItemAdd((__bridge CFMutableDictionaryRef)dict, NULL);
    NSLog(@"%d",result);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
