//
//  TransferViewController.m
//  Runner
//
//  Created by Tmoson on 2022/2/21.
//


#import "headerFile.h"
#import "TransferViewController.h"
#import <Masonry/Masonry.h>
#import "DrawImageTools.h"
#import "TransferModel.h"
#import "OBAlertView.h"
#import "OBChannelManager.h"
#import "OBMoneyTextField.h"
#import "UIImage+OBAdd.h"
#import "OBBottomAlertView.h"
#import "OBHUDPlus.h"
#import "OBAlertView.h"
#import "NSString+MKAdd.h"
#import "OBKeyBoard.h"
#import "UIImage+OBAdd.h"
#import "NSBundle+Language.h"
#import "LanguageManager.h"
#import "WebPageViewController.h"

@interface TransferView : UIView

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *moneyLabel;

@property (nonatomic, strong) UIImageView *rightSingelImageView;

@property (nonatomic, strong) TransferModel *transferModel;

@property (nonatomic, copy) OBTransferBlock callBack;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIView *tapSelView;

@end

@implementation TransferView

- (instancetype)initWithModel:(nullable TransferModel *)model hidden:(BOOL)hidden {
    if (self = [super init]) {
        
        self.transferModel = model;
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGes:)];
        [self addGestureRecognizer:tapGestureRecognizer];
        
        
        [self addSubview:self.tapSelView];
        [self addSubview:self.contentView];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.moneyLabel];
        [self.contentView addSubview:self.rightSingelImageView];
        self.moneyLabel.hidden = hidden;
        
        
        if (model == nil) {
            self.tapSelView.hidden = NO;
            self.contentView.hidden = YES;
        }else {
            
            self.tapSelView.hidden = YES;
            self.contentView.hidden = NO;
            self.titleLabel.text = model.name;
            self.moneyLabel.text = [NSString stringWithFormat:@"%@ %@ %@", NSLocalizedString(@"transfer_existing", nil), LanguageManager.instance.curSymbol, model.balanceDisplayPlusK];
        }

        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
        
        [self.tapSelView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
        
        [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.contentView.mas_centerY).offset(2);
        }];
        
        if (hidden) {
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.height.centerY.mas_equalTo(self.contentView);
            }];
            
        }else {
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(self.contentView);
                make.bottom.mas_equalTo(self.contentView.mas_centerY).offset(-2);
            }];
        }
        
        CGSize titleLabelSize = [self.titleLabel.text textSizeWithFont:[UIFont boldSystemFontOfSize:14]];
        CGSize moneyLabelSize = [self.moneyLabel.text textSizeWithFont:[UIFont systemFontOfSize:12]];
        CGFloat maxLabelWidth = MAX(titleLabelSize.width, moneyLabelSize.width);
        
        [self.rightSingelImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(self.contentView.mas_left).offset(maxLabelWidth + 8);
            make.width.height.mas_equalTo(16);
        }];
        
        
    }
    return self;
}

- (void)tapGes:(UIGestureRecognizer *)tap {
    if (self.callBack) {
        self.callBack(self.transferModel);
    }
}

- (void)resetModel:(TransferModel *)model {
    self.transferModel = model;
    
    if (model == nil) {
        self.tapSelView.hidden = NO;
        self.contentView.hidden = YES;
    }else {
        self.rightSingelImageView.hidden = [model.walletId isEqualToString:@"0"];
        self.tapSelView.hidden = YES;
        self.contentView.hidden = NO;
        self.titleLabel.text = model.name;
        self.moneyLabel.text = [NSString stringWithFormat:@"%@ %@ %@", NSLocalizedString(@"transfer_existing", nil),LanguageManager.instance.curSymbol,model.balanceDisplayPlusK];
        CGSize titleLabelSize = [self.titleLabel.text textSizeWithFont:[UIFont boldSystemFontOfSize:14]];
        CGSize moneyLabelSize = [self.moneyLabel.text textSizeWithFont:[UIFont systemFontOfSize:12]];

        if (self.moneyLabel.hidden) {
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.height.centerY.mas_equalTo(self.contentView);
            }];
            [self.rightSingelImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
                make.left.mas_equalTo(self.contentView.mas_left).offset(titleLabelSize.width + 8);
            }];
        }else {
            CGFloat maxLabelWidth = MAX(titleLabelSize.width, moneyLabelSize.width);
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(self.contentView);
                make.bottom.mas_equalTo(self.contentView.mas_centerY).offset(-2);
            }];
            [self.rightSingelImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self.contentView.mas_centerY);
                make.left.mas_equalTo(self.contentView.mas_left).offset(maxLabelWidth + 8);
            }];
        }
        [self setNeedsLayout];
    }
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.textColor = UIColor.whiteColor;
    }
    return _titleLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = [UIFont systemFontOfSize:12];
        _moneyLabel.textColor = [UIColor.whiteColor colorWithAlphaComponent:0.6];
        _moneyLabel.hidden = YES;
    }
    return _moneyLabel;
}

