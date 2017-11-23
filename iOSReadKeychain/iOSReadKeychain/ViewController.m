//
//  ViewController.m
//  iOSReadKeychain
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
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"read keychain " forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(50, 50, 100, 100);
    [self.view addSubview:btn];

}

- (void)btnPressed:(id)sender {
    NSLog(@">>>>>>>>>>>>> read ");
    NSMutableDictionary *searchDict = [NSMutableDictionary dictionaryWithCapacity:0];
    [searchDict setObject:@"this is account" forKey:(__bridge NSString *)kSecAttrAccount];
    [searchDict setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    [searchDict setObject:@"DZQ5YNVEU2.frank" forKey:(__bridge NSString *)kSecAttrAccessGroup];
    [searchDict setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    [searchDict setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnAttributes];
    [searchDict setObject:(id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    CFTypeRef cfDictionary = NULL;
    NSInteger searchResult =  SecItemCopyMatching((__bridge CFDictionaryRef)searchDict, &cfDictionary);
    NSMutableDictionary *resultDict = (__bridge NSMutableDictionary *)cfDictionary;
    NSLog(@"searchResult %d | resultDict = %@",searchResult,resultDict);
    NSString *serviceName = [resultDict objectForKey:kSecAttrAccount];
    NSString *secInfo = [[NSString alloc ] initWithData:[resultDict objectForKey:(__bridge NSString *)kSecValueData] encoding:NSUTF8StringEncoding];
    NSLog(@"serviceName = %@,secInfo = %@",serviceName,secInfo);
    NSLog(@"<<<<<<<<<<<<< read ");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
