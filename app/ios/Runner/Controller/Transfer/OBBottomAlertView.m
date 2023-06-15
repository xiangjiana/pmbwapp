//
//  OBBottomAlertView.m
//  Runner
//
//  Created by Tmoson on 2022/2/22.
//

#import "OBBottomAlertView.h"
#import "headerFile.h"
#import <Masonry/Masonry.h>
#import "Runner-Swift.h"
#import "UIImage+OBAdd.h"
#import "UIImageView+WebCache.h"
#import "NSString+MKAdd.h"

@interface OBTransferTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *balanceLabel;

@property (nonatomic, strong) UIImageView *selecteImageView;

@property (nonatomic, strong) TransferModel *model;

@property (nonatomic, assign) BOOL isTransferOut;

@property (strong, nonatomic) UIImageView *tipsImageView;

@property (nonatomic, strong) UILabel *tipsLabel;

@property (nonatomic, strong) UIView *dataView;

@property (nonatomic, strong) UILabel *dataAvLabel;

@property (nonatomic, strong) UILabel *dataNeedLabel;

@property (nonatomic, strong) UILabel *dataDoneLabel;

@property (nonatomic, strong) UILabel *dataRateLabel;

@end

@implementation OBTransferTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    
    self.backgroundColor = HexColor(0x171E24);

    UIView *contentBGView = [[UIView alloc] init];
    [self.contentView addSubview:contentBGView];
    [contentBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(self.contentView);
    }];
    
    [contentBGView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(contentBGView).inset(16);
        make.height.mas_equalTo(32);
        make.width.mas_equalTo(32);
    }];
    
    [contentBGView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(8);
        make.bottom.mas_equalTo(self.iconImageView.mas_centerY);
    }];
    
    [contentBGView addSubview:self.balanceLabel];
    [self.balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(8);
        make.top.mas_equalTo(self.iconImageView.mas_centerY);
    }];
    
    [contentBGView addSubview:self.selecteImageView];
    [self.selecteImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(contentBGView).offset(-16);
        make.centerY.mas_equalTo(self.iconImageView.mas_centerY);
        make.width.mas_equalTo(24);
        make.height.mas_equalTo(24);
    }];
    
    [contentBGView addSubview:self.tipsImageView];
    [self.tipsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.balanceLabel.mas_centerY);
        make.width.mas_equalTo(16);
        make.height.mas_equalTo(16);
        make.right.mas_equalTo(contentBGView.mas_right).offset(-16);
    }];
    
    [contentBGView addSubview:self.tipsLabel];
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.balanceLabel.mas_centerY);
        make.right.mas_equalTo(self.tipsImageView.mas_left).offset(-8);
        make.left.mas_equalTo(contentBGView.mas_centerX).offset(-4);
    }];
    
    [contentBGView addSubview:self.dataView];
    [self.dataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(8);
        make.top.mas_equalTo(contentBGView.mas_top).offset(64);
        make.right.mas_equalTo(contentBGView.mas_right).offset(-16);
    }];
    
    //抗拉伸性
    [self.balanceLabel setContentHuggingPriority:UILayoutPriorityRequired
                                forAxis:UILayoutConstraintAxisHorizontal];
    //抗压缩性
    [self.balanceLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                forAxis:UILayoutConstraintAxisHorizontal];

    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.06];
    [contentBGView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(8);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(contentBGView);
        make.right.mas_equalTo(contentBGView);
    }];
}

