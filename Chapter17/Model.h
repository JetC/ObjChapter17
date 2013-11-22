//
//  Model.h
//  Chapter17
//
//  Created by 孙培峰 on 13-11-16.
//  Copyright (c) 2013年 孙培峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic)double result;//第一个数字

- (double)calculate:(double)num andOperator:(NSString *)ope;

@end
