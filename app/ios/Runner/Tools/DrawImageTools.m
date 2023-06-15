//
//  DrawImageTools.m
//  Runner
//
//  Created by Tmoson on 2022/2/21.
//

#import "DrawImageTools.h"
#import "UIImage+OBAdd.h"

@implementation DrawImageTools

+ (UIImage *)drawLineOfDashByImageView:(UIImageView *)imageView {
    // 开始划线 划线的frame
    UIGraphicsBeginImageContext(imageView.frame.size);
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextRef line = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(line, kCGLineCapRound);
    CGFloat lengths[] = {3,2};
    CGContextSetStrokeColorWithColor(line, [UIColor.whiteColor colorWithAlphaComponent:0.6].CGColor);
    CGContextSetLineDash(line, 0, lengths, 1);
    CGContextMoveToPoint(line, 0.0, 0.0);
    CGContextAddLineToPoint(line, 0.0, 300.0);
    CGContextStrokePath(line);
    return UIGraphicsGetImageFromCurrentImageContext();
}

+ (UIImage *)drawFlutterImageBaseForSwift:(NSString *)name {
    return [UIImage imageFlutterOBComBaseAssets:name];
}

+ (nullable UIImage *)drawFlutterImageForSwift:(NSString *)name package:(NSString *)package {
    return [UIImage imageFlutterAssets:name package:package];
}

@end
