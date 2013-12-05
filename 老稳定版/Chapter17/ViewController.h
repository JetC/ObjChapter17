//
//  ViewController.h
//  Chapter17
//
//  Created by 孙培峰 on 13-11-16.
//  Copyright (c) 2013年 孙培峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ViewController : UIViewController

//@property (nonatomic,strong)Model *model;
@property (nonatomic,strong)IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *numberButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *operatorButtons;
//@property (nonatomic,strong)NSString *currentOperator;


- (IBAction)digitPress:(id)sender;
- (IBAction)operatorPress:(id)sender;
- (IBAction)resultPress:(id)sender;
- (IBAction)cleanPress:(id)sender;


@end
