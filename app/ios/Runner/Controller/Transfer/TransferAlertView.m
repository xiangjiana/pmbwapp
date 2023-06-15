//
//  TransferAlertView.m
//  Runner
//
//  Created by Tmoson on 2022/2/23.
//

#import "TransferAlertView.h"
#import "headerFile.h"
#import <Masonry/Masonry.h>
#import "OBMoneyTextField.h"
#import "UIImage+OBAdd.h"
#import "OBChannelManager.h"
#import "OBKeyBoard.h"
#import "NSString+MKAdd.h"
#import "LanguageManager.h"

@interface TransferAlertView ()<OBMoneyTextFieldLimitDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIButton *sureButton;

@property (nonatomic, strong) UIButton *cancelButton;

@property (nonatomic, copy) OBTransferAlertBlock sureBlock;

@property (nonatomic, strong) UILabel *plusKLabel;

@property (nonatomic, strong) OBMoneyTextField *inputTextField;

@property (nonatomic, copy) NSString *walletAmount;

@property (nonatomic, strong) NSDictionary *args;

@end


@implementation TransferAlertView

- (instancetype)initGameCode:(NSString *)gameCode walletAmount:(NSString *)walletAmount args:(NSDictionary *)args SureBlock:(OBTransferAlertBlock)sureBlock {
    if (self = [super init]) {
        
        self.sureBlock = sureBlock;
        self.walletAmount = walletAmount;
        self.args = args;
        
        [self registerNotification];
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.6];
        
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = self.frame;
        [btn addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        UIView *contentView = [[UIView alloc] init];
        contentView.layer.cornerRadius = 8;
        contentView.backgroundColor = HexColor(0x1D2933);
        contentView.layer.borderWidth = 1.f;
        contentView.layer.borderColor = [UIColor.whiteColor colorWithAlphaComponent:0.1].CGColor;
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self).inset(16);
            make.centerY.mas_equalTo(self);
        }];
        
        self.titleLabel.text = NSLocalizedString(@"transfer_in_amount", nil);
        [contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView.mas_left).offset(16);
            make.right.mas_equalTo(contentView.mas_right).offset(-16);
            make.top.mas_equalTo(contentView.mas_top).offset(24);
        }];
        
        self.contentLabel.text = NSLocalizedString(@"you_are_join_activity_can_not_transfer_out", nil);
        [contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView.mas_left).offset(16);
            make.right.mas_equalTo(contentView.mas_right).offset(-16);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(12);
        }];
        
        UILabel *inputTitleLabel = [[UILabel alloc] init];
        inputTitleLabel.text = [NSString stringWithFormat:@"%@（%@)",NSLocalizedString(@"mine_center_wallet", nil),LanguageManager.instance.curSymbol];
        inputTitleLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        inputTitleLabel.font = [UIFont systemFontOfSize:14];
        [contentView addSubview:inputTitleLabel];
        [inputTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView).mas_offset(16);
            make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(41);
        }];
        
        //抗拉伸性
        [inputTitleLabel setContentHuggingPriority:UILayoutPriorityRequired
                                           forAxis:UILayoutConstraintAxisHorizontal];
        //抗压缩性
        [inputTitleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                         forAxis:UILayoutConstraintAxisHorizontal];
        
        UILabel *walletLabel = [[UILabel alloc] init];
        walletLabel.text = [walletAmount numDisplayDec:YES];
        walletLabel.textColor = HexColor(0xE1A100);
        walletLabel.font = [UIFont systemFontOfSize:14];
        [contentView addSubview:walletLabel];
        [walletLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(inputTitleLabel.mas_right).mas_offset(16);
            make.centerY.mas_equalTo(inputTitleLabel.mas_centerY);
        }];
        
        UIButton *tapBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [tapBtn addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:tapBtn];
        [tapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(contentView);
            make.bottom.mas_equalTo(walletLabel.mas_bottom);
        }];
        
        UIButton *allButton = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *t = NSLocalizedString(@"withdraw_maximum_amount", nil);
        [allButton setTitle:t forState:UIControlStateNormal];
        [allButton setTitleColor:HexColor(0xE1A100) forState:UIControlStateNormal];
        allButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [allButton addTarget:self action:@selector(allButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        CGSize tSize = [t textSizeWithFont:allButton.titleLabel.font];
        [contentView addSubview:allButton];
        [allButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(inputTitleLabel.mas_bottom).offset(12);
            make.right.mas_equalTo(contentView.mas_right).offset(-16);
            make.height.mas_equalTo(42);
            make.width.mas_equalTo(tSize.width + 8);
        }];
        
        UILabel *CNY = [[UILabel alloc] init];
        CNY.font = [UIFont systemFontOfSize:14 weight:500];
        CNY.text = LanguageManager.instance.curSymbol;
        CNY.textColor = [UIColor whiteColor];
        [contentView addSubview:CNY];
        [CNY mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView).mas_offset(16);
            make.width.mas_lessThanOrEqualTo(20);
            make.centerY.mas_equalTo(allButton.mas_centerY);
        }];


        if (LanguageManager.instance.isVND) {
            [contentView addSubview:self.plusKLabel];
            [self.plusKLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(allButton.mas_left);
                make.width.mas_lessThanOrEqualTo(20);
                make.centerY.mas_equalTo(allButton.mas_centerY);
            }];
            [contentView addSubview:self.inputTextField];
            [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(CNY.mas_right).mas_offset(8);
                make.right.mas_equalTo(self.plusKLabel.mas_left);
                make.centerY.mas_equalTo(allButton.mas_centerY);
                make.height.mas_equalTo(42);
            }];
        } else {
            [contentView addSubview:self.inputTextField];
            [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(CNY.mas_right).mas_offset(8);
                make.right.mas_equalTo(allButton.mas_left);
                make.centerY.mas_equalTo(allButton.mas_centerY);
                make.height.mas_equalTo(42);
            }];
        }
        self.inputTextField.limit.maxLimit = [walletAmount numDisplayDec:NO];
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.06];
        [contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(contentView).inset(16);
            make.top.mas_equalTo(allButton.mas_bottom);
            make.height.mas_equalTo(1);
        }];
        
        
        [self.sureButton setTitle:NSLocalizedString(@"confirm", nil) forState:UIControlStateNormal];
        [contentView addSubview:self.sureButton];
        [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView.mas_centerX).offset(12);
            make.right.mas_equalTo(contentView.mas_right).offset(-16);
            make.top.mas_equalTo(line.mas_bottom).offset(24);
            make.height.mas_equalTo(40);
            make.bottom.mas_equalTo(contentView.mas_bottom).offset(-16);
        }];
        
        
        [self.cancelButton setTitle:NSLocalizedString(@"cancel_in", nil) forState:UIControlStateNormal];
        [contentView addSubview:self.cancelButton];
        [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView.mas_left).offset(16);
            make.right.mas_equalTo(contentView.mas_centerX).offset(-12);
            make.top.mas_equalTo(line.mas_bottom).offset(24);
            make.height.mas_equalTo(40);
        }];
    }
    return self;
}

