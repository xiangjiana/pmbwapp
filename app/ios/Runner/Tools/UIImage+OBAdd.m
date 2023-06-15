

#import "UIImage+OBAdd.h"
#import "OBChannelManager.h"
#import "headerFile.h"
/// 获取中心点
static inline CGPoint CGRectGetCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

@implementation UIImage (OBAdd)

+ (instancetype)gradientImageWithColors:(NSArray *)colors rect:(CGRect)rect withStartPoint:(CGPoint)startPoint withEndPoint:(CGPoint)endPoint{
    if (!colors.count || CGRectEqualToRect(rect, CGRectZero)) {
        return nil;
    }
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = rect;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    NSMutableArray *mutColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (UIColor *color in colors) {
        [mutColors addObject:(__bridge id)color.CGColor];
    }
    gradientLayer.colors = [NSArray arrayWithArray:mutColors];
    
    UIGraphicsBeginImageContextWithOptions(gradientLayer.frame.size, gradientLayer.opaque, 0);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}

+ (nullable instancetype)imageWithColor:(UIColor *)color {
    if (color == nil || ![color isKindOfClass:[UIColor class]]) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (instancetype)imageWithColor:(UIColor *)color{
    //获取画布
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    //画笔沾取颜色
    [color setFill];
    
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    //绘制一次
    [self drawInRect:bounds blendMode:kCGBlendModeOverlay alpha:1.0f];
    //再绘制一次
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    //获取图片
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (UIImage *)scaleToSize:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage * scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}


+ (instancetype)drawLineOfDashByImageView:(UIImageView *)imageView drawRect:(CGRect)rect lineColor:(UIColor *)color {
    // 开始划线 划线的frame
    UIGraphicsBeginImageContext(imageView.frame.size);

    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];

    // 获取上下文
    CGContextRef line = UIGraphicsGetCurrentContext();

    // 设置线条终点的形状
    CGContextSetLineCap(line, kCGLineCapRound);
    // 设置虚线的长度 和 间距
    CGFloat lengths[] = {2,1};

    CGContextSetStrokeColorWithColor(line, color.CGColor);
    // 开始绘制虚线
    CGContextSetLineDash(line, 0, lengths, 2);

    CGContextMoveToPoint(line, rect.origin.x, rect.origin.y);

    CGContextAddLineToPoint(line, rect.size.width, rect.size.height);

    CGContextStrokePath(line);

    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    return UIGraphicsGetImageFromCurrentImageContext();
}

- (void)drawAtCenterInRect:(CGRect)frame percentage:(CGFloat)percentage{
    CGPoint center = CGRectGetCenter(frame);
    CGRect finalFrame = CGRectMake(center.x - (frame.size.height * percentage)/2.0, center.y - (frame.size.height * percentage)/2.0, frame.size.height * percentage, frame.size.height * percentage);
    [self drawInRect:finalFrame];
}

