//
//  UITextField+DSLExtension.m
//  DSLTextFieldExtension
//
//  Created by 邓顺来 on 16/11/22.
//  Copyright © 2016年 邓顺来. All rights reserved.
//

#import "UITextField+DSLExtension.h"
#import <objc/runtime.h>

static NSString * const kTextFieldPlaceholderColorKeyPath = @"placeholderLabel.textColor";

@implementation UITextField (DSLExtension)

- (void)setDsl_textField_placeholderColor:(UIColor *)dsl_textField_placeholderColor
{
    if (!self.placeholder.length) {
        self.placeholder = @" ";
        self.placeholder = nil;
    }
    if (!dsl_textField_placeholderColor) {
        dsl_textField_placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    [self setValue:dsl_textField_placeholderColor forKeyPath:kTextFieldPlaceholderColorKeyPath];
}

- (UIColor *)dsl_textField_placeholderColor
{
    return [self valueForKeyPath:kTextFieldPlaceholderColorKeyPath];
}

- (void)setDsl_textField_maxLength:(NSInteger)dsl_textField_maxLength
{
    objc_setAssociatedObject(self, @selector(dsl_textField_maxLength), [NSNumber numberWithInteger:dsl_textField_maxLength], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:self action:@selector(dsl_textField_extension_textDidChanged) forControlEvents:UIControlEventEditingChanged];
}

- (NSInteger)dsl_textField_maxLength
{
    return [objc_getAssociatedObject(self, @selector(dsl_textField_maxLength)) integerValue];
}

- (void)dsl_textField_extension_textDidChanged
{
    if (self.dsl_textField_maxLength) {
        if (self.text.length > self.dsl_textField_maxLength) {
            self.text = [self.text substringToIndex:self.dsl_textField_maxLength];
        }
    }
}

@end
