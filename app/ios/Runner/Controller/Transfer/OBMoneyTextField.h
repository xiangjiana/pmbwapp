
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - OBMoneyTextFieldLimitDelegate

@protocol OBMoneyTextFieldLimitDelegate <NSObject>

@optional
- (void)obMoneyTextFieldDidEndEditing:(UITextField *)textField;

- (void)obMoneyTextFieldValueChanged:(UITextField *)textField;

- (void)obMoneyTextFieldValueMinLimit:(UITextField *)textField;

@end

@interface OBMoneyTextFieldLimit : NSObject <UITextFieldDelegate>

@property (nonatomic, weak) id <OBMoneyTextFieldLimitDelegate> limitDelegate;
/// 最大值限制
@property (nonatomic, copy) NSString *maxLimit; // 默认20000
/// 最小值限制
@property (nonatomic, copy) NSString *minLimit; // 默认2
/// 小数点后几位限制
@property (nonatomic, assign) NSUInteger decimalsLimit; // 默认 3


- (void)valueChanged:(UITextField *)textField;

@end

#pragma mark - OBMoneyTextField

@interface OBMoneyTextField : UITextField

@property (nonatomic, strong) OBMoneyTextFieldLimit *limit;

+ (instancetype)createMoneyTextField;

- (void)keyInput:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