- (void)registerNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eventDialogTransferActionListen:) name:OBEventIdentifier_eventDialogTransferAction object:nil];
    
}

- (void)deleteNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OBEventIdentifier_eventDialogTransferAction object:nil];
}

- (void)eventDialogTransferActionListen:(NSNotification*)notification {
    NSDictionary *dict = notification.object;
    if (dict != nil && [dict isKindOfClass:[NSDictionary class]]) {
        NSString *type = dict[@"type"];
        if ([type isEqualToString:@"getNative"]) {
            NSString *status = dict[@"status"];
            if ([status isEqualToString:@"true"]) {
                [self removeFromSuperview];
            }

        }
    }
}

- (void)obMoneyTextFieldValueChanged:(UITextField *)textField {
    [self checkComnitButtonEnable];
}

- (void)backButtonClick:(UIButton *)btn {
    [self.inputTextField resignFirstResponder];
}

- (void)sureButtonClick:(UIButton *)btn {
    if (self.sureBlock != nil) {
        self.sureBlock();
    }
    [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_eventDialogTransferAction arguments:@{@"type": @"action", @"accountId" : self.args[@"gameCode"] ?: @"",@"amount" : self.inputTextField.text.numHandleIfVND, @"url" : self.args[@"url"]?: @"", @"gameId" : self.args[@"gameId"]?: @"", @"gameName" : self.args[@"title"]?: @"", @"testify" : self.args[@"testify"]?: @"", @"typeNum" : self.args[@"typeNum"]?: @""}];
}

