//
//  headerFile.h
//  Runner
//
//  Created by Tmoson on 2022/2/21.
//

#ifndef headerFile_h
#define headerFile_h

///屏幕宽高
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define LL_iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})
///导航栏&&底部高度
#define kLayoutNavbarHeight                  (LL_iPhoneX ? 88 : 64)
#define kLayoutStatusBarHeight               (LL_iPhoneX ? 44 : 20)
#define kLayoutBottomSafeArea                (LL_iPhoneX ? 34 : 0)
#define KLayoutTabbarHeight                  (LL_iPhoneX ? 83 : 49)
#define KLayoutSafeAreaTopHeight             (LL_iPhoneX ? 24 : 0)

//原比例
#define k750Scale (1)
#define k750AdaptationFont(size) ([UIFont systemFontOfSize:size * k750Scale])
#define k750AdaptationBoldFont(size) ([UIFont boldSystemFontOfSize:size * k750Scale])
#define k750AdaptationWidth(a) (a * k750Scale)

//实际缩放比例
#define k750RealScale (SCREEN_WIDTH/375.0)
#define k750RealAdaptationFont(size) ([UIFont systemFontOfSize:size * k750RealScale])
#define k750RealAdaptationBoldFont(size) ([UIFont boldSystemFontOfSize:size * k750RealScale])
#define k750RealAdaptationWidth(a) (a * k750RealScale)

///color
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexColorAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define RandomColor RGBA(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 255)

#endif /* headerFile_h */

//weak strong

#ifndef weakify

#if DEBUG

#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif  // __has_feature(objc_arc)

#else

#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif  // __has_feature(objc_arc)

#endif  // DEBUG

#endif  // #ifndef weakify



#ifndef strongify

#if DEBUG

#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif  // __has_feature(objc_arc)

#else

#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif  // __has_feature(objc_arc)

#endif  // DEBUG

#endif  // #ifndef strongify
