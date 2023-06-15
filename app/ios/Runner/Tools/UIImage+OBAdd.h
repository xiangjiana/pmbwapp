

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (OBAdd)


/// 改变图片的大小
/// @param size 需要改变的图片
- (instancetype)scaleToSize:(CGSize)size;

/// 绘制图片，在中心
/// @param frame 大小
- (void)drawAtCenterInRect:(CGRect)frame percentage:(CGFloat)percentage;

/// 颜色转图片
/// @param color 颜色
+ (nullable instancetype)imageWithColor:(UIColor *)color ;

/// 修改图片颜色
/// @param color 颜色
- (instancetype)imageWithColor:(UIColor *)color;

/// 生成绿色渐变图片
/// @param frame 大小
+ (instancetype)greenImageOfGradinentWithFrame:(CGRect)frame;

+ (instancetype)pmModelBButtonImageOfGradinentWithFrame:(CGRect)frame alpha:(CGFloat)alpha;
/// 生成OB渐变图片
/// @param frame 大小
+ (instancetype)obButtonImageOfGradinentWithFrame:(CGRect)frame alpha:(CGFloat)alpha;

+ (instancetype)obButtonImageKeyGradinentWithFrame:(CGRect)frame alpha:(CGFloat)alpha;

/// 生成导航栏蓝色渐变图片
/// @param rect 大小
+ (instancetype)navgationImageForFrame:(CGRect)rect;

/// 生成一张渐变色的图片
/// @param colors 颜色数组
/// @param rect 图片大小
/// @param startPoint 开始点
/// @param endPoint 结束点
+ (instancetype)gradientImageWithColors:(NSArray *)colors rect:(CGRect)rect withStartPoint:(CGPoint)startPoint withEndPoint:(CGPoint)endPoint;

/// 生成一条虚线
/// @param imageView 图片
/// @param rect 大小
/// @param color 颜色
+ (instancetype)drawLineOfDashByImageView:(UIImageView *)imageView drawRect:(CGRect)rect lineColor:(UIColor *)color;

/// 获取flutter图片资源
/// @param name 图片名称
+ (instancetype)imageFlutterAssets:(NSString *)name;

/// 获取flutter ob_com_png 图片资源
/// @param name 图片名称
+ (instancetype)imageFlutterOBComBaseAssets:(NSString *)name;

/// 获取flutter图片资源
/// @param name 图片名称
/// @param package 库名
+ (instancetype)imageFlutterAssets:(NSString *)name package:(nullable NSString *)package;

@end

NS_ASSUME_NONNULL_END
