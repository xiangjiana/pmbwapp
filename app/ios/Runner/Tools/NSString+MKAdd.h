

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (MKAdd)

/**
修改字符串中数字颜色, 并返回对应富文本

@param color 数字颜色, 包括小数
@param normalColor 默认颜色
@return 结果富文本
*/
- (NSMutableAttributedString *)modifyDigitalColor:(nullable UIColor *)color normalColor:(nullable UIColor *)normalColor;
/**
 修改字符串中数字颜色, 并返回对应富文本
 
 @param color 数字颜色, 包括小数
 @param otherKey 其他需要适配的字符 如@"!@#$%^&*()"
 @param normalColor 默认颜色
 @return 结果富文本
 */
- (NSMutableAttributedString *)modifyDigitalColor:(nullable UIColor *)color otherKey:(nullable NSString *)otherKey normalColor:(nullable UIColor *)normalColor;
/**
修改字符串中数字富文本, 并返回对应富文本

@param attrs 数字富文本描述, 包括小数
@param otherKey 其他需要适配的字符 如@"!@#$%^&*()"
@param normalAttrs 默认富文本描述
@return 结果富文本
*/
- (NSMutableAttributedString *)modifyDigitalAttributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs otherKey:(nullable NSString *)otherKey normalAttributes:(nullable NSDictionary<NSAttributedStringKey, id> *)normalAttrs;

/**
 修改分隔字符串前后面的字号
 
 @param font 分隔字符串前面的字号
 @param beforeStr 分隔字符串
 @param normalFont 分隔字符串后面的字号
 @return 富文本
 */
- (NSMutableAttributedString *)modifyDigitalFont:(UIFont *)font beforeStr:(NSString *)beforeStr normalFont:(UIFont *)normalFont;

/// 从字符串中提取一个数字
- (NSString *)singleNumberFromStringFirst;

/// 阿拉伯转中文
+ (NSString *)numberToChineseNumber:(NSInteger)nn;

- (BOOL)containsStringSecure:(NSString *)str;
- (NSString *)stringByAppendingStringSecure:(NSString *)aString;
- (NSString *)stringByReplacingOccurrencesOfStringSecure:(NSString *)target
                                              withString:(NSString *)replacement;
- (NSString *)stringByReplacingCharactersInRangeSecure:(NSRange)range
                                            withString:(NSString *)replacement;
- (NSRange)rangeOfStringSecure:(NSString *)searchString;
- (NSRange)rangeOfStringSecure:(NSString *)searchString
                       options:(NSStringCompareOptions)mask;
- (NSRange)rangeOfStringSecure:(NSString *)searchString
                       options:(NSStringCompareOptions)mask
                         range:(NSRange)searchRange;

- (unichar)characterAtIndexSecure:(NSUInteger)index;
- (NSString *)substringFromIndexSecure:(NSUInteger)from;
- (NSString *)substringToIndexSecure:(NSUInteger)to;
- (NSString *)substringWithRangeSecure:(NSRange)range;
- (NSRange)rangeOfCharacterFromSetSecure:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask;

/// 补全字符串长度
/// @param character 补全符号
/// @param formatWidth 字符串总长度
- (instancetype)complementDigitWithPaddingCharacter:(NSString*)character
                                    withFormatWidth:(NSInteger)formatWidth;

- (instancetype)replacementCompentCharWithNumber;

- (NSNumber*)numberFromString;

/// 单行
- (CGSize)textSizeWithFont:(UIFont*)font;

///最大宽度
- (CGSize)textSizeWithFont:(UIFont*)font
          constrainedWidth:(CGFloat)constrainedWidth;

///根据字体、行数、行间距和constrainedWidth计算多行文本占据的size
- (CGSize)textSizeWithFont:(UIFont*)font
             numberOfLines:(NSInteger)numberOfLines
               lineSpacing:(CGFloat)lineSpacing
          constrainedWidth:(CGFloat)constrainedWidth
          isLimitedToLines:(BOOL *)isLimitedToLines;

- (NSString *)decimalNumberScale:(NSInteger)scale type:(int)type decNum:(NSDecimalNumber *)decNum;

- (NSString *)numDisplayDec:(BOOL)plusK;

- (NSString *)numHandleIfVND;

@end

@interface NSString (Regular)
/// 验证是否为URL
- (BOOL)isURL;
/// 验证是否为EMAIL
- (BOOL)isEmail;
/// 验证是否为中文
- (BOOL)isChinsese;
/// 严重是否为电话号码
- (BOOL)isCellPhone;
/// 验证身份证号码
- (BOOL)isResidentIdentityCard;
/// 验证是否为整数
- (BOOL)isIntegerValue;
/// 验证是否为浮点数
- (BOOL)isFloatNumber;
/// 验证是否为负浮点数
- (BOOL)isNegativeFloatNumber;
/// 验证是否为数字
- (BOOL)isNumber;
@end
NS_ASSUME_NONNULL_END