- (UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}

- (UIView *)tapSelView {
    if (_tapSelView == nil) {
        _tapSelView = [[UIView alloc] init];
        _tapSelView.hidden = YES;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.text = NSLocalizedString(@"transfer_click_to_select", nil);
        titleLabel.textColor = [UIColor.whiteColor colorWithAlphaComponent:0.3];
        [_tapSelView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.height.centerY.mas_equalTo(_tapSelView);
        }];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_more_right"]];
        [_tapSelView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_tapSelView);
            make.left.mas_equalTo(titleLabel.mas_right).offset(16);
            make.width.height.mas_equalTo(16);
        }];
        
        //抗拉伸性
        [titleLabel setContentHuggingPriority:UILayoutPriorityRequired
                                    forAxis:UILayoutConstraintAxisHorizontal];
        //抗压缩性
        [titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                    forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _tapSelView;
}

- (UIImageView *)rightSingelImageView {
    if (_rightSingelImageView == nil) {
        _rightSingelImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_more_right"]];
    }
    return _rightSingelImageView;
}

@end

@interface TransferViewController () <OBMoneyTextFieldLimitDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UILabel *plusKLabel;

@property (nonatomic, strong) OBMoneyTextField *inputTextField;

@property (nonatomic, strong) UIButton *topTipsSwitchButton;

@property (nonatomic, strong) TransferView *firstTansferView;

@property (nonatomic, strong) TransferView *secondTansferView;

@property (nonatomic, strong) UIButton *recycleAllButton;

@property (nonatomic, strong) UIButton *commitButton;

@property (nonatomic, strong) TransferModel *transferModel;

@property (nonatomic, strong) UILabel *walletLabel;

@property (nonatomic, strong) NSMutableArray *walletArray;

@property (nonatomic, strong) OBBottomAlertView *bottomAlertView;

@end

@implementation TransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerNotification];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    tapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    self.view.backgroundColor = HexColor(0x0E1519);
    
    [self setUpUI];
    
    [self needGetDataFromFlutter];
    
}

- (void)needGetDataFromFlutter {
    [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_autoTransfer arguments:@{@"type" : @"get"}];
    
    [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_eventsyncwalletamount arguments:@{@"type" : @"get"}];
    
    
}

- (void)registerNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(autoTransferListen:) name:OBEventIdentifier_autoTransfer object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(walletListListen:) name:OBEventIdentifier_walletList object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(transferActionListen:) name:OBEventIdentifier_transferAction object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recycleAllListen:) name:OBEventIdentifier_recycleAll object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eventGetWaterInfoListen:) name:OBEventIdentifier_eventGetWaterInfo object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(customerServiceUrlListen:) name:OBEventIdentifier_customerServiceUrl object:nil];
}

- (void)deleteNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OBEventIdentifier_autoTransfer object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OBEventIdentifier_walletList object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OBEventIdentifier_transferAction object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OBEventIdentifier_recycleAll object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OBEventIdentifier_eventGetWaterInfo object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OBEventIdentifier_customerServiceUrl object:nil];
}


- (void)eventGetWaterInfoListen:(NSNotification*)notification {
    NSDictionary *dict = notification.object;
    if (dict != nil && [dict isKindOfClass:[NSDictionary class]]) {
        NSString *type = dict[@"type"];
        if ([type isEqualToString:@"getNative"]) {
            
            NSString *gameCode = dict[@"gameCode"];
            if (gameCode && [gameCode isKindOfClass:[NSString class]]) {
                for (TransferModel *mo in self.walletArray) {
                    if (mo.walletId && [mo.walletId isEqualToString:gameCode]) {
                        FlowDetailModel *model = [[FlowDetailModel alloc] init];
                        model.activityName = dict[@"activityName"] ?: @"";
                        model.billAmount = dict[@"billAmount"] ? [NSString stringWithFormat:@"%0.02f",[dict[@"billAmount"] doubleValue]] : @"0.00";
                        model.completeBillAmount = dict[@"completeBillAmount"] ? [NSString stringWithFormat:@"%0.02f",[dict[@"completeBillAmount"] doubleValue]] : @"0.00";
                        model.percentage = dict[@"percentage"] ? [NSString stringWithFormat:@"%0.02f%%",[dict[@"percentage"] doubleValue]] : @"0.00%";
                        mo.flowDetailModel = model;
                    }
                }
            }
        }
    }
}

- (void)autoTransferListen:(NSNotification*)notification {
    NSDictionary *dict = notification.object;
    if (dict != nil && [dict isKindOfClass:[NSDictionary class]]) {
        NSString *type = dict[@"type"];
        if ([type isEqualToString:@"getNative"]) {
            NSString *autoTransfer = dict[@"autoTransfer"];
            [self topTipsSwitchButtonTag:[autoTransfer isEqualToString:@"true"] ? 999 : 0];
        }
    }
}

