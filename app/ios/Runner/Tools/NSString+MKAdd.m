

#import "NSString+MKAdd.h"
#import "LanguageManager.h"

@interface NSMutableParagraphStyle (MKAdd)

+ (instancetype)centerAlignment;

@end

@implementation NSMutableParagraphStyle (MKAdd)

+ (instancetype)centerAlignment{
    NSMutableParagraphStyle *paraSub = [[NSMutableParagraphStyle alloc] init];
    paraSub.lineBreakMode = NSLineBreakByCharWrapping;
    paraSub.alignment = NSTextAlignmentCenter;
    return paraSub;
}

@end

@implementation NSString (MKAdd)

- (NSMutableAttributedString *)modifyDigitalColor:(UIColor *)color normalColor:(UIColor *)normalColor {
    return [self modifyDigitalColor:color otherKey:@"K" normalColor:normalColor];
}

- (NSMutableAttributedString *)modifyDigitalColor:(UIColor *)color otherKey:(NSString *)otherKey normalColor:(UIColor *)normalColor {
    NSDictionary<NSAttributedStringKey, id> *normalAttrs = normalColor ? @{NSForegroundColorAttributeName : normalColor} : nil;
    NSDictionary<NSAttributedStringKey, id> *attrs = color ? @{NSForegroundColorAttributeName : color} : nil;
    return [self modifyDigitalAttributes:attrs otherKey:otherKey normalAttributes:normalAttrs];
}

- (NSMutableAttributedString *)modifyDigitalAttributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs otherKey:(nullable NSString *)otherKey normalAttributes:(nullable NSDictionary<NSAttributedStringKey, id> *)normalAttrs {
    
    NSMutableString *patternM = [NSMutableString stringWithString:@"[0-9\\.\\-]"];
    if (otherKey && [otherKey isKindOfClass:[NSString class]] && otherKey.length) {
        [patternM insertString:[NSString stringWithFormat:@"\\%@",otherKey] atIndex:(patternM.length - 1)];
    }
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:patternM options:0 error:NULL];
    
    NSArray<NSTextCheckingResult *> *ranges = [regular matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self attributes:normalAttrs];
    if (attrs) {
        for (int i = 0; i < ranges.count; i++) {
            [attStr setAttributes:attrs range:ranges[i].range];
        }
    }
    return attStr;
}

- (NSMutableAttributedString *)modifyDigitalFont:(UIFont *)font beforeStr:(NSString *)beforeStr normalFont:(UIFont *)normalFont {
    NSRange separateRange = [self rangeOfString:beforeStr];
    NSMutableAttributedString *aStr = [[NSMutableAttributedString alloc] initWithString:self];
    if (separateRange.location != NSNotFound) {
        NSRange beforeRange = NSMakeRange(0, separateRange.location);
        NSRange afterRange = NSMakeRange(separateRange.location, self.length - beforeRange.length);
        [aStr addAttribute:NSFontAttributeName value:font range:beforeRange];
        [aStr addAttribute:NSFontAttributeName value:normalFont range:afterRange];
    }else {
        [aStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, self.length)];
    }
    return aStr;
    
}


- (NSString *)singleNumberFromStringFirst{
    return [self modifyDigitalColor:UIColor.clearColor normalColor:UIColor.clearColor].string;
}

+ (NSString *)numberToChineseNumber:(NSInteger)nn{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterRoundHalfDown;
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans"];
    formatter.locale = locale;
    NSString *string = [formatter stringFromNumber:[NSNumber numberWithInteger: nn]];
    return string;
}

- (NSNumber*)numberFromString{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    int number;
    [scanner scanInt:&number];
    return [NSNumber numberWithInt:number];
}

- (BOOL)containsStringSecure:(NSString *)str
{
    //    NSAssert(str, @"containsStringSecure");
    if (str) {
        return [self containsString:str];
    } else {
        return NO;
    }
}

