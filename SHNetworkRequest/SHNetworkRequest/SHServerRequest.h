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

+ (void)requestListWithName:(NSString *)name
                        tag:(NSString *)tag
                     result:(RequestBlock)result;

@end

NS_ASSUME_NONNULL_END
