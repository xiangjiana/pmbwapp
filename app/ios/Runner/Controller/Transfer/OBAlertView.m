//
//  OBAlertView.m
//  Runner
//
//  Created by Tmoson on 2022/2/21.
//

#import "OBAlertView.h"
#import "headerFile.h"
#import <Masonry/Masonry.h>
#import "UIImage+OBAdd.h"

@interface OBAlertView ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIButton *sureButton;

@property (nonatomic, strong) UIButton *cancelButton;

@end


@implementation OBAlertView

+ (instancetype)createAlertTitle:(NSString *)title confirmColor:(BOOL)isPurple content:(NSString *)content cancelBlock:(nullable OBAlertBlock)cancelBlock cancelTitle:(nullable NSString *)cancelTitle sureBlock:(OBAlertBlock)sureBlock sureTitle:(NSString *)sureTitle {
    OBAlertView *alertView = [[OBAlertView alloc] initTitle:title confirmColor:isPurple content:content cancelBlock:cancelBlock cancelTitle:cancelTitle sureBlock:sureBlock sureTitle:sureTitle];
    return alertView;
    
}

+ (instancetype)createAlertTitle:(NSString *)title confirmColor:(BOOL)isPurple content:(NSString *)content sureBlock:(OBAlertBlock)sureBlock sureTitle:(NSString *)sureTitle {
    OBAlertView *alertView = [[OBAlertView alloc] initTitle:title confirmColor:isPurple content:content cancelBlock:nil cancelTitle:nil sureBlock:sureBlock sureTitle:sureTitle];
    return alertView;
    
}

- (instancetype)initTitle:(NSString *)title confirmColor:(BOOL)isPurple content:(NSString *)content cancelBlock:(OBAlertBlock)cancelBlock cancelTitle:(NSString *)cancelTitle sureBlock:(OBAlertBlock)sureBlock sureTitle:(NSString *)sureTitle {
    if (self = [super init]) {
        
        self.cancelBlock = cancelBlock;
        self.sureBlock = sureBlock;
        
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
        
        self.titleLabel.text = title;
        [contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView.mas_left).offset(16);
            make.right.mas_equalTo(contentView.mas_right).offset(-16);
            make.top.mas_equalTo(contentView.mas_top).offset(24);
        }];
        
        self.contentLabel.text = content;
        [contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView.mas_left).offset(16);
            make.right.mas_equalTo(contentView.mas_right).offset(-16);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(12);
        }];
        
        UIImage *imgageSure1 = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/btnbg.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *imgageSure2 = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/btnbg_2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *imgageCancel = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/btnbg_3.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        if (cancelBlock != nil) {
            [self.sureButton setTitle:sureTitle forState:UIControlStateNormal];
            if (isPurple) {
                [self.sureButton setBackgroundImage:imgageSure2 forState:UIControlStateNormal];
            } else {
                [self.sureButton setBackgroundImage:imgageSure1 forState:UIControlStateNormal];
            }
            [contentView addSubview:self.sureButton];
            [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(contentView.mas_centerX).offset(12);
                make.right.mas_equalTo(contentView.mas_right).offset(-16);
                make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(24);
                make.height.mas_equalTo(40);
                make.bottom.mas_equalTo(contentView.mas_bottom).offset(-16);
            }];
            
            [self.cancelButton setTitle:cancelTitle forState:UIControlStateNormal];
            [self.cancelButton setBackgroundImage:imgageCancel forState:UIControlStateNormal];
            [contentView addSubview:self.cancelButton];
            [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(contentView.mas_left).offset(16);
                make.right.mas_equalTo(contentView.mas_centerX).offset(-12);
                make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(24);
                make.height.mas_equalTo(40);
            }];
            
            
        }else {
            [self.sureButton setTitle:sureTitle forState:UIControlStateNormal];
            if (isPurple) {
                [self.sureButton setBackgroundImage:imgageSure2 forState:UIControlStateNormal];
            } else {
                [self.sureButton setBackgroundImage:imgageSure1 forState:UIControlStateNormal];
            }
            [contentView addSubview:self.sureButton];
            [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(contentView.mas_left).offset(16);
                make.right.mas_equalTo(contentView.mas_right).offset(-16);
                make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(24);
                make.height.mas_equalTo(40);
                make.bottom.mas_equalTo(contentView.mas_bottom).offset(-16);
            }];
        }
    }
    return self;
}

- (void)backButtonClick:(UIButton *)btn {
    if (self.cancelBlock != nil) {
        self.cancelBlock();
    }else {
        if (self.sureBlock) {
            self.sureBlock();
        }
    }
    [self removeFromSuperview];
}

- (void)sureButtonClick:(UIButton *)btn {
    if (self.sureBlock != nil) {
        self.sureBlock();
    }
    [self removeFromSuperview];
}

- (void)cancelButtonClick:(UIButton *)btn {
    if (self.cancelBlock != nil) {
        self.cancelBlock();
    }
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
        UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        sureButton.titleLabel.font = [UIFont systemFontOfSize:16];
//        sureButton.layer.cornerRadius = 20;
        [sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _sureButton = sureButton;
    }
    
    return _sureButton;
}

- (UIButton *)cancelButton {
    if (_cancelButton == nil) {
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        cancelButton.backgroundColor = HexColorAlpha(0xFFFFFF, 0.2);
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
//        cancelButton.layer.cornerRadius = 20;
        [cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton = cancelButton;
    }
    
    return _cancelButton;
}


@end