- (NSString *)stringByAppendingStringSecure:(NSString *)aString
{
    NSAssert(aString, @"stringByAppendingStringSecure");
    if (aString) {
        return [self stringByAppendingString:aString];
    } else {
        return self;
    }
}

- (NSString *)stringByReplacingOccurrencesOfStringSecure:(NSString *)target
                                              withString:(NSString *)replacement
{
    NSAssert(target && replacement, @"stringByReplacingOccurrencesOfStringSecure");
    if (target && replacement) {
        return [self stringByReplacingOccurrencesOfString:target withString:replacement];
    } else {
        return self;
    }
}

- (NSString *)stringByReplacingCharactersInRangeSecure:(NSRange)range
                                            withString:(NSString *)replacement
{
    BOOL isValidLength = range.location + range.length <= self.length;
    NSAssert(replacement && isValidLength, @"stringByReplacingCharactersInRangeSecure");
    if (replacement && isValidLength) {
        return [self stringByReplacingCharactersInRange:range withString:replacement];
    } else {
        return self;
    }
}

- (NSRange)rangeOfStringSecure:(NSString *)searchString
{
    NSAssert(searchString, @"rangeOfStringSecure");
    if (searchString) {
        return [self rangeOfString:searchString];
    } else {
        return NSMakeRange(NSNotFound, 0);
    }
}

- (NSRange)rangeOfStringSecure:(NSString *)searchString
                       options:(NSStringCompareOptions)mask
{
    NSAssert(searchString, @"rangeOfStringSecure");
    if (searchString) {
        return [self rangeOfString:searchString options:mask];
    } else {
        return NSMakeRange(NSNotFound, 0);
    }
}

- (NSRange)rangeOfStringSecure:(NSString *)searchString
                       options:(NSStringCompareOptions)mask
                         range:(NSRange)searchRange
{
    BOOL isValidLength = searchRange.location + searchRange.length <= self.length;
    NSAssert(searchString && isValidLength, @"rangeOfStringSecure");
    if (searchString && isValidLength) {
        return [self rangeOfString:searchString options:mask range:searchRange];
    } else {
        return NSMakeRange(NSNotFound, 0);
    }
}

- (unichar)characterAtIndexSecure:(NSUInteger)index
{
    BOOL isValidLength = index < self.length;
    NSAssert(isValidLength, @"characterAtIndexSecure");
    if (isValidLength) {
        return [self characterAtIndex:index];
    } else {
        return 0;
    }
}

- (NSString *)substringFromIndexSecure:(NSUInteger)from
{
    BOOL isValidLength = from <= self.length;
    NSAssert(isValidLength, @"substringFromIndexSecure");
    if (isValidLength) {
        return [self substringFromIndex:from];
    } else {
        return @"";
    }
}

- (NSString *)substringToIndexSecure:(NSUInteger)to
{
    BOOL isValidLength = to <= self.length;
    NSAssert(isValidLength, @"substringToIndexSecure");
    if (isValidLength) {
        return [self substringToIndex:to];
    } else {
        return @"";
    }
}

- (NSString *)substringWithRangeSecure:(NSRange)range
{
    BOOL isValidLength = range.location + range.length <= self.length;
    NSAssert(isValidLength, @"substringWithRangeSecure");
    if (isValidLength) {
        return [self substringWithRange:range];
    } else {
        return @"";
    }
}

- (NSRange)rangeOfCharacterFromSetSecure:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask
{
    NSAssert(searchSet, @"rangeOfCharacterFromSetSecure");
    if (searchSet) {
        return [self rangeOfCharacterFromSet:searchSet options:mask];
    } else {
        return NSMakeRange(NSNotFound, 0);
    }
}

- (instancetype)replacementCompentCharWithNumber {
    if ([self containsString:@" "]) {
        return [self stringByReplacingOccurrencesOfString:@" " withString:@","];
    }
    return self;
}