- (void)setModel:(TransferModel *)model {
    _model = model;
    UIImage *icon = [UIImage imageFlutterOBComBaseAssets:@"assets/images/venue/wallet_ty.png"];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.venueWalletIconUrl] placeholderImage:icon];
    self.nameLabel.text = model.name;
    self.balanceLabel.text = [NSString stringWithFormat:@"%@", model.balanceDisplayPlusK];
    
    if (![model.status isEqualToString:@"2"]) {
        if (self.isTransferOut && [model.vipActivityGoing isEqualToString:@"true"]) {
            self.selecteImageView.hidden = YES;
            self.tipsLabel.hidden = NO;
            self.tipsLabel.text = NSLocalizedString(@"transfer_in_activities_cannot_be_transferred_out", nil);
            self.tipsImageView.hidden = NO;
            self.tipsImageView.transform = model.unfold ? CGAffineTransformMakeRotation(M_PI) : CGAffineTransformIdentity;
            self.dataView.hidden = model.unfold == NO;
            self.nameLabel.textColor = [UIColor.whiteColor colorWithAlphaComponent:0.3];
            self.balanceLabel.textColor = [UIColor.whiteColor colorWithAlphaComponent:0.6];
            
            _dataAvLabel.text = model.flowDetailModel.activityName;
            _dataNeedLabel.text = [model.flowDetailModel.billAmount numDisplayDec:YES];
            _dataDoneLabel.text = [model.flowDetailModel.completeBillAmount numDisplayDec:YES];
            _dataRateLabel.text = model.flowDetailModel.percentage;

        }else {
            self.selecteImageView.hidden = model.selected == NO;
            self.tipsLabel.hidden = YES;
            self.tipsImageView.hidden = YES;
            self.dataView.hidden = YES;
            self.nameLabel.textColor = [UIColor.whiteColor colorWithAlphaComponent:0.6];
            self.balanceLabel.textColor = UIColor.whiteColor;
        }
    }else {
        self.selecteImageView.hidden = YES;
        self.tipsLabel.hidden = NO;
        self.tipsImageView.hidden = YES;
        self.tipsLabel.text = self.isTransferOut ? NSLocalizedString(@"transfer_unable_to_transfer_out_during_venue_maintenance", nil) : NSLocalizedString(@"transfer_unable_to_transfer_in_during_venue_maintenance", nil);
        self.dataView.hidden = YES;
        self.balanceLabel.text = @"--";
        
        self.nameLabel.textColor = [UIColor.whiteColor colorWithAlphaComponent:0.3];
        self.balanceLabel.textColor = [UIColor.whiteColor colorWithAlphaComponent:0.6];
    }
    [self layoutIfNeeded];
    model.dataHeight = self.dataView.frame.size.height;

}

- (UIView *)dataView {
    if (_dataView == nil) {
        UIView *dataView = [[UIView alloc] init];
        dataView.backgroundColor = [UIColor.whiteColor colorWithAlphaComponent:0.04];
        dataView.layer.cornerRadius = 8;
        _dataView = dataView;
        
    
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
    }
    return _dataView;
}

- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    }
    return _nameLabel;
}

- (UILabel *)balanceLabel {
    if (_balanceLabel == nil) {
        _balanceLabel = [[UILabel alloc] init];
        _balanceLabel.font = [UIFont boldSystemFontOfSize:14];
        _balanceLabel.textColor = [UIColor whiteColor];
    }
    return _balanceLabel;
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageFlutterOBComBaseAssets:@"assets/images/venue/wallet_ty.png"];
    }
    return _iconImageView;
}

- (UIImageView *)selecteImageView {
    if (_selecteImageView == nil) {
        _selecteImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"com_select"]];
        _selecteImageView.hidden = YES;
    }
    return _selecteImageView;
}

- (UILabel *)dataTitle:(NSString *)title {
    UILabel *dataTitle = [[UILabel alloc] init];
    dataTitle.text = title;
    dataTitle.font = [UIFont systemFontOfSize:14];
    dataTitle.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    return dataTitle;
}

- (UIImageView *)tipsImageView {
    if (_tipsImageView == nil) {
        _tipsImageView = [[UIImageView alloc] init];
        _tipsImageView.image = [UIImage imageNamed:@"home_more_down"];
        _tipsImageView.hidden = YES;
    }
    return _tipsImageView;
}

