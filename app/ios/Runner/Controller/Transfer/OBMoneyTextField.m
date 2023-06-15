
#import "OBMoneyTextField.h"
#import "NSString+MKAdd.h"

#pragma mark - OBMoneyTextFieldLimit

@interface OBMoneyTextFieldLimit ()
@property (nonatomic, strong) NSString *tempText;
@property (nonatomic, strong) NSString *tempString;
@end

@implementation OBMoneyTextFieldLimit

- (instancetype)init{
    if (self = [super init]) {
        _maxLimit = @"99999999999999";
        _minLimit = @"0";
        _decimalsLimit = 2;
    }
    return self;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{

}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(obMoneyTextFieldDidEndEditing:)]) {
        [self.limitDelegate obMoneyTextFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return [self updateText:textField replacementString:string];

}

- (BOOL)updateText:(UITextField *)textField replacementString:(NSString *)string {
    _tempText = [textField.text stringByReplacingOccurrencesOfString:@"," withString:@""];
    _tempString = [string stringByReplacingOccurrencesOfString:@"," withString:@""];
    _maxLimit = [_maxLimit stringByReplacingOccurrencesOfString:@"," withString:@""];
    _minLimit = [_minLimit stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    if (string && string.length > 0) {
        // 输入
        if (_tempText.length == 0) {
            if ([string isEqualToString:@"."]) {
                _tempText = @"0";
                return YES;
            }
            
        }else if (_tempText.length == 1){
            if ([_tempText isEqualToString:@"0"]) {
                if ([string isEqualToString:@"."]) {
                    return YES;
                }else{
                    return NO;
                }
            }
        }
        if ([_tempText stringByAppendingString:string].floatValue >= [_maxLimit floatValue]) {
            
            if (_maxLimit.floatValue < _minLimit.floatValue) {
                NSString *tmpTxt = textField.text;
                textField.text = [tmpTxt numDisplayDec:NO];
                if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(obMoneyTextFieldValueMinLimit:)]) {
                    [self.limitDelegate obMoneyTextFieldValueMinLimit:textField];
                }
            }else {
                NSString *tmpTxt = _maxLimit == 0 ? nil : _maxLimit;
                textField.text = [tmpTxt numDisplayDec:NO];
                if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(obMoneyTextFieldValueChanged:)]) {
                    [self.limitDelegate obMoneyTextFieldValueChanged:textField];
                }
            }
            return NO;
        }
        
        NSRange docRange = [_tempText rangeOfString:@"."];
        if (docRange.location != NSNotFound) {
            // 已输入小数点, 禁止再输入小数点
            if ([string isEqualToString:@"."]) {
                return NO;
            }
            // 小数点后位数
            NSUInteger decimals = _tempText.length - (docRange.location + docRange.length);
            if (decimals >= _decimalsLimit) {
                // 小数点位数限制后禁止输入任何字符
                return NO;
            }
        }else{
            if (_tempText.length == 0) {
                // 第一位
                if ([string isEqualToString:@"."] || [string isEqualToString:@"0"]) {
                    return NO;
                }
            }
        }
    }
    return YES;
}

#pragma mark - TextFieleActions
- (void)valueChanged:(UITextField *)textField {
    
    _tempText = [textField.text stringByReplacingOccurrencesOfString:@"," withString:@""];
    _tempString = [_tempString stringByReplacingOccurrencesOfString:@"," withString:@""];
    _maxLimit = [_maxLimit stringByReplacingOccurrencesOfString:@"," withString:@""];
    _minLimit = [_minLimit stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    NSRange docRange = [_tempText rangeOfString:@"."];
    if (_tempString && _tempString.length > 0) {
        
        // 输入
        if (docRange.location != NSNotFound) {
            // 有小数点
            textField.text = [NSString stringWithFormat:@"%@%@",_tempText,_tempString];
        }else{
            // 无小数点
            if ([_tempString isEqualToString:@"."]) {
                // 是小数点
                textField.text = [NSString stringWithFormat:@"%@%@",_tempText,_tempString];
            }else{
                // 不是小数点
                textField.text = [NSString stringWithFormat:@"%ld",_tempText.integerValue * 10 + _tempString.integerValue];
            }
        }
    }else{
        // 删除
        if (_tempText.length > 0) {
            textField.text = [_tempText substringToIndex:_tempText.length - 1];
        }else {
            textField.text = _tempText;
        }
        
    }
    
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(obMoneyTextFieldValueChanged:)]) {
        [self.limitDelegate obMoneyTextFieldValueChanged:textField];
    }
}

@end

#pragma mark - OBMoneyTextField

@implementation OBMoneyTextField

+ (instancetype)createMoneyTextField {
    OBMoneyTextField *moneyTextField = [[OBMoneyTextField alloc] init];
    moneyTextField.keyboardType = UIKeyboardTypeDecimalPad;
    return moneyTextField;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self.limit;
        [self addTarget:self.limit
                 action:@selector(valueChanged:)
       forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)keyInput:(NSString *)text {
    if ([self.limit updateText:self replacementString:text]) {
        [self sendActionsForControlEvents:UIControlEventEditingChanged];
    }
}

- (void)setText:(NSString *)text {
    if (text.floatValue > self.limit.maxLimit.floatValue) {
        text = self.limit.maxLimit;
    }
    [super setText:text];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    // 禁止 粘贴、剪切、选择
    if (action == @selector(paste:)
        || action == @selector(cut:)
        || action == @selector(copy:)
        || action == @selector(select:)){
        return NO;
    }
    return [super canPerformAction:action withSender:sender];
}

#pragma mark - Getter
- (OBMoneyTextFieldLimit *)limit {
    if (!_limit) {
        _limit = [[OBMoneyTextFieldLimit alloc] init];
    }
    return _limit;
}

@end
