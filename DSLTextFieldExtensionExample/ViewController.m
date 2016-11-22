//
//  ViewController.m
//  DSLTextFieldExtension
//
//  Created by 邓顺来 on 16/11/22.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+DSLExtension.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) UITextField *textField2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textField.dsl_textField_placeholderColor = [UIColor orangeColor];
    _textField.dsl_textField_maxLength = 11;
    
    _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, [UIScreen mainScreen].bounds.size.width - 100, 30)];
    _textField2.borderStyle = UITextBorderStyleRoundedRect;
    _textField2.keyboardType = UIKeyboardTypeNumberPad;
    _textField2.dsl_textField_placeholderColor = [UIColor purpleColor];
    _textField2.placeholder = @"请输入5位数字验证码";
    _textField2.dsl_textField_maxLength = 5;
    [self.view addSubview:_textField2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideKeyboard:(UIControl *)sender {
    [self.view endEditing:YES];
}

@end
