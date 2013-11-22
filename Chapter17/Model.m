//
//  Model.m
//  Chapter17
//
//  Created by 孙培峰 on 13-11-16.
//  Copyright (c) 2013年 孙培峰. All rights reserved.
//

#import "Model.h"

@implementation Model

//此时传入第二个数字num
-(double)calculate:(double)num andOperator:(NSString *)ope
{
    if ([ope isEqualToString:@"+"])
    {
        self.result += num;
    }
    if ([ope isEqualToString:@"-"])
    {
        self.result -= num;
    } if ([ope isEqualToString:@"*"])
    {
        self.result *= num;
    } if ([ope isEqualToString:@"/"])
    {
        self.result /= num;
    }
    
    return self.result;
}



@end
