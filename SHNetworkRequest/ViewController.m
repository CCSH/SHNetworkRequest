//
//  ViewController.m
//  SHNetworkRequest
//
//  Created by CSH on 2019/5/31.
//  Copyright © 2019 CSH. All rights reserved.
//

#import "ViewController.h"
#import "SHServerRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [SHServerRequest requestListWithTag:nil
                                   name:@"1234"
                                 result:^(SHRequestBaseModel *_Nonnull baseModel, NSError *_Nonnull error){

                                 }];
}

@end