- (UILabel *)tipsLabel {
    if (_tipsLabel == nil) {
        _tipsLabel = [self dataTitle:NSLocalizedString(@"transfer_in_activities_cannot_be_transferred_out", nil)];
        _tipsLabel.font = [UIFont systemFontOfSize:12];
        _tipsLabel.textAlignment = NSTextAlignmentRight;
        _tipsLabel.numberOfLines = 0;
    }
    return _tipsLabel;
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
        _dataNeedLabel.numberOfLines = 0;
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

@interface OBBottomAlertView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *listTableView;

@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@property (nonatomic, copy) OBTransferBlock callBack;

@property (nonatomic, strong) TransferModel *curSelModel;

@property (nonatomic, assign) BOOL isTransferOut;

@property (nonatomic, copy) OBAnimateButton *refreshButton;

@end

@implementation OBBottomAlertView

- (instancetype)initWith:(NSMutableArray *)array selId:(NSString *)selId isTransferOut:(BOOL)isTransferOut callBack:(nonnull OBTransferBlock)callBack {
    if (self = [super init]) {
        
        [self.dataSourceArray addObjectsFromArray:array];
        self.isTransferOut = isTransferOut;
        for (TransferModel *model in self.dataSourceArray) {
            if ([model.walletId isEqualToString:selId]) {
                model.selected = YES;
                self.curSelModel = model;
            }else {
                model.selected = NO;
            }
            model.unfold = NO;
        }
    
        self.callBack = callBack;
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.4];
        
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.frame = self.frame;
        [btn addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        [self setUpUI];
    }
    return self;
}

- (void)resetArray:(NSMutableArray *)array {
    NSMutableArray *arrayM = [NSMutableArray arrayWithArray:array];
    
    
    for (TransferModel *model in arrayM) {
        
        if (self.curSelModel && [model.walletId isEqualToString:self.curSelModel.walletId]) {
            model.selected = YES;
            self.curSelModel = model;
        }else {
            model.selected = NO;
        }
        model.unfold = NO;
        model.dataHeight = 75.f;
    }
    
    self.dataSourceArray = arrayM;
    [self.listTableView reloadData];
}

- (void)setUpUI {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT / 2, SCREEN_WIDTH, SCREEN_HEIGHT / 2)];
    contentView.backgroundColor = HexColor(0x171E24);
    [self addSubview:contentView];
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:contentView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(8, 8)];
    CAShapeLayer * layer = [[CAShapeLayer alloc]init];
    layer.frame = contentView.bounds;
    layer.path = path.CGPath;
    contentView.layer.mask = layer;
    
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = HexColor(0x1D2933);
    [contentView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(contentView);
        make.height.mas_equalTo(44);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = NSLocalizedString(@"transfer_select_wallet", nil);
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(topView);
    }];
    
    UIButton *backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    UIImage *backImg = [UIImage imageFlutterOBComBaseAssets:@"assets/images/com_close_white.png"];
    [backButton setImage:backImg forState:UIControlStateNormal];
    CGFloat clr = (44 - backImg.size.height / 3) * 0.5;
    CGFloat ctb = (44 - backImg.size.width / 3) * 0.5;
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(clr, ctb, clr, ctb)];
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(topView);
        make.width.mas_equalTo(44);
    }];
    
    _refreshButton = [[OBAnimateButton alloc]initWithImage:@"refresh"];;
    [_refreshButton addTarget:self action:@selector(refreshButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:_refreshButton];
    [_refreshButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(topView);
        make.width.mas_equalTo(44);
    }];
    
    [contentView addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.mas_equalTo(contentView);
        make.top.mas_equalTo(topView.mas_bottom);
    }];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(walletListListen:) name:OBEventIdentifier_walletList object:nil];
}


- (void)walletListListen:(NSNotification*)notification {
    NSDictionary* arguments = notification.object;
    if (arguments != nil && [arguments isKindOfClass:[NSDictionary class]]) {
        if ([arguments[@"action"] isEqualToString:@"1"]) {
            [self.refreshButton playSuccess];
        }
        else{
            [self.refreshButton stop];
        }
    }
}

- (void)dealloc{
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)refreshButtonClick:(OBAnimateButton *)btn {
    [btn playWithLoopMode:YES completion:nil];
    /// action  == 1 表示目前的刷新成功功能
    [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_walletList arguments:@{@"type": @"get", @"reload" : @"reload", @"action":@"1"}];

}

- (void)backButtonClick:(UIButton *)btn {
    [self removeFromSuperview];
}

#pragma -mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OBTransferTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OBBottomAlertViewCellIdentifier"];
    if (cell == nil) {
        cell = [[OBTransferTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OBBottomAlertViewCellIdentifier"];
        cell.separatorInset = UIEdgeInsetsZero;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.isTransferOut = self.isTransferOut;
    TransferModel *model = self.dataSourceArray[indexPath.row];
    cell.model = model;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TransferModel *model = self.dataSourceArray[indexPath.row];
    if (![model.status isEqualToString:@"2"] && self.isTransferOut && [model.vipActivityGoing isEqualToString:@"true"] && model.unfold) {
        return 64 + model.dataHeight + 16;
    }
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    TransferModel *model = self.dataSourceArray[indexPath.row];
    if (![model.status isEqualToString:@"2"]) {
        if (self.isTransferOut && [model.vipActivityGoing isEqualToString:@"true"]) {
            model.unfold = !model.unfold;
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationFade)];
        }else {
            model.selected = YES;
            if (self.curSelModel != nil) {
                self.curSelModel.selected = NO;
            }
            self.curSelModel = model;
            
            if (self.callBack) {
                self.callBack(model);
            }
            [tableView reloadData];
            [self removeFromSuperview];
        }
    }

}


- (UITableView *)listTableView {
    if (!_listTableView) {
        _listTableView = [UITableView new];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.backgroundColor = self.backgroundColor;
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTableView.showsVerticalScrollIndicator = NO;
        _listTableView.showsHorizontalScrollIndicator = NO;
    }
    return _listTableView;
}

- (NSMutableArray *)dataSourceArray {
    if (_dataSourceArray == nil) {
        _dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
}

@end