- (void)walletListListen:(NSNotification*)notification {
    NSDictionary *dict = notification.object;
    if (dict != nil && [dict isKindOfClass:[NSDictionary class]]) {
        NSString *type = dict[@"type"];
        if ([type isEqualToString:@"getNative"]) {
            [self.walletArray removeAllObjects];
        
            
            NSArray *walletList = dict[@"walletList"];
            if (walletList != nil && [walletList isKindOfClass:[NSArray class]]) {
                for (NSDictionary *dictM in walletList) {
                    TransferModel *model = [TransferModel model:dictM[@"name"] balance:dictM[@"balance"] walletId:dictM[@"id"] status:dictM[@"status"] vipActivityGoing:dictM[@"vipActivityGoing"] needMoreWater:dictM[@"needMoreWater"] venueIconUrlApp:dictM[@"venueIconUrlApp"] venueWalletIconUrl:dictM[@"venueWalletIconUrl"]];
                    [self.walletArray addObject:model];
                }
            }
            
            if (self.walletArray.count > 0) {
                NSMutableArray *array = [NSMutableArray arrayWithArray:self.walletArray];
                for (TransferModel *mo in array) {
                    if (mo.vipActivityGoing && [mo.vipActivityGoing isEqualToString:@"true"] && mo.walletId) {
                        [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_eventGetWaterInfo arguments:@{@"type" : @"get", @"gameCode" : mo.walletId}];
                    }
                }
            }
            
            NSString *b = dict[@"centerWalletBalance"];
            if (b != nil && [b isKindOfClass:[NSString class]]) {
                self.transferModel.balance = b;
            }
            
            NSString *reload = dict[@"reload"];
            BOOL clean = reload == nil;
            [self updateCurModel:clean];
            
            OBBottomAlertView *alertView = [self.view viewWithTag:10000];
            if (alertView && [alertView isKindOfClass:[OBBottomAlertView class]]) {
                [alertView resetArray:self.walletArray];
            }
        }
    }
}

- (void)transferActionListen:(NSNotification*)notification {
    NSDictionary *dict = notification.object;
    if (dict != nil && [dict isKindOfClass:[NSDictionary class]]) {
        NSString *type = dict[@"type"];
        if ([type isEqualToString:@"getNative"]) {

            NSString *error = dict[@"error"];
            if (error != nil) {
                [self checkComnitButtonEnable];
            }else {
                
                NSDictionary *dictAsk = dict[@"ask"];
                if (dictAsk != nil && [dictAsk isKindOfClass:[NSDictionary class]]) {
                    
                    OBAlertView *view = [self.view viewWithTag:88888];
                    if (view != nil && [view isKindOfClass:[OBAlertView class]]) {
                        [view removeFromSuperview];
                    }
                    OBAlertView *alertView = [OBAlertView createAlertTitle:dictAsk[@"title"] confirmColor:YES content:dictAsk[@"content"] cancelBlock:^{
                        [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_transferAction arguments:@{@"type" : @"askCallBack", @"confirmed" : @"false"}];
                        [self checkComnitButtonEnable];
                    } cancelTitle:NSLocalizedString(@"cancel", nil) sureBlock:^{
                        [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_transferAction arguments:@{@"type" : @"askCallBack", @"confirmed" : @"true"}];
                    } sureTitle:NSLocalizedString(@"confirm", nil)];
                    alertView.tag = 88888;
                    
                    [self.view addSubview:alertView];
                }
            }
        }
    }
}

- (void)recycleAllListen:(NSNotification*)notification {
    NSDictionary *dict = notification.object;
    if (dict != nil && [dict isKindOfClass:[NSDictionary class]]) {
        NSString *type = dict[@"type"];
        if ([type isEqualToString:@"getNative"]) {
            self.recycleAllButton.enabled = YES;
            [self.recycleAllButton setTitle:NSLocalizedString(@"deposit_one_click_recycling", nil) forState:UIControlStateNormal];
        }
    }
}

