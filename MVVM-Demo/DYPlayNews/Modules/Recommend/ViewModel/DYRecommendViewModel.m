//
//  DYRecommendViewModel.m
//  DYPlayNews
//
//  Created by 袁斌 on 2017/6/1.
//  Copyright © 2017年 https://github.com/DefaultYuan. All rights reserved.
//

#import "DYRecommendViewModel.h"

@implementation DYRecommendViewModel

- (RACSignal *)fetchRecommendTopicList
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [[DYRequestManager manager] doRequestMethod:@"get" url:NewsRecommendTopicURLString params:nil success:^(id responseObject) {
            
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            
            [subscriber sendError:error];
        }];
        
        return nil;
    }];
}

- (RACSignal *)fetchRecommendImageInfos
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [[DYRequestManager manager] doRequestMethod:@"get" url:NewsRecommendImageInfosURLString params:nil success:^(id responseObject) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendError:error];
        }];
        
        return nil;
    }];
}

@end