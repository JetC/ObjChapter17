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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *digitalNum;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.model = [[Model alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)digitPress:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    self.num = [btn.titleLabel.text doubleValue] ;
    if (self.currentOperator == nil)//是第一个数字的话
    {
        self.model.result = self.num;
    }
  
}

-(IBAction)operatorPress:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    self.currentOperator = btn.titleLabel.text;
}

-(IBAction)resultPress:(id)sender
{
    self.model.result = [self.model calculate:self.num andOperator:self.currentOperator];
    self.resultLabel.text = [NSString stringWithFormat:@"%.3f",self.model.result];
}

-(IBAction)cleanPress:(id)sender
{
    self.resultLabel.text = @"0.0";
    self.model.result = 0.0;
    self.currentOperator = nil;
}




@end