- (void)customerServiceUrlListen:(NSNotification*)notification {
    NSDictionary *dict = notification.object;
    if (dict != nil && [dict isKindOfClass:[NSDictionary class]]) {
        NSString *type = dict[@"type"];
        if ([type isEqualToString:@"getNative"]) {

            NSString *url = dict[@"url"];
            if (url != nil) {
                WebPageViewController *vc = [[WebPageViewController alloc] initWithTitle:NSLocalizedString(@"contact_customer_service", nil) url:[NSURL URLWithString:url]];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
    }
}

- (void)setUpUI {
    
    self.transferModel = [TransferModel model:NSLocalizedString(@"mine_center_wallet", nil) balance:@"0.00" walletId:@"0" status:@"1" vipActivityGoing:@"" needMoreWater:@"" venueIconUrlApp:@"" venueWalletIconUrl:@""];
    
    [self.view addSubview:[self topNavView]];
    
    UIView *topTipsView = [[UIView alloc] init];
    topTipsView.backgroundColor = HexColor(0x171E24);
    [self.view addSubview:topTipsView];
    [topTipsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(kLayoutNavbarHeight + 8);
    }];
    
    UIButton *tipsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *hintImg = [UIImage imageFlutterOBComBaseAssets:@"assets/images/icon/wallet_hint.png"];
    [tipsButton setImage:hintImg forState:UIControlStateNormal];
    [tipsButton addTarget:self action:@selector(tipsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat lr = (44 - hintImg.size.height / 3) * 0.5;
    CGFloat tb = (56 - hintImg.size.width / 3) * 0.5;
    [tipsButton setImageEdgeInsets:UIEdgeInsetsMake(lr, tb, lr, tb)];
    [topTipsView addSubview:tipsButton];
    [tipsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(topTipsView);
        make.width.mas_equalTo(56);
        make.height.mas_equalTo(topTipsView);
        make.centerY.mas_equalTo(topTipsView);
    }];
    
    [topTipsView addSubview:self.topTipsSwitchButton];
    [self.topTipsSwitchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(topTipsView);
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(42);
        make.right.mas_equalTo(topTipsView.mas_right).offset(-16);
    }];
    
    UILabel *tipsLabel = [[UILabel alloc] init];
    tipsLabel.text = NSLocalizedString(@"transfer_bring_in_the_amount", nil);
    tipsLabel.font = [UIFont systemFontOfSize:12];
    tipsLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    tipsLabel.numberOfLines = 2;
    [topTipsView addSubview:tipsLabel];
    [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(tipsButton.mas_right);
        make.top.bottom.mas_equalTo(topTipsView);
        make.right.mas_equalTo(self.topTipsSwitchButton.mas_left).offset(-4);
    }];

    
    UIView *transferView = [[UIView alloc] init];
    transferView.layer.cornerRadius = 8;
    transferView.layer.borderColor = [[UIColor.whiteColor colorWithAlphaComponent:0.1] CGColor];
    transferView.layer.borderWidth = 1;
    transferView.backgroundColor = HexColor(0x1D2933);
    [self.view addSubview:transferView];
    [transferView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(16);
        make.right.mas_equalTo(self.view).mas_offset(-16);
        make.height.mas_equalTo(137);
        make.top.mas_equalTo(topTipsView.mas_bottom).offset(16);
    }];
    
    UIView *pointF = [[UIView alloc] init];
    pointF.layer.cornerRadius = 4;
    pointF.backgroundColor = HexColor(0x3BC117);
    [transferView addSubview:pointF];
    [pointF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(transferView).offset(12);
        make.width.height.mas_equalTo(8);
        make.centerY.mas_equalTo(transferView.mas_centerY).multipliedBy(0.5);
    }];
    
    UILabel *from = [[UILabel alloc] init];
    from.text = NSLocalizedString(@"from", nil);
    from.font = [UIFont systemFontOfSize:12];
    from.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    [transferView addSubview:from];
    [from mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(pointF.mas_right).offset(8);
        make.centerY.mas_equalTo(pointF.mas_centerY);
    }];
    
    UIView *pointTo = [[UIView alloc] init];
    pointTo.layer.cornerRadius = 4;
    pointTo.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    [transferView addSubview:pointTo];
    [pointTo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(transferView).offset(12);
        make.width.height.mas_equalTo(8);
        make.centerY.mas_equalTo(transferView.mas_centerY).multipliedBy(1.5);
    }];
    
    UILabel *to = [[UILabel alloc] init];
    to.text = NSLocalizedString(@"to", nil);
    to.font = [UIFont systemFontOfSize:12];
    to.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    [transferView addSubview:to];
    [to mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(pointTo.mas_right).offset(8);
        make.centerY.mas_equalTo(pointTo.mas_centerY);
    }];
    
    UIImageView *lineIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1, 50)];
    lineIamgeView.image = [DrawImageTools drawLineOfDashByImageView:lineIamgeView];
    [transferView addSubview:lineIamgeView];
    [lineIamgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.top.mas_equalTo(pointF.mas_bottom).offset(6);
        make.centerX.mas_equalTo(pointF.mas_centerX);
        make.bottom.mas_equalTo(pointTo.mas_top).offset(-6);
    }];
    
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *changeImg = [UIImage imageFlutterOBComBaseAssets:@"assets/images/icon/wallet_jiaohuan.png"];
    [changeButton setImage:changeImg forState:UIControlStateNormal];
    CGFloat clr = (137 - changeImg.size.height / 3) * 0.5;
    CGFloat ctb = (56 - changeImg.size.width / 3) * 0.5;
    [changeButton setImageEdgeInsets:UIEdgeInsetsMake(clr, ctb, clr, ctb)];
    changeButton.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.04];
    [changeButton addTarget:self action:@selector(changeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [transferView addSubview:changeButton];
    [changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(transferView);
        make.width.mas_equalTo(56);
    }];
    
    [transferView addSubview:self.firstTansferView];
    [self.firstTansferView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(pointF.mas_right).mas_offset(60);
        make.right.mas_equalTo(changeButton.mas_left);
        make.centerY.mas_equalTo(pointF.mas_centerY);
        make.height.mas_equalTo(transferView.mas_height).multipliedBy(0.5);
    }];
    
    [transferView addSubview:self.secondTansferView];
    [self.secondTansferView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.firstTansferView.mas_left);
        make.right.mas_equalTo(changeButton.mas_left);
        make.centerY.mas_equalTo(pointTo.mas_centerY);
        make.height.mas_equalTo(transferView.mas_height).multipliedBy(0.5);
    }];
    
    UIView *trline = [[UIView alloc] init];
    trline.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.06];
    [transferView addSubview:trline];
    [trline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.firstTansferView.mas_left);
        make.centerY.mas_equalTo(transferView);
        make.right.mas_equalTo(changeButton.mas_left).offset(-32);
        make.height.mas_equalTo(1);
    }];
    
    UILabel *inputTitleLabel = [[UILabel alloc] init];
    inputTitleLabel.text = NSLocalizedString(@"agent_transfer_transfer_money", nil);
    inputTitleLabel.textColor = [UIColor whiteColor];
    inputTitleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:inputTitleLabel];
    [inputTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(16);
        make.top.mas_equalTo(transferView.mas_bottom).mas_offset(32);
    }];
    
    UIButton *allButton = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *t = NSLocalizedString(@"withdraw_maximum_amount", nil);
    [allButton setTitle:t forState:UIControlStateNormal];
    [allButton setTitleColor:HexColor(0xE1A100) forState:UIControlStateNormal];
    allButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [allButton addTarget:self action:@selector(allButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    CGSize tSize = [t textSizeWithFont:allButton.titleLabel.font];
    [self.view addSubview:allButton];
    [allButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(inputTitleLabel.mas_bottom).mas_offset(12);
        make.right.mas_equalTo(self.view).mas_offset(-16);
        make.height.mas_equalTo(42);
        make.width.mas_equalTo(tSize.width + 8);
    }];
    
    UILabel *CNY = [[UILabel alloc] init];
    CNY.font = [UIFont systemFontOfSize:14 weight:500];
    CNY.text = LanguageManager.instance.curSymbol;
    CNY.textColor = [UIColor whiteColor];
    [self.view addSubview:CNY];
    [CNY mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(16);
        make.width.mas_lessThanOrEqualTo(20);
        make.centerY.mas_equalTo(allButton.mas_centerY);
    }];

    if (LanguageManager.instance.isVND) {
        [self.view addSubview:self.plusKLabel];
        [self.plusKLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(allButton.mas_left);
            make.width.mas_lessThanOrEqualTo(20);
            make.centerY.mas_equalTo(allButton.mas_centerY);
        }];
        [self.view addSubview:self.inputTextField];
        [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(CNY.mas_right).mas_offset(8);
            make.right.mas_equalTo(self.plusKLabel.mas_left);
            make.centerY.mas_equalTo(allButton.mas_centerY);
            make.height.mas_equalTo(42);
        }];
    } else {
        [self.view addSubview:self.inputTextField];
        [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(CNY.mas_right).mas_offset(8);
            make.right.mas_equalTo(allButton.mas_left);
            make.centerY.mas_equalTo(allButton.mas_centerY);
            make.height.mas_equalTo(42);
        }];
    }

    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.06];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(8);
        make.right.mas_equalTo(allButton.mas_right);
        make.top.mas_equalTo(allButton.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    
    [self.view addSubview:self.walletLabel];
    [self.walletLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(16);
        make.height.mas_equalTo(20);
        make.top.mas_equalTo(line.mas_bottom).mas_offset(12);
    }];
    
    [self.view addSubview:self.commitButton];
    [self.commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(16);
        make.right.mas_equalTo(self.view.mas_right).offset(-16);
        make.top.mas_equalTo(self.walletLabel.mas_bottom).offset(34);
        make.height.mas_equalTo(40);
    }];
    
    [self.view addSubview:self.recycleAllButton];
    [self.recycleAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(16);
        make.right.mas_equalTo(self.view.mas_right).offset(-16);
        make.top.mas_equalTo(self.commitButton.mas_bottom).offset(16);
        make.height.mas_equalTo(40);
    }];
    
