

//
//  SHServerRequest.m
//  SHNetworkRequest
//
//  Created by CSH on 2019/5/31.
//  Copyright © 2019 CSH. All rights reserved.
//

#import "SHServerRequest.h"
#import "SHInterfaceHeader.h"
#import "SHRequestBase.h"

@implementation SHServerRequest

+ (void)requestListWithTag:(NSString *)tag
                      name:(NSString *)name
                    result:(RequestBlock)result {
    //网址
    NSString *url = [NSString stringWithFormat:@"%@%@", kHostUrl, kInterface];

    //数据处理
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    if (name) {
        [param setObject:name forKey:@"name"];
    }

    //请求
    [SHRequestBase getRequestWithUrl:url
        param:param
        tag:tag
        retry:0
        progress:nil
        success:^(id responseObj) {

            if (result) {
                SHRequestBaseModel *model = [[SHRequestBaseModel alloc] init];
                result(model, nil);
            }
        }
        failure:^(NSError *error) {

            if (result) {
                result(nil, error);
            }

        }];
}

+ (void)requestLoginWithTag:(NSString *)tag
                   username:(NSString *)username
                   password:(NSString *)password
                     result:(RequestBlock)result {
    //网址
    NSString *url = [NSString stringWithFormat:@"%@%@", kHostUrl, kLogin];

    //数据处理
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    if (username) {
        [param setObject:username forKey:@"username"];
    }

    if (password) {
        [param setObject:password forKey:@"password"];
    }

    //请求
    [SHRequestBase postRequestWithUrl:url
        param:param
        tag:tag
        retry:0
        progress:nil
        success:^(id responseObj) {

            if (result) {
                SHRequestBaseModel *model = [[SHRequestBaseModel alloc] init];
                result(model, nil);
            }
        }
        failure:^(NSError *error) {

            if (result) {
                result(nil, error);
            }

        }];
}

@end