+ (instancetype)pmModelBButtonImageOfGradinentWithFrame:(CGRect)frame alpha:(CGFloat)alpha {
    CAGradientLayer* gradinentlayer=[CAGradientLayer layer];
    UIColor * cornflowerBlueTwo = HexColorAlpha(0x77EA59, alpha);
    UIColor * skyBlue = HexColorAlpha(0x3BC117, alpha);
    gradinentlayer.colors=@[(__bridge id)skyBlue.CGColor,(__bridge id)cornflowerBlueTwo.CGColor];
    gradinentlayer.startPoint=CGPointMake(1, 0);
    gradinentlayer.endPoint=CGPointMake(0, 0);
    gradinentlayer.frame = frame;
    gradinentlayer.cornerRadius = frame.size.height / 2;
    UIGraphicsBeginImageContextWithOptions(gradinentlayer.frame.size, NO, 0);
    [gradinentlayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}

+ (instancetype)obButtonImageOfGradinentWithFrame:(CGRect)frame alpha:(CGFloat)alpha {
    CAGradientLayer* gradinentlayer=[CAGradientLayer layer];
    UIColor * cornflowerBlueTwo = [UIColor colorWithRed:255/255.0 green:144/255.0 blue:71/255.0 alpha:alpha];
    UIColor * skyBlue = [UIColor colorWithRed:255/255.0 green:87/255.0 blue:34/255.0 alpha:alpha];
    gradinentlayer.colors=@[(__bridge id)skyBlue.CGColor,(__bridge id)cornflowerBlueTwo.CGColor];
    gradinentlayer.startPoint=CGPointMake(1, 0);
    gradinentlayer.endPoint=CGPointMake(0, 0);
    gradinentlayer.frame = frame;
    gradinentlayer.cornerRadius = frame.size.height / 2;
    UIGraphicsBeginImageContextWithOptions(gradinentlayer.frame.size, NO, 0);
    [gradinentlayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}

+ (instancetype)obButtonImageKeyGradinentWithFrame:(CGRect)frame alpha:(CGFloat)alpha {
    CAGradientLayer* gradinentlayer=[CAGradientLayer layer];
    UIColor * cornflowerBlueTwo = [UIColor colorWithRed:255/255.0 green:144/255.0 blue:71/255.0 alpha:alpha];
    UIColor * skyBlue = [UIColor colorWithRed:255/255.0 green:87/255.0 blue:34/255.0 alpha:alpha];
    gradinentlayer.colors=@[(__bridge id)skyBlue.CGColor,(__bridge id)cornflowerBlueTwo.CGColor];
    gradinentlayer.startPoint=CGPointMake(1, 0);
    gradinentlayer.endPoint=CGPointMake(0, 0);
    gradinentlayer.frame = frame;
    gradinentlayer.cornerRadius = 5;
    UIGraphicsBeginImageContextWithOptions(gradinentlayer.frame.size, NO, 0);
    [gradinentlayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}

+ (instancetype)greenImageOfGradinentWithFrame:(CGRect)frame{
    CAGradientLayer* gradinentlayer=[CAGradientLayer layer];
    UIColor * tealish = [UIColor colorWithRed:44/255.0 green:185/255.0 blue:192/255.0 alpha:1];
    UIColor * robinSEgg = [UIColor colorWithRed:112/255.0 green:233/255.0 blue:233/255.0 alpha:1];
    gradinentlayer.colors=@[(__bridge id)tealish.CGColor,(__bridge id)robinSEgg.CGColor];
    gradinentlayer.startPoint=CGPointMake(0, 0);
    gradinentlayer.endPoint=CGPointMake(1, 0);
    gradinentlayer.frame = frame;
    UIGraphicsBeginImageContextWithOptions(gradinentlayer.frame.size, NO, 0);
    [gradinentlayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}


+ (instancetype)navgationImageForFrame:(CGRect)rect {
    CAGradientLayer* gradinentlayer=[CAGradientLayer layer];
    UIColor * cornflowerBlueTwo = [UIColor colorWithRed:111/255.0 green:176/255.0 blue:235/255.0 alpha:1];
    UIColor * skyBlue = [UIColor colorWithRed:86/255.0 green:131/255.0 blue:218/255.0 alpha:1];
    UIColor * deepSkyBlue = [UIColor colorWithRed:68/255.0 green:103/255.0 blue:208/255.0 alpha:1];
    gradinentlayer.colors=@[(__bridge id)cornflowerBlueTwo.CGColor,(__bridge id)skyBlue.CGColor,(__bridge id)deepSkyBlue.CGColor];
    gradinentlayer.startPoint=CGPointMake(0, 0);
    gradinentlayer.endPoint=CGPointMake(1, 0);
    gradinentlayer.frame=rect;
    UIGraphicsBeginImageContextWithOptions(gradinentlayer.frame.size, NO, 0);
    [gradinentlayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}

+ (instancetype)imageFlutterAssets:(NSString *)name {
    return [UIImage imageFlutterAssets:name package:nil];
}

+ (instancetype)imageFlutterOBComBaseAssets:(NSString *)name {
    return [UIImage imageFlutterAssets:name package:@"ob_com_png"];
}

+ (instancetype)imageFlutterAssets:(NSString *)name package:(NSString *)package {
    NSString *assetPath;
    if (package) {
        assetPath = [[OBChannelManager instance].registrar lookupKeyForAsset:name fromPackage:package];
    } else {
        assetPath = [[OBChannelManager instance].registrar lookupKeyForAsset:name];
    }
    if (assetPath) {
        return [UIImage imageNamed:assetPath];
    }
    return  nil;
    
}

@end