//    UILabel *tLabel = [[UILabel alloc] init];
//    NSString *tString = [NSString stringWithFormat:@"%@  %@",NSLocalizedString(@"need_any_help", nil),NSLocalizedString(@"contact_customer_service", nil)];
//    tLabel.attributedText = [tString modifyDigitalColor:HexColor(0xFF5722) otherKey:NSLocalizedString(@"contact_customer_service", nil) normalColor:[UIColor.whiteColor colorWithAlphaComponent:0.6]];
//    tLabel.font = [UIFont systemFontOfSize:12];
//    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tutoriaTap:)];
//    [tLabel addGestureRecognizer:tapGestureRecognizer];
//    tLabel.userInteractionEnabled = YES;
//    [self.view addSubview:tLabel];
//    [tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.recycleAllButton.mas_bottom).offset(50);
//        make.centerX.mas_equalTo(self.view);
//    }];
//
    [self checkComnitButtonEnable];
    
}

- (UIView *)topNavView {
    UIView *topNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kLayoutNavbarHeight)];
    topNavView.backgroundColor = HexColor(0x171E24);
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, kLayoutStatusBarHeight, SCREEN_WIDTH, kLayoutNavbarHeight - kLayoutStatusBarHeight)];
    [topNavView addSubview:contentView];

    self.titleLabel.frame = contentView.bounds;
    [contentView addSubview:self.titleLabel];
    
    self.backButton.frame = CGRectMake(0, 0, 56, contentView.frame.size.height);
    UIImage *backImg = [UIImage imageFlutterOBComBaseAssets:@"assets/images/icon/com_back.png"];
    [_backButton setImage:backImg forState:UIControlStateNormal];
    CGFloat lr = (contentView.frame.size.height - backImg.size.height / 3) * 0.5;
    CGFloat tb = (56 - backImg.size.width / 3) * 0.5;
    [_backButton setImageEdgeInsets:UIEdgeInsetsMake(lr, tb, lr, tb)];
    [contentView addSubview:self.backButton];
    
    return topNavView;

}

