//
//  NSString+Category
//  gs_1210
//
//  Created by musoon on 15/1/2.
//  Copyright (c) 2015年 areo. All rights reserved.
//  字符串相关方法扩展

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)

#pragma mark 根据高度、宽度获取字符的CGSize
+ (CGSize)stringCGSize:(NSString *)str font:(UIFont *)font width:(CGFloat)width height:(CGFloat)height;

#pragma mark 指定宽度获取字符的CGSize
+ (CGSize)stringCGSize:(NSString *)str font:(UIFont *)font width:(CGFloat)width;

#pragma mark 指定高度获取字符的CGSize
+ (CGSize)stringCGSize:(NSString *)str font:(UIFont *)font height:(CGFloat)height;

#pragma mark 指定字体获取字符的CGSize
+ (CGSize)stringCGSize:(NSString *)str font:(UIFont *)font;

#pragma mark 指定字体获取字符的CGSize 针对textview使用
+ (float) heightForTextViewWithText: (NSString *) strText width:(CGFloat)width;

/**
 *  @author YYang, 16-02-08 23:02:04
 *
 *  判断字符串是否为空
 *
 *
 */
+ (BOOL) isBlankString:(NSString *)string;

//字符串比较
+ (NSString *)toStr:(id )string;

/**
 * 地址转换
 */
+ (NSString *)URLEncodedString;

/**
 *  去左右空格
 *
 *  @param string 待去空格的字符串
 *
 *  @return 处理完的字符串
 */
+ (NSString *)trim:(NSString *)string;

/**
 *  @author YYang, 16-02-08 23:02:52
 *
 *  姓名脱敏
 *
 *  @param name 名字
 *
 *  @return 脱敏名字
 */
+(NSString *)nameMask:(NSString *)name;
/**
 *  @author YYang, 16-02-08 23:02:20
 *
 *  身份证号脱敏
 *
 *  @param idNum 身份证脱敏
 *
 *  @return 脱敏身份证号
 */
+(NSString *)idCardNumMask:(NSString *)idNum;

+ (NSString *)humanBool:(BOOL)mechineBool;

/**
 *  @author YYang, 16-06-19 11:06:46
 *
 *  截取指定字符前的字符串
 *
 *  @param orginalString 原始字符串
 *  @param mark          指定字符串
 *
 *  @return 截取后的字符串
 */
+ (NSString *)interceptOrginalString:(NSString *)orginalString andMarkStr:(NSString *)mark;
/**
 *  @author YYang, 16-07-16 15:07:45
 *
 *  转 asc2码
 *
 *  @param originStr 原始字符
 *
 *  @return 转换后的 asc2
 */
+ (NSString *)transferToASCII:(NSString *)originStr;
@end
