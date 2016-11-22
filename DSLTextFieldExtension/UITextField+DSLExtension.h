//
//  UITextField+DSLExtension.h
//  DSLTextFieldExtension
//
//  Created by 邓顺来 on 16/11/22.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (DSLExtension)

/**
 placeholder颜色，设nil为默认颜色
 */
@property (strong, nonatomic, nullable) UIColor *dsl_textField_placeholderColor;

/**
 限制最大输入长度，0表示不限制
 */
@property (assign, nonatomic) NSInteger dsl_textField_maxLength;

@end
