

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
#import <objc/runtime.h>

@implementation SHServerRequest

#pragma mark - 添加公共参数
+ (NSMutableDictionary *)addPublicParameterWithDic:(NSDictionary *)dic{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:dic];
    param[@"type"] = @"ios";
    return param;
}

#pragma mark - 处理请求
+ (void)handleDataWithModel:(SHRequestBaseModel *)model error:(NSError *)error block:(RequestBlock)block{
    if (error) {
        //网络错误 提示用户
        //        @"网络错误"
        if (block) {
            block(nil, error);
        }
        return;
    }
    
    if ([model.code isEqualToString:@"200"]) {
        //成功
        if (block) {
            block(model, nil);
        }
    }else{
        //服务器错误 提示用户
        //        model.msg
        if (block) {
            block(model, nil);
        }
    }
}

#pragma mark - 网络请求
+ (void)requestListWithTag:(NSString *)tag
                      name:(NSString *)name
                    result:(RequestBlock)result {
    
    //网址
    NSString *url = [NSString stringWithFormat:@"%@%@", kHostUrl, kInterface];
    
    //数据处理
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    
    if (name) {
        param[@"name"] = name;
    }
    
    param = [self addPublicParameterWithDic:param];
    
    //请求
    [SHRequestBase getRequestWithUrl:url param:param tag:tag retry:0 progress:nil success:^(id responseObj) {
        //处理数据
        SHRequestBaseModel *model = [[SHRequestBaseModel alloc] init];
        [self handleDataWithModel:model error:nil block:result];
    } failure:^(NSError *error) {
        
        //处理数据
        [self handleDataWithModel:nil error:error block:result];
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
        param[@"username"] = username;
    }
    if (password) {
        param[@"password"] = password;
    }
    
    param = [self addPublicParameterWithDic:param];
    //请求
    [SHRequestBase postRequestWithUrl:url param:param tag:tag retry:0 progress:nil success:^(id responseObj) {
        //处理数据
        SHRequestBaseModel *model = [[SHRequestBaseModel alloc] init];
        [self handleDataWithModel:model error:nil block:result];
    } failure:^(NSError *error) {
        //处理数据
        [self handleDataWithModel:nil error:error block:result];
    }];
}

@end