- (void)keyboardHide:(UITapGestureRecognizer*)tap{
    [self.inputTextField resignFirstResponder];
}

- (void)checkComnitButtonEnable {
    
    BOOL enabled = NO;
    if (_firstTansferView.transferModel && _secondTansferView.transferModel && _inputTextField.text.doubleValue > 0) {
        enabled = YES;
    }
    
    if (_firstTansferView.transferModel) {
        self.inputTextField.limit.maxLimit = _firstTansferView.transferModel.balanceDisplay;
    }
    _commitButton.enabled = enabled;
}

- (void)tutoriaTap:(UITapGestureRecognizer*)tap{
    [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_customerServiceUrl arguments:@{@"type" : @"get"}];
}

- (void)backButtonClick:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tipsButtonClick:(UIButton *)button {
    
    OBAlertView *alertView = [OBAlertView createAlertTitle:NSLocalizedString(@"alert", nil) confirmColor:false content:NSLocalizedString(@"transfer_will_be_carried_over_to_the_entering_venue", nil) cancelBlock:nil cancelTitle:nil sureBlock:^{
        
    } sureTitle:NSLocalizedString(@"alert_know", nil)];
    
    [self.view addSubview:alertView];

}

- (void)setTransferModel:(TransferModel *)transferModel {
    _transferModel = transferModel;
    
    [self updateCurModel:YES];
}

- (void)obMoneyTextFieldValueChanged:(UITextField *)textField {
    [self checkComnitButtonEnable];
}

- (void)commitButtonClick:(UIButton *)button {

    self.commitButton.enabled = NO;
    NSString *fromID = self.firstTansferView.transferModel.walletId;
    NSString *toID = self.secondTansferView.transferModel.walletId;
    if ([toID isEqualToString:@"0"]) {
        toID = fromID;
    }
    [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_transferAction
                                              arguments:@{@"type" : @"action",
                                                          @"accountId" : fromID ,
                                                          @"transferInAmount" : [self.inputTextField.text numHandleIfVND],
                                                          @"gameCode" : toID}];
}

- (void)recycleAllButtonClick:(UIButton *)button {
    
    [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_recycleAll arguments:@{@"type" : @"action"}];
    
    _recycleAllButton.enabled = NO;
    [_recycleAllButton setTitle:NSLocalizedString(@"deposit_recycling", nil) forState:UIControlStateNormal];
}

- (void)tapTransferClick:(TransferModel *)model type:(NSInteger)type {
    
    if (model != nil && [model.walletId isEqualToString:@"0"]) {
        return;
    }
    
    [self.inputTextField resignFirstResponder];

    OBBottomAlertView *view = [[OBBottomAlertView alloc] initWith:self.walletArray selId:model.walletId isTransferOut:(type == 1) callBack:^(TransferModel * _Nonnull model) {
        if (type == 1) {
            [self.firstTansferView resetModel:model];
        }else {
            [self.secondTansferView resetModel:model];
        }
        [self reloadUIState:YES];
    }];
    view.tag = 10000;
    [self.view addSubview:view];

}

