

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

+ (void)requestListWithName:(NSString *)name
                        tag:(NSString *)tag
                     result:(RequestBlock)result {
    NSString *url = [NSString stringWithFormat:@"%@%@", kHostUrl, kInterface];

    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    if (name) {
        [param setObject:name forKey:@"name"];
    }

    return [SHRequestBase getRequestWithUrl:url
        param:param
        tag:tag
        retry:0
        progress:nil
        success:^(id _Nonnull responseObj) {

            if (result) {
                SHRequestBaseModel *model = [[SHRequestBaseModel alloc] init];
                result(model, nil);
            }
        }
        failure:^(NSError *_Nonnull error) {

            if (result) {
                result(nil, error);
            }

        }];
}

@end
