//
//  main.m
//  Chapter17
//
//  Created by 孙培峰 on 13-11-16.
//  Copyright (c) 2013年 孙培峰. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

#define NSLog(...) LogMessageF( \
__FILE__,           \
__LINE__,           \
__FUNCTION__,       \
nil, 0,             \
__VA_ARGS__)
int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
