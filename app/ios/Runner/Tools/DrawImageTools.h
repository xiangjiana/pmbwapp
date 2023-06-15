//
//  DrawImageTools.h
//  Runner
//
//  Created by Tmoson on 2022/2/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawImageTools : NSObject

// 画虚线
+ (UIImage *)drawLineOfDashByImageView:(UIImageView *)imageView;

+ (nullable UIImage *)drawFlutterImageBaseForSwift:(NSString *)name;

+ (nullable UIImage *)drawFlutterImageForSwift:(NSString *)name package:(NSString *)package;

@end

NS_ASSUME_NONNULL_END