- (void)topTipsButtonClick:(UIButton *)button {


    [self.inputTextField resignFirstResponder];
    
    button.enabled = NO;
    NSString *tips = self.topTipsSwitchButton.tag == 999 ? NSLocalizedString(@"my_wallet_turn_off_the_automatic_carry_in_amount", nil) : NSLocalizedString(@"my_wallet_enable_automatic_transfer_of_amount", nil);
    OBAlertView *alertView = [OBAlertView createAlertTitle:NSLocalizedString(@"alert", nil) confirmColor:YES content:tips cancelBlock:^{
        button.enabled = YES;
    } cancelTitle:NSLocalizedString(@"cancel", nil) sureBlock:^{
        button.enabled = YES;
        [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_autoTransfer arguments:@{@"type" : @"set"}];
    } sureTitle:NSLocalizedString(@"confirm", nil)];
    
    [self.view addSubview:alertView];
}

- (void)changeButtonClick:(UIButton *)button {
    
    if (self.firstTansferView.transferModel == nil) {
        [OBHUDPlus showMessage:NSLocalizedString(@"my_wallet_please_select_a_wallet", nil)];
        return;
    }
    
    if (self.secondTansferView.transferModel == nil) {
        [OBHUDPlus showMessage:NSLocalizedString(@"my_wallet_please_select_a_wallet", nil)];
        return;
    }
    
    TransferModel *firstModel = self.firstTansferView.transferModel.mutableCopy;
    TransferModel *secondModel = self.secondTansferView.transferModel.mutableCopy;
    
    if (![secondModel.walletId isEqualToString:@"0"]) {
        if (secondModel.status.intValue == 1 && [secondModel.vipActivityGoing isEqualToString:@"true"]) {
            [OBHUDPlus showMessage:[NSString stringWithFormat:NSLocalizedString(@"transfer_cannot_be_transferred_out", nil),secondModel.name ?: @""]];
            return;
        }
    }
    

    [self.firstTansferView resetModel:secondModel];
    [self.secondTansferView resetModel:firstModel];
    
    [self reloadUIState:YES];
}

- (void)updateCurModel:(BOOL)clean {
    
    if ([self.firstTansferView.transferModel.walletId isEqualToString:@"0"]) {
        [self.firstTansferView resetModel:self.transferModel];
    }else if ([self.secondTansferView.transferModel.walletId isEqualToString:@"0"]) {
        [self.secondTansferView resetModel:self.transferModel];
    }
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.walletArray];
    if (self.firstTansferView.transferModel != nil && ![self.firstTansferView.transferModel.walletId isEqualToString:@"0"]) {
        for (TransferModel *mo in array) {
            if ([mo.walletId isEqualToString:self.firstTansferView.transferModel.walletId]) {
                [self.firstTansferView resetModel:mo];
                break;
            }
        }
    }else if (self.secondTansferView.transferModel != nil && ![self.secondTansferView.transferModel.walletId isEqualToString:@"0"]) {
        for (TransferModel *mo in array) {
            if ([mo.walletId isEqualToString:self.secondTansferView.transferModel.walletId]) {
                [self.secondTansferView resetModel:mo];
                break;
            }
        }
    }
    
    [self reloadUIState:clean];
}

- (void)reloadUIState:(BOOL)clean {
    
    if (_firstTansferView.transferModel) {
        NSString *walletString;
        if ([_firstTansferView.transferModel.walletId isEqualToString:@"0"]) {
            walletString = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"mine_center_wallet_transfer_existing", nil), _firstTansferView.transferModel.balanceDisplayPlusK];
        } else {
            walletString = [NSString stringWithFormat:@"%@ %@ %@",_firstTansferView.transferModel.name,NSLocalizedString(@"transfer_existing", nil), _firstTansferView.transferModel.balanceDisplayPlusK];
        }
        
        _walletLabel.attributedText = [walletString modifyDigitalColor:[UIColor whiteColor] normalColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6]];
    }else {
        _walletLabel.text = [NSString stringWithFormat:@"%@ - -",NSLocalizedString(@"transfer_to_be_selected_to_transfer_out_wallet", nil)];
    }

    if (clean) {
        _inputTextField.text = @"";
    }
    
    [self checkComnitButtonEnable];
}



- (void)allButtonClick:(UIButton *)button {
    
    if (_firstTansferView.transferModel) {
        self.inputTextField.text = [NSString stringWithFormat:@"%@",_firstTansferView.transferModel.balanceDisplay];
        [self checkComnitButtonEnable];
    }

}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = self.title;
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return  _titleLabel;
}

- (UIButton *)backButton {
    if (_backButton == nil) {
        _backButton = [[UIButton alloc] init];
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return  _backButton;
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
        
        OBKeyBoard *keyBoard = [[OBKeyBoard alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 291)];
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
//        agent_transfer_transfer_money
        NSString *inputTextFieldText = [NSString stringWithFormat:@"%@%@",NSLocalizedString(@"vip_level_trans_hintText", nil),NSLocalizedString(@"agent_transfer_transfer_money", nil)];
        _inputTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:inputTextFieldText attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16], NSForegroundColorAttributeName:[UIColor.whiteColor colorWithAlphaComponent:0.3]}];
        _inputTextField.inputView = keyBoard;
        _inputTextField.textColor = UIColor.whiteColor;
        _inputTextField.font = [UIFont boldSystemFontOfSize:18];
        
    }
    return _inputTextField;
}

