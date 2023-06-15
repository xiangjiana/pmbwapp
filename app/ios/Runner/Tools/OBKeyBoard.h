//
//  OBKeyBoard.h
//  Runner
//
//  Created by Tmoson on 2022/5/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//屏幕适配
CG_INLINE CGFloat
GTReViewXFloat(CGFloat x) {
    CGRect sreenBounds = [UIScreen mainScreen].bounds;
    CGFloat scale  = sreenBounds.size.width/375;
    return scale*x;
}

/**
 键盘按钮类型
 
 - OBKeyBoardClearAll: 清除
 - OBKeyBoardDelete: 删除
 - OBKeyBoardOther: 0-9
 */
typedef NS_ENUM(NSInteger,OBKeyBoardType) {
    OBKeyBoardClearAll,
    OBKeyBoardDelete,
    OBKeyBoardOther,
    OBKeyBoardDawn,
};

typedef void(^KeyBoardClickBlcok)(OBKeyBoardType keyBoardType, NSString *text);

@interface OBKeyBoard : UIView

@property (nonatomic,copy) KeyBoardClickBlcok keyBoardClickBlock;

@end

NS_ASSUME_NONNULL_END