- (instancetype)complementDigitWithPaddingCharacter:(NSString*)character
                                    withFormatWidth:(NSInteger)formatWidth{
    NSNumberFormatter * numbreFormatter = [[NSNumberFormatter alloc]init];
    numbreFormatter.numberStyle = kCFNumberFormatterNoStyle;
    numbreFormatter.formatWidth = 2;
    numbreFormatter.paddingCharacter = @"0";
    NSString * content = [numbreFormatter stringFromNumber:[numbreFormatter numberFromString:self]];
    return content;
}

//单行的
- (CGSize)textSizeWithFont:(UIFont*)font{
    CGSize textSize = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    textSize = CGSizeMake((int)ceil(textSize.width), (int)ceil(textSize.height));
    return textSize;
}

- (CGSize)textSizeWithFont:(UIFont*)font
          constrainedWidth:(CGFloat)constrainedWidth{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize size = [self boundingRectWithSize:CGSizeMake(constrainedWidth, MAXFLOAT)
                                     options: NSStringDrawingTruncatesLastVisibleLine |
                                              NSStringDrawingUsesLineFragmentOrigin |
                                              NSStringDrawingUsesFontLeading
                                  attributes:attribute context:nil].size;
    
    return size;
}



/**
 根据字体、行数、行间距和constrainedWidth计算多行文本占据的size
 **/
- (CGSize)textSizeWithFont:(UIFont*)font
             numberOfLines:(NSInteger)numberOfLines
               lineSpacing:(CGFloat)lineSpacing
          constrainedWidth:(CGFloat)constrainedWidth
          isLimitedToLines:(BOOL *)isLimitedToLines
{
    
    if (self.length == 0) {
        return CGSizeZero;
    }
    CGFloat oneLineHeight = font.lineHeight;
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(constrainedWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    CGFloat rows = textSize.height / oneLineHeight;
    CGFloat realHeight = oneLineHeight;
    // 0 不限制行数
    if (numberOfLines == 0) {
        if (rows >= 1) {
            realHeight = (rows * oneLineHeight) + (rows - 1) * lineSpacing;
        }
    }else{
        if (rows > numberOfLines) {
            rows = numberOfLines;
            if (isLimitedToLines) {
                *isLimitedToLines = YES;  //被限制
            }
        }
        realHeight = (rows * oneLineHeight) + (rows - 1) * lineSpacing;
    }
    
    return CGSizeMake(ceil(constrainedWidth),ceil(realHeight));
}

- (NSString *)decimalNumberScale:(NSInteger)scale type:(int)type decNum:(NSDecimalNumber *)decNum {
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundDown
                                       scale:scale
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:YES];
    NSDecimalNumber *tempNumber = [NSDecimalNumber decimalNumberWithString:self];
    if (type == 1) { // 乘
        tempNumber = [tempNumber decimalNumberByMultiplyingBy:decNum];
    } else if (type == 2) { // 除
        tempNumber = [tempNumber decimalNumberByDividingBy:decNum];
    }
    NSDecimalNumber * result = [tempNumber decimalNumberByRoundingAccordingToBehavior:roundUp];
    NSNumberFormatter * fmt = [[NSNumberFormatter alloc]init];
    fmt.maximumFractionDigits = 2;    //设置最大小数点后的位数
    fmt.minimumFractionDigits = 2;    //设置最小小数点后的位数
//    [fmt setPositiveFormat:@"###,##0.00;"];
    fmt.numberStyle = NSNumberFormatterDecimalStyle;
    return [fmt stringFromNumber:result];
}

- (NSString *)numDisplayDec:(BOOL)plusK {
    int type = 0;
    if (LanguageManager.instance.isVND) type = 2;
    NSString *str = [self decimalNumberScale:2 type:type decNum:[NSDecimalNumber decimalNumberWithString:@"1000"]];
    if ([str hasPrefix:@"."]) {
        str = [NSString stringWithFormat:@"0%@",str];
    }
    if (plusK && type == 2) {
        str = [NSString stringWithFormat:@"%@K",str];
    }
    return str;
}