- (UIButton *)topTipsSwitchButton {
    if (_topTipsSwitchButton == nil) {
        UIButton *topTipsSwitchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [topTipsSwitchButton setBackgroundImage:[UIImage imageFlutterOBComBaseAssets:@"assets/images/icon/switchOff.png"] forState:UIControlStateNormal];
        [topTipsSwitchButton addTarget:self action:@selector(topTipsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _topTipsSwitchButton = topTipsSwitchButton;
    }
    return _topTipsSwitchButton;
}

- (void)topTipsSwitchButtonTag:(NSInteger)tag {
    self.topTipsSwitchButton.tag = tag;
    if (tag == 999) {
        [self.topTipsSwitchButton setBackgroundImage:[UIImage imageFlutterOBComBaseAssets:@"assets/images/switchOn.png"] forState:UIControlStateNormal];
    }else {
        [self.topTipsSwitchButton setBackgroundImage:[UIImage imageFlutterOBComBaseAssets:@"assets/images/switchOff.png"] forState:UIControlStateNormal];
    }
}


- (TransferView *)firstTansferView {
    if (_firstTansferView == nil) {
        _firstTansferView = [[TransferView alloc] initWithModel:self.transferModel hidden:YES];
        __weak typeof(self) weakSelf = self;
        _firstTansferView.callBack = ^(TransferModel *model) {
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf tapTransferClick:model type:1];
        };
    }
    return _firstTansferView;
}

- (TransferView *)secondTansferView {
    if (_secondTansferView == nil) {
        _secondTansferView = [[TransferView alloc] initWithModel:nil hidden:NO];
        __weak typeof(self) weakSelf = self;
        _secondTansferView.callBack = ^(TransferModel *model) {
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf tapTransferClick:model type:2];
        };
    }
    return _secondTansferView;
}

- (UILabel *)walletLabel {
    if (_walletLabel == nil) {
        UILabel *walletLabel = [[UILabel alloc] init];
        NSString *walletString;
        if ([self.transferModel.walletId isEqualToString:@"0"]) {
            walletString = [NSString stringWithFormat:@"%@ %@",NSLocalizedString(@"mine_center_wallet_transfer_existing", nil), self.transferModel.balanceDisplayPlusK];
        } else {
            walletString = [NSString stringWithFormat:@"%@ %@ %@",self.transferModel.name,NSLocalizedString(@"transfer_existing", nil), self.transferModel.balanceDisplayPlusK];
        }
        walletLabel.attributedText = [walletString modifyDigitalColor:[UIColor whiteColor] normalColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6]];
        walletLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        walletLabel.font = [UIFont systemFontOfSize:12];
        _walletLabel = walletLabel;
    }
    return _walletLabel;
}

- (UIButton *)commitButton {
    if (_commitButton == nil) {
        UIImage *imgage = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/btnbg_2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *imgageDis = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/btnbg_2_dis.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIButton *commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [commitButton setTitle:NSLocalizedString(@"vip_level_trans_confirm", nil) forState:UIControlStateNormal];
        [commitButton setBackgroundImage:imgage forState:UIControlStateNormal];
        [commitButton setBackgroundImage:imgageDis forState:UIControlStateDisabled];
        commitButton.titleLabel.font = [UIFont systemFontOfSize:16];
//        commitButton.layer.cornerRadius = 20;
        [commitButton addTarget:self action:@selector(commitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        commitButton.enabled = NO;
        _commitButton = commitButton;
    }
    
    return _commitButton;
}

- (UIButton *)recycleAllButton {
    if (_recycleAllButton == nil) {
        UIImage *imgage = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/btnbg.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIButton *recycleAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [recycleAllButton setTitle:NSLocalizedString(@"deposit_one_click_recycling", nil) forState:UIControlStateNormal];
        [recycleAllButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        recycleAllButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [recycleAllButton setBackgroundImage:imgage forState:UIControlStateNormal];
//        recycleAllButton.layer.cornerRadius = 20;
//        recycleAllButton.layer.borderColor = HexColorAlpha(0x3BC117, 0.4).CGColor;
//        recycleAllButton.layer.borderWidth = 1;
        [recycleAllButton addTarget:self action:@selector(recycleAllButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//        recycleAllButton.backgroundColor = HexColorAlpha(0x3BC117, 0.2);
        _recycleAllButton = recycleAllButton;
    }
    
    return _recycleAllButton;
}

- (NSMutableArray *)walletArray {
    if (_walletArray == nil) {
        _walletArray = [NSMutableArray array];
    }
    return _walletArray;
}

- (void)dealloc {
    [self deleteNotification];
}

@end


