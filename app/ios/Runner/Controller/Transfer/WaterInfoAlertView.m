//
//  WaterInfoAlertView.m
//  Runner
//
//  Created by Tmoson on 2022/2/23.
//

#import "WaterInfoAlertView.h"
#import "headerFile.h"
#import <Masonry/Masonry.h>
#import "OBChannelManager.h"
#import "UIImage+OBAdd.h"
#import "NSString+MKAdd.h"

@interface WaterInfoAlertView ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UIButton *sureButton;

@property (nonatomic, strong) UILabel *dataAvLabel;

@property (nonatomic, strong) UILabel *dataNeedLabel;

@property (nonatomic, strong) UILabel *dataDoneLabel;

@property (nonatomic, strong) UILabel *dataRateLabel;

@end


@implementation WaterInfoAlertView

- (instancetype)initWithGameCode:(NSString *)gameCode dict:(NSDictionary *)dict {
    if (self = [super init]) {
        
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
        
        self.titleLabel.text = NSLocalizedString(@"withdraw_flowing_water_details", nil);
        [contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView.mas_left).offset(16);
            make.right.mas_equalTo(contentView.mas_right).offset(-16);
            make.top.mas_equalTo(contentView.mas_top).offset(24);
        }];
        
        UIView *dataView = [[UIView alloc] init];
        dataView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.04];
        dataView.layer.cornerRadius = 8;
        [contentView addSubview:dataView];
        [dataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(contentView).inset(16);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(12);
        }];
        
        UILabel *titleAv = [self dataTitle:NSLocalizedString(@"vip_level_submit_active", nil)];
        titleAv.numberOfLines = 0;
      
        
        UILabel *titleNeed = [self dataTitle:NSLocalizedString(@"my_wallet_required_running_water", nil)];
        titleNeed.numberOfLines = 0;
        [dataView addSubview:titleNeed];
        
        UILabel *titleDone = [self dataTitle:NSLocalizedString(@"withdraw_flow_has_been_completed", nil)];
        titleDone.numberOfLines = 0;
        [dataView addSubview:titleDone];
        
        [dataView addSubview:self.dataNeedLabel];
        [dataView addSubview:self.dataDoneLabel];
        [dataView addSubview:self.dataRateLabel];
        
        UIView *avView = [[UIView alloc] init];
        [dataView addSubview:avView];
        [avView addSubview:titleAv];
        [avView addSubview:self.dataAvLabel];
        
        [avView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(dataView).inset(12);
            make.top.mas_equalTo(dataView.mas_top).offset(8);
        }];
        
        [titleAv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(avView);
            make.width.mas_lessThanOrEqualTo(avView.mas_width).multipliedBy(0.48);
        }];
        
        [self.dataAvLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.mas_equalTo(avView);
            make.width.mas_lessThanOrEqualTo(dataView.mas_width).multipliedBy(0.5);
        }];
        
        //抗压缩性
        [titleAv setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                 forAxis:UILayoutConstraintAxisVertical];
        
        //抗压缩性
        [self.dataAvLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                          forAxis:UILayoutConstraintAxisVertical];
        
        [titleNeed mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(avView.mas_bottom).offset(8);
            make.left.mas_equalTo(dataView).offset(12);
            make.width.mas_lessThanOrEqualTo(dataView.mas_width).multipliedBy(0.4);
        }];
        
        [self.dataNeedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(titleNeed.mas_centerY);
            make.right.mas_equalTo(dataView.mas_right).offset(-12);
        }];
        
        [titleDone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(titleNeed.mas_bottom).offset(8);
            make.left.mas_equalTo(dataView.mas_left).offset(12);
            make.width.mas_lessThanOrEqualTo(dataView.mas_width).multipliedBy(0.4);
            make.bottom.mas_equalTo(dataView.mas_bottom).offset(-8);
        }];
        
        [self.dataRateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(titleDone.mas_centerY);
            make.right.mas_equalTo(dataView.mas_right).offset(-12);
        }];
        
        //抗拉伸性
        [self.dataRateLabel setContentHuggingPriority:UILayoutPriorityRequired
                                             forAxis:UILayoutConstraintAxisHorizontal];
        
        //抗压缩性
        [self.dataRateLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                            forAxis:UILayoutConstraintAxisVertical];
        //抗压缩性
        [self.dataRateLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                            forAxis:UILayoutConstraintAxisHorizontal];

        [self.dataDoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(titleDone.mas_centerY);
            make.right.mas_equalTo(self.dataRateLabel.mas_left).offset(-16);
            make.left.mas_equalTo(titleDone.mas_right).offset(4);
        }];
        
        //抗压缩性
        [titleDone setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                            forAxis:UILayoutConstraintAxisVertical];
        self.contentLabel.text = NSLocalizedString(@"water_flow_content_tips", nil);
        [contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView.mas_left).offset(16);
            make.right.mas_equalTo(contentView.mas_right).offset(-16);
            make.top.mas_equalTo(dataView.mas_bottom).offset(12);
        }];
        
        [self.sureButton setTitle:NSLocalizedString(@"alert_know", nil) forState:UIControlStateNormal];
        [contentView addSubview:self.sureButton];
        [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(contentView.mas_left).offset(16);
            make.right.mas_equalTo(contentView.mas_right).offset(-16);
            make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(24);
            make.height.mas_equalTo(40);
            make.bottom.mas_equalTo(contentView.mas_bottom).offset(-16);
        }];
        
        if (dict != nil && [dict isKindOfClass:[NSDictionary class]]) {
            NSString *type = dict[@"type"];
            if ([type isEqualToString:@"getNative"]) {
                self.dataAvLabel.text = dict[@"activityName"] ?: @"";
                NSString *billAmount = dict[@"billAmount"];
                self.dataNeedLabel.text = billAmount ? [billAmount numDisplayDec:YES] : @"0.00";
                NSString *completeBillAmount = dict[@"completeBillAmount"];
                self.dataDoneLabel.text = completeBillAmount ? [completeBillAmount numDisplayDec:YES] : @"0.00";
                self.dataRateLabel.text = dict[@"percentage"] ? [NSString stringWithFormat:@"%0.02f%%",  [dict[@"percentage"] doubleValue]] : @"0.00%";
            }
        }
    }
    return self;
}