- (NSString *)numHandleIfVND {
    int type = 0;
    if (LanguageManager.instance.isVND) type = 1;
    NSString *str = [self decimalNumberScale:2 type:type decNum:[NSDecimalNumber decimalNumberWithString:@"1000"]];
    if ([str hasPrefix:@"."]) {
        str = [NSString stringWithFormat:@"0%@",str];
    }
    return str;
}

@end

/*
 验证数字：^[0-9]*$
 验证n位的数字：^\d{n}$
 验证至少n位数字：^\d{n,}$
 验证m-n位的数字：^\d{m,n}$
 验证数字和小数点:^[0-9]+([.]{0}|[.]{1}[0-9]+)$
 验证零和非零开头的数字：^(0|[1-9][0-9]*)$
 验证有两位小数的正实数：^[0-9]+(.[0-9]{2})?$
 验证有1-3位小数的正实数：^[0-9]+(.[0-9]{1,3})?$
 验证非零的正整数：^\+?[1-9][0-9]*$
 验证非零的负整数：^\-[1-9][0-9]*$
 验证非负整数（正整数 + 0）  ^\d+$
 验证非正整数（负整数 + 0）  ^((-\d+)|(0+))$
 验证长度为3的字符：^.{3}$
 验证由26个英文字母组成的字符串：^[A-Za-z]+$
 验证由26个大写英文字母组成的字符串：^[A-Z]+$
 验证由26个小写英文字母组成的字符串：^[a-z]+$
 验证由数字和26个英文字母组成的字符串：^[A-Za-z0-9]+$
 验证由数字、26个英文字母或者下划线组成的字符串：^\w+$
 验证用户密码:^[a-zA-Z]\w{5,17}$ 正确格式为：以字母开头，长度在6-18之间，只能包含字符、数字和下划线。
 验证是否含有 ^%&',;=?$\" 等字符：[^%&',;=?$\x22]+
 验证汉字：^[\u4e00-\u9fa5],{0,}$
 验证Email地址：^\w+[-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
 验证InternetURL：^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$ ；^[a-zA-z]+://(w+(-w+)*)(.(w+(-w+)*))*(?S*)?$
 验证电话号码：^(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$：--正确格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX。
 验证电话号码及手机:（\d{3}-\d{8}|\d{4}-\d{7}）｜（^((\(\d{3}\))|(\d{3}\-))?13\d{9}|15[89]\d{8}$）
 验证身份证号（15位或18位数字）：^\d{15}|\d{}18$
 验证一年的12个月：^(0?[1-9]|1[0-2])$ 正确格式为：“01”-“09”和“1”“12”
 验证一个月的31天：^((0?[1-9])|((1|2)[0-9])|30|31)$    正确格式为：01、09和1、31。
 整数：^-?\d+$
 非负浮点数（正浮点数 + 0）：^\d+(\.\d+)?$
 正浮点数   ^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$
 非正浮点数（负浮点数 + 0） ^((-\d+(\.\d+)?)|(0+(\.0+)?))$
 负浮点数  ^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$
 浮点数  ^(-?\d+)(\.\d+)?$
 */
@implementation NSString (Regular)

- (BOOL)isURL{
    NSString *pattern = @"^\\w+[-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL)isEmail{
    NSString *pattern = @"^\\w+[-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL)isChinsese{
    NSString *pattern = @"^[\u4e00-\u9fa5],{0,}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL)isCellPhone{
    NSString *pattern = @"\\d{3}-\\d{8}|\\d{4}-\\d{7}）｜（^((\\(\\d{3}\\))|(\\d{3}\\-))?13\\d{9}|15[89]\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL)isResidentIdentityCard{
    NSString *pattern = @"^\\d{15}|\\d{}18$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL)isIntegerValue{
    NSString *pattern = @"^-?\\d+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL)isFloatNumber{
    NSString *pattern = @"^(-?\\d+)(\\.\\d+)?$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL)isNegativeFloatNumber{
    NSString *pattern = @"^(-(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*)))$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

- (BOOL)isNumber{
    NSString *pattern = @"^[0-9]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:self];
}

@end
