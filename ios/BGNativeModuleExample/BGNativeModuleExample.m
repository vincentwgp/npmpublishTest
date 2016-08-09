//
//  BGNativeModuleExample.m
//  BGNativeModuleExample
//
//  Created by yougou-sk on 16/8/8.
//  Copyright © 2016年 yougou-sk. All rights reserved.
//

#import "BGNativeModuleExample.h"

@implementation BGNativeModuleExample

RCT_EXPORT_MODULE(BGNativeModuleExample);

RCT_EXPORT_METHOD(print:(NSString *)name){
    NSLog(@"%@",name);
};

//回调
RCT_EXPORT_METHOD(getNativeClass:(RCTResponseSenderBlock)callback) {
    callback(@[NSStringFromClass([self class])]);
}


//Promises
RCT_REMAP_METHOD(testRespondMethod,
                 name:(NSString *)name
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject){
    
    if ([self respondsToSelector:NSSelectorFromString(name)]) {
        resolve(@YES);
    } else {
        reject(@"-1001",@"网络错误",nil);
    }

};

@end