- (UILabel *)dataTitle:(NSString *)title {
    UILabel *dataTitle = [[UILabel alloc] init];
    dataTitle.text = title;
    dataTitle.font = [UIFont systemFontOfSize:14];
    dataTitle.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    return dataTitle;
}

- (void)backButtonClick:(UIButton *)btn {
    [self removeFromSuperview];
}

- (void)sureButtonClick:(UIButton *)btn {
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
        UIImage *imgage = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/btnbg.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sureButton setBackgroundImage:imgage forState:UIControlStateNormal];
        sureButton.titleLabel.font = [UIFont systemFontOfSize:16];
//        sureButton.layer.cornerRadius = 20;
        [sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _sureButton = sureButton;
    }
    
    return _sureButton;
}

- (UILabel *)dataAvLabel {
    if (_dataAvLabel == nil) {
        _dataAvLabel = [self dataTitle:@""];
        _dataAvLabel.textAlignment = NSTextAlignmentRight;
        _dataAvLabel.textColor = [UIColor whiteColor];
        _dataAvLabel.numberOfLines = 0;
    }
    return _dataAvLabel;
}

- (UILabel *)dataNeedLabel {
    if (_dataNeedLabel == nil) {
        _dataNeedLabel = [self dataTitle:@"0.00"];
        _dataNeedLabel.textAlignment = NSTextAlignmentRight;
        _dataNeedLabel.textColor = [UIColor whiteColor];
    }
    return _dataNeedLabel;
}

- (UILabel *)dataDoneLabel {
    if (_dataDoneLabel == nil) {
        _dataDoneLabel = [self dataTitle:@"0.00"];
        _dataDoneLabel.textAlignment = NSTextAlignmentRight;
        _dataDoneLabel.textColor = [UIColor whiteColor];
        _dataDoneLabel.numberOfLines = 0;
    }
    return _dataDoneLabel;
}

- (UILabel *)dataRateLabel {
    if (_dataRateLabel == nil) {
        _dataRateLabel = [self dataTitle:@"0.00%"];
        _dataRateLabel.textAlignment = NSTextAlignmentRight;
        _dataRateLabel.textColor = HexColor(0xE1A100);
    }
    return _dataRateLabel;
}

@end
