//
//  SHServerRequest.h
//  SHNetworkRequest
//
//  Created by CSH on 2019/5/31.
//  Copyright © 2019 CSH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHRequestBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 请求接口
 */
@interface SHServerRequest : NSObject

#pragma mark 登录请求
+ (void)requestLoginWithTag:(NSString *)tag
                   username:(NSString *)username
                   password:(NSString *)password
                     result:(RequestBlock)result;

#pragma mark 列表查询
+ (void)requestListWithTag:(NSString *)tag
                      name:(NSString *)name
                    result:(RequestBlock)result;

@end

NS_ASSUME_NONNULL_END