- (void)allButtonClick:(UIButton *)button {
    self.inputTextField.text = [NSString stringWithFormat:@"%.02f",self.walletAmount ? self.walletAmount.doubleValue : 0];
    [self checkComnitButtonEnable];
}

- (void)checkComnitButtonEnable {
    
    BOOL enabled = NO;
    if (_inputTextField.text.doubleValue > 0) {
        enabled = YES;
    }
    _sureButton.enabled = enabled;
}

- (void)cancelButtonClick:(UIButton *)btn {
    [self removeFromSuperview];
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return  _titleLabel;
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    }
    return _contentLabel;
}

- (UIButton *)sureButton {
    if (_sureButton == nil) {
        UIImage *imgage = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/btnbg_2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *imgageDis = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/btnbg_2_dis.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sureButton setBackgroundImage:imgage forState:UIControlStateNormal];
        [sureButton setBackgroundImage:imgageDis forState:UIControlStateDisabled];
        sureButton.titleLabel.font = [UIFont systemFontOfSize:16];
//        sureButton.layer.cornerRadius = 20;
        [sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        sureButton.enabled = NO;
        _sureButton = sureButton;
    }
    
    return _sureButton;
}

- (UIButton *)cancelButton {
    if (_cancelButton == nil) {
        UIImage *imgage = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/btnbg_3.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        cancelButton.backgroundColor = HexColorAlpha(0xFFFFFF, 0.2);
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [cancelButton setBackgroundImage:imgage forState:UIControlStateNormal];
//        cancelButton.layer.cornerRadius = 20;
        [cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton = cancelButton;
    }
    
    return _cancelButton;
}

- (UILabel *)plusKLabel {
    if (_plusKLabel == nil) {
        _plusKLabel = [[UILabel alloc] init];
        _plusKLabel.text = @"K";
        _plusKLabel.font = [UIFont boldSystemFontOfSize:16];
        _plusKLabel.textColor = [UIColor whiteColor];
        _plusKLabel.textAlignment = NSTextAlignmentCenter;
    }
    return  _plusKLabel;
}

- (OBMoneyTextField *)inputTextField {
    if (_inputTextField == nil) {
        
        OBKeyBoard *keyBoard = [[OBKeyBoard alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 291)];
        __weak typeof(self) weakSelf = self;
        keyBoard.keyBoardClickBlock = ^(OBKeyBoardType keyBoardType, NSString *text) {
            __strong typeof(self) strongSelf = weakSelf;
            switch (keyBoardType) {
                case OBKeyBoardOther:
                {
                    [strongSelf->_inputTextField keyInput:text];
                }
                    break;
                case OBKeyBoardDelete:
                {
                    [strongSelf->_inputTextField keyInput:@""];
                }
                    break;
                case OBKeyBoardClearAll:
                {
                    strongSelf->_inputTextField.text = @"";
                }
                    break;
                case OBKeyBoardDawn:
                {
                    [strongSelf->_inputTextField resignFirstResponder];
                }
                    break;
                default:
                    break;
            }
        };
        _inputTextField = [OBMoneyTextField createMoneyTextField];
        _inputTextField.limit.limitDelegate = self;
        _inputTextField.tintColor = HexColor(0x3BC117);
        _inputTextField.keyboardAppearance = UIKeyboardAppearanceAlert;
        _inputTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"vip_level_trans_hintText", nil) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16], NSForegroundColorAttributeName:[UIColor.whiteColor colorWithAlphaComponent:0.3]}];
        _inputTextField.inputView = keyBoard;
        _inputTextField.textColor = UIColor.whiteColor;
        _inputTextField.font = [UIFont boldSystemFontOfSize:18];
        
    }
    return _inputTextField;
}

-(void)dealloc {
    [self deleteNotification];
}

@end
