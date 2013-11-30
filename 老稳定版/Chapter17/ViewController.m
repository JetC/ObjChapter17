//
//  ViewController.m
//  Chapter17
//
//  Created by 孙培峰 on 13-11-16.
//  Copyright (c) 2013年 孙培峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

#pragma 还要学习OutletCollection
@property (strong, nonatomic) IBOutletCollection(UIButton)NSArray *digitalNum;
@property (weak, nonatomic) IBOutlet UILabel *textInputed;
@property (nonatomic)NSInteger singleTempNum;//放单个数字
@property (strong, nonatomic)NSMutableString *stringInputedFirst;//加数1的字符串
@property (strong, nonatomic)NSMutableString *stringInputedSecond;//加数2的字符串
@property (nonatomic)NSInteger addingNum1;//加数1
@property (nonatomic)NSInteger addingNum2;//加数2
@property (strong, nonatomic)NSString *operator;//运算符
@property (strong, nonatomic)NSString *stringInputed;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.model = [[Model alloc]init];
    //self.tempForSingleNum = [[NSString alloc]init];
    self.stringInputedFirst = [[NSMutableString alloc]init];
    self.stringInputedSecond = [[NSMutableString alloc]init];
    self.stringInputed = [[NSString alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)digitPress:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    self.singleTempNum = [btn.titleLabel.text integerValue];
    self.textInputed.text = [NSString stringWithFormat:@"%@%i",self.textInputed.text,self.singleTempNum];

    if (self.stringInputedFirst == nil)
    {
        self.stringInputedFirst = (NSMutableString *)[NSString stringWithFormat:@"%i",self.singleTempNum];

    }
    else if (self.stringInputedFirst)
    {
        self.stringInputedFirst = (NSMutableString *)[NSString stringWithFormat:@"%@%i",self.stringInputedFirst,self.singleTempNum];
    }
    
    
//    针对OutletCollection快速枚举事例
//    for (UIButton *digitalButton in self.digitalNum) {
//        <#statements#>
//    }
    
    
    
//    UIButton *btn = (UIButton *)sender;
//    self.num = [btn.titleLabel.text doubleValue] ;
//    if (self.currentOperator == nil)//是第一个数字的话
//    {
//        self.model.result = self.num;
//        self.stringInputedFirst = (NSMutableString *)[NSString stringWithFormat:@"%1.0f",self.num];
//        self.textInputed.text = self.stringInputedFirst;
//    }
//    else
//    {
//        self.stringInputedFirst = (NSMutableString *)[NSString stringWithFormat:@"%@,%1.0f",self.stringInputedFirst,self.num];
//        self.textInputed.text = self.stringInputedFirst;
//    }
    
  
}

-(IBAction)operatorPress:(id)sender
{
    static NSInteger i=1;//第i次按运算符
    UIButton *btn = (UIButton *)sender;
    self.operator = btn.titleLabel.text;
    self.textInputed.text = [NSString stringWithFormat:@"%@%@",self.textInputed.text,self.operator];
    if (i == 1)
    {
        self.addingNum1 = [self.stringInputedFirst intValue];
        self.num = self.addingNum1 + self.addingNum2;
        UIButton *btn = (UIButton *)sender;
        self.operator = btn.titleLabel.text;
        self.stringInputedFirst = nil;
    }
    else if(i == 2)
    {
        self.addingNum2 = [self.stringInputedFirst intValue];
        self.num = self.addingNum1+self.addingNum2;
        self.stringInputedFirst = nil;
        self.addingNum1 = nil;
        self.addingNum2 = nil;
        UIButton *btn = (UIButton *)sender;
        self.operator = btn.titleLabel.text;
        
    }
    else
    {
        self.addingNum1 = [self.stringInputedFirst intValue];
        self.num =  self.num+self.addingNum1;
        self.addingNum1 = nil;
        self.stringInputedFirst = nil;



    
    }
    
    i=i+1;
    NSLog(@"%i,%@,%i",self.num,self.operator,self.addingNum2);
    return;
    
//    UIButton *btn = (UIButton *)sender;
//    self.currentOperator = btn.titleLabel.text;
}

-(IBAction)resultPress:(id)sender
{
    if ([self.operator  isEqual: @"+"])
    {
        self.addingNum1 = [self.stringInputedFirst intValue];
        self.num =  self.num+self.addingNum1;
    }
    self.model.result = self.num;
    self.resultLabel.text = [NSString stringWithFormat:@"%1.0f",self.model.result];
    self.textInputed.text = [NSString stringWithFormat:@"%@=%i",self.textInputed.text,self.num];
}

-(IBAction)cleanPress:(id)sender
{
    self.resultLabel.text = @"0.0";
    self.model.result = 0.0;
    self.currentOperator = nil;
}



@end
