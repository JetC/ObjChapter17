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
@property (strong, nonatomic) IBOutletCollection(UIButton)NSArray *digitalNum;//无用但现在还不能删...
@property (weak, nonatomic) IBOutlet UILabel *textInputed;
@property (nonatomic)NSInteger singleTempNum;//放单个数字
@property (strong, nonatomic)NSMutableString *stringInputed;//字符串
@property (nonatomic)NSInteger addingNum1;//加数1
@property (nonatomic)NSInteger addingNum2;//加数2
@property (strong, nonatomic)NSString *operator;//运算符
@property (nonatomic)NSInteger num;//存放结果
@property (nonatomic)NSInteger timesOperatorPressed;//计算次数
@property (nonatomic)BOOL hasCalculationFinished;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.stringInputed = [[NSMutableString alloc]init];
    self.timesOperatorPressed = 1;
    self.hasCalculationFinished = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)digitPress:(id)sender
{
    if (self.hasCalculationFinished == YES)
    {
        [self cleanToBeReadyForNextCalculation];
    }
    
    UIButton *btn = (UIButton *)sender;
    self.singleTempNum = [btn.titleLabel.text integerValue];
    self.textInputed.text = [NSString stringWithFormat:@"%@%i",self.textInputed.text,self.singleTempNum];
    
    if (self.stringInputed == NULL)
    {
        self.stringInputed = (NSMutableString *)[NSString stringWithFormat:@"%i",self.singleTempNum];
        
    }
    else if (self.stringInputed)
    {
        self.stringInputed = (NSMutableString *)[NSString stringWithFormat:@"%@%i",self.stringInputed,self.singleTempNum];
    }
    self.addingNum1 = [self.stringInputed intValue];
    
   
    
    
}

-(IBAction)operatorPress:(id)sender
{
    if (self.hasCalculationFinished == YES)
    {
        return;
    }
    UIButton *btn = (UIButton *)sender;
    self.operator = btn.titleLabel.text;
  
    self.textInputed.text = [NSString stringWithFormat:@"%@%@",self.textInputed.text,self.operator];

    
    if (self.timesOperatorPressed == 1)
    {
        self.addingNum1 = [self.stringInputed intValue];
        self.num = self.addingNum1 + self.addingNum2;
        UIButton *btn = (UIButton *)sender;
        self.operator = btn.titleLabel.text;
        self.stringInputed = nil;
    }
    else if(self.timesOperatorPressed == 2)
    {
        self.addingNum2 = [self.stringInputed intValue];
        self.num = self.num+self.addingNum2;
        self.stringInputed = nil;
        self.addingNum1 = 0;
        self.addingNum2 = 0;
        UIButton *btn = (UIButton *)sender;
        self.operator = btn.titleLabel.text;
        
    }
    else
    {
        self.addingNum1 = [self.stringInputed intValue];
        self.num =  self.num + self.addingNum1;
        self.addingNum1 = 0;
        self.stringInputed = nil;
    }
    
    self.timesOperatorPressed = self.timesOperatorPressed + 1;
    //NSLog(@"%i,%@,%i",self.num,self.operator,self.addingNum2);
    //??return;
    
    //    UIButton *btn = (UIButton *)sender;
    //    self.currentOperator = btn.titleLabel.text;
}

-(IBAction)resultPress:(id)sender
{
    if ([self.operator  isEqual: @"+"])
    {
        self.num =  self.num+self.addingNum1;
    }
    self.resultLabel.text = [NSString stringWithFormat:@"%1.0i",self.num];
    self.textInputed.text = [NSString stringWithFormat:@"%@=%i",self.textInputed.text,self.num];
    self.hasCalculationFinished = YES;
}

-(IBAction)cleanPress:(id)sender
{
    self.resultLabel.text = @"0.0";
}

-(void)cleanToBeReadyForNextCalculation
{
    self.resultLabel.text = @"";
    self.textInputed.text = @"";
    self.timesOperatorPressed = 1;
    self.singleTempNum = 0;
    self.stringInputed = nil;
    self.addingNum1 = 0;
    self.addingNum2 = 0;
    self.operator = 0;
    self.num = 0;
    
    self.hasCalculationFinished = NO;

}


@end

//    针对OutletCollection快速枚举事例
//    for (UIButton *digitalButton in self.digitalNum) {
//        <#statements#>
//    }



//    UIButton *btn = (UIButton *)sender;
//    self.num = [btn.titleLabel.text doubleValue] ;
//    if (self.currentOperator == nil)//是第一个数字的话
//    {
//        self.model.result = self.num;
//        self.stringInputed = (NSMutableString *)[NSString stringWithFormat:@"%1.0f",self.num];
//        self.textInputed.text = self.stringInputed;
//    }
//    else
//    {
//        self.stringInputed = (NSMutableString *)[NSString stringWithFormat:@"%@,%1.0f",self.stringInputed,self.num];
//        self.textInputed.text = self.stringInputed;
//    }
