//
//  GameDYListView.m
//  Runner
//
//  Created by Tmoson on 2023/3/27.
//

#import "GameDYListView.h"
#import <Masonry/Masonry.h>
#import "NSArray+MKAdd.h"
#import "headerFile.h"
#import "DeviceUtils.h"
#import "UIImage+OBAdd.h"
#import "GameTypeListModel.h"
#import "UIImageView+WebCache.h"
#import "OBChannelManager.h"
#import "OBAlertView.h"

#pragma --mark VenueCollectionViewCell

@interface GameCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) DyGameModel *singleModel;

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIImageView *venueImageView;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIView *maintenanceView;

@property (nonatomic, strong) UIButton *enterButton;

@end

@implementation GameCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.layer.cornerRadius = 8;
        self.contentView.clipsToBounds = YES;
        self.contentView.backgroundColor = RGB(34, 43, 49);
        
        UIView *imgContentView = [[UIView alloc] init];
        [self.contentView addSubview:imgContentView];
        [imgContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self.contentView);
            make.height.mas_equalTo(imgContentView.mas_width);
        }];
        
        [imgContentView addSubview:self.bgImageView];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(imgContentView);
        }];
        
        [imgContentView addSubview:self.venueImageView];
        [self.venueImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(imgContentView);
        }];
        
        [imgContentView addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(imgContentView);
            make.width.mas_equalTo(34);
            make.height.mas_equalTo(16);
        }];
        
        [imgContentView addSubview:self.maintenanceView];
        [self.maintenanceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(imgContentView);
        }];
        
        UIView *uContentView = [[UIView alloc] init];
        [self.contentView addSubview:uContentView];
        [uContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(imgContentView.mas_bottom);
        }];
        
        [uContentView addSubview:self.enterButton];
        [self.enterButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(uContentView);
            make.right.mas_equalTo(uContentView.mas_right).offset(-10);
            make.width.mas_equalTo(42);
            make.height.mas_equalTo(20);
        }];
        
        [uContentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(uContentView);
            make.left.mas_equalTo(uContentView).offset(10);
            make.right.mas_equalTo(self.enterButton.mas_left);
        }];
    }
    return self;
}

- (void)setSingleModel:(DyGameModel *)singleModel {
    _singleModel = singleModel;
    
    self.nameLabel.text = singleModel.gameName;
    
    UIImage *imgage = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/venue/venue_default_bg.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.bgImageView.image = [imgage scaleToSize:CGSizeMake(50, 51)];
    [self.venueImageView sd_setImageWithURL:[NSURL URLWithString:singleModel.iconUrl] placeholderImage:nil];
    [self handleIconStatus:singleModel.iconStatus];
    
    self.enterButton.enabled = ![singleModel.status isEqualToString:@"2"];
    self.maintenanceView.hidden = ![singleModel.status isEqualToString:@"2"];


}

- (void)handleIconStatus:(NSString *)iconStatus {
    BOOL imgViewHidden = YES;
    if (iconStatus != nil && [iconStatus isKindOfClass:[NSString class]] && iconStatus.length > 0) {
        NSInteger num = iconStatus.integerValue;
        switch (num) {
            case 1: {
                imgViewHidden = NO;
                UIImage *image = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/icon/classification_recommend.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                self.iconImageView.image = [image scaleToSize:CGSizeMake(34, 16)];
            }
                break;
            case 2: {
                UIImage *image = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/icon/classification_hot.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                self.iconImageView.image = [image scaleToSize:CGSizeMake(34, 16)];
                imgViewHidden = NO;
            }
                break;
            case 3: {
                UIImage *image = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/icon/classification_new_tour.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                self.iconImageView.image = [image scaleToSize:CGSizeMake(34, 16)];
                imgViewHidden = NO;
            }
                break;
                
            default:
                imgViewHidden = YES;
                break;
        }
    }
    
    self.iconImageView.hidden = imgViewHidden;
}

- (UIImageView *)iconImageView {
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.hidden = YES;
    }
    return _iconImageView;
}

- (UIImageView *)venueImageView {
    if (_venueImageView == nil) {
        _venueImageView = [[UIImageView alloc] init];
    }
    return _venueImageView;
}

- (UIImageView *)bgImageView {
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.contentMode = UIViewContentModeCenter;
        _bgImageView.backgroundColor = HexColor(0x2B3239);
    }
    return _bgImageView;
}

- (UILabel *)nameLabel {
    if (_nameLabel ==  nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"";
        _nameLabel.textColor = UIColor.whiteColor;
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.numberOfLines = 2;
    }
    return _nameLabel;
}

- (UIView *)maintenanceView {
    if (_maintenanceView == nil) {
        UIView *maintenanceView = [[UIView alloc] init];
        maintenanceView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        _maintenanceView = maintenanceView;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        UIImage *img = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/icon/game_weixiu.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        imageView.image = [img scaleToSize:CGSizeMake(24, 24)];
        [maintenanceView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(maintenanceView.mas_centerX);
            make.width.mas_equalTo(24);
            make.height.mas_equalTo(24);
            make.centerY.mas_equalTo(maintenanceView.mas_centerY).offset(-12);
        }];
        
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.text = NSLocalizedString(@"search_in_maintenance", nil);
        tipLabel.textColor = UIColor.whiteColor;
        tipLabel.font = [UIFont systemFontOfSize:12];
        [maintenanceView addSubview:tipLabel];
        [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(maintenanceView.mas_centerX);
            make.top.mas_equalTo(imageView.mas_bottom).offset(4);
        }];
        
    }
    return _maintenanceView;
}

- (UIButton *)enterButton {
    if (_enterButton == nil) {
        UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [enterButton setTitle:NSLocalizedString(@"game_join", nil) forState:UIControlStateNormal];
        [enterButton setTitle:NSLocalizedString(@"maintain", nil) forState:UIControlStateDisabled];
        [enterButton setBackgroundImage:[UIImage pmModelBButtonImageOfGradinentWithFrame:CGRectMake(0, 0, 42, 20) alpha:1] forState:UIControlStateNormal];
        [enterButton setBackgroundImage:[UIImage imageWithColor:[UIColor.whiteColor colorWithAlphaComponent:0.3]] forState:UIControlStateDisabled];
        enterButton.titleLabel.font = [UIFont systemFontOfSize:12];
        enterButton.layer.cornerRadius = 10;
        enterButton.clipsToBounds = YES;
//        [enterButton addTarget:self action:@selector(enterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        enterButton.userInteractionEnabled = NO;
        _enterButton = enterButton;
    }
    
    return _enterButton;
}

@end

@interface GameDYListView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UIView *contentNavView;

@property (nonatomic, strong) UICollectionView *gameCollectionView;

@property (nonatomic, strong) NSArray <DyGameModel *>*datas;

@property (nonatomic, strong) NSDictionary *arguments;

@end

@implementation GameDYListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self registerNotification];
        
        [self buildUI];
    }
    return self;
}

- (void)needGetDataFromFlutter {
    
    NSString *gameCode = self.arguments[@"gameCode"];
    if (gameCode == nil) gameCode = @"";
    [[OBChannelManager instance] sendEventToFlutterWith:OBEventIdentifier_eventIdentifierDyGameList arguments:@{@"type" : @"get", @"gameCode" : gameCode}];
}

- (void)registerNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dyGameListListen:) name:OBEventIdentifier_eventIdentifierDyGameList object:nil];
}

- (void)deleteNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:OBEventIdentifier_eventIdentifierDyGameList object:nil];
}

- (void)dealloc {
    [self deleteNotification];
}

- (void)dyGameListListen:(NSNotification*)notification {
    NSDictionary *dict = notification.object;
    [self filldAnyDatas:dict[@"data"]];
}


- (UIView *)topNavView {
    UIView *topNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    topNavView.backgroundColor = RGB(17, 20, 37);
    
    [topNavView addSubview:self.contentNavView];

    self.titleLabel.frame = self.contentNavView.bounds;
    [self.contentNavView addSubview:self.titleLabel];
    
    self.backButton.frame = CGRectMake(0, 0, 56, self.contentNavView.frame.size.height);
    UIImage *backImg = [UIImage imageFlutterOBComBaseAssets:@"assets/images/icon/com_back.png"];
    [self.backButton setImage:backImg forState:UIControlStateNormal];
    CGFloat lr = (self.contentNavView.frame.size.height - backImg.size.height / 3) * 0.5;
    CGFloat tb = (56 - backImg.size.width / 3) * 0.5;
    [self.backButton setImageEdgeInsets:UIEdgeInsetsMake(lr, tb, lr, tb)];
    [self.contentNavView addSubview:self.backButton];
    
    return topNavView;

}

- (void)dySetArguments:(id)arguments {
    
    if (arguments != nil && [arguments isKindOfClass:[NSDictionary class]]) {
        
        self.arguments = arguments;
        
        self.titleLabel.text = arguments[@"title"];
        
        [self needGetDataFromFlutter];

    }
    
}

- (void)buildUI {
    
    self.backgroundColor = HexColor(0x171E24);
    
    UIView *topNavView = [self topNavView];
    [self addSubview:topNavView];
    
    [self addSubview:self.gameCollectionView];

    [self.gameCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.top.mas_equalTo(topNavView.mas_bottom);
    }];
    
}

- (void)dyListClean {
    self.arguments = nil;
    _datas = @[];
    [self.gameCollectionView reloadData];
}

- (void)filldAnyDatas:(id)data {
    if (data != nil) {
        GameDyListModel *d = [GameDyListModel yy_modelWithJSON:data];
        if (d != nil && [d isKindOfClass:[GameDyListModel class]]) {
            _datas = d.list;
   
            [self.gameCollectionView reloadData];
        }
    }
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GameCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GameCollectionViewCellIdentifier" forIndexPath:indexPath];
    cell.singleModel = [self.datas objectAtIndexSecure:indexPath.row];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DyGameModel *gModel = [self.datas objectAtIndexSecure:indexPath.row];
    
    if (self.arguments != nil && [self.arguments isKindOfClass:[NSDictionary class]]) {
        
        if ([gModel.status isEqualToString:@"2"]) {
            OBAlertView *alertView = [OBAlertView createAlertTitle:NSLocalizedString(@"alert", nil) confirmColor:false content:NSLocalizedString(@"game_in_maintain2", nil) cancelBlock:nil cancelTitle:nil sureBlock:^{
                
            } sureTitle:NSLocalizedString(@"confirm", nil)];
            
            [[self superview] addSubview:alertView];
            return;
        }
        
        NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:self.arguments];
        mDict[@"gameId"] = gModel.gameId;
        mDict[@"title"] = gModel.gameName;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(dyListAction:)]) {
            [self.delegate dyListAction:mDict];
        }

    }
    
}

- (UIView *)contentNavView {
    if (_contentNavView == nil) {
        _contentNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    }
    
    return _contentNavView;
}

- (void)addRightNavButton:(UIButton *)btn {
    btn.frame = CGRectMake(self.contentNavView.frame.size.width - 56, 0, 56, self.contentNavView.frame.size.height);
    [self.contentNavView addSubview:btn];
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return  _titleLabel;
}

- (UIButton *)backButton {
    if (_backButton == nil) {
        _backButton = [[UIButton alloc] init];
        [_backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return  _backButton;
}

- (void)backButtonClick:(nullable UIButton *)button {

    if (_delegate && [_delegate respondsToSelector:@selector(dyListback)]) {
        [_delegate dyListback];
    }
}

- (UICollectionView *)gameCollectionView {
    if (!_gameCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat itemWidth = (SCREEN_WIDTH - (2 + 1) * 16.0) / 2;
        CGFloat itemHeight = itemWidth * 204.0 / 164.0;
        layout.itemSize = CGSizeMake(itemWidth, itemHeight);
        layout.sectionInset = UIEdgeInsetsMake(16, 16, 16, 16);
        layout.minimumLineSpacing = 16;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _gameCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _gameCollectionView.dataSource = self;
        _gameCollectionView.delegate = self;
        _gameCollectionView.showsHorizontalScrollIndicator = NO;
        _gameCollectionView.showsVerticalScrollIndicator = NO;
        _gameCollectionView.backgroundColor = [UIColor clearColor];
        _gameCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
        [_gameCollectionView registerClass:[GameCollectionViewCell class] forCellWithReuseIdentifier:@"GameCollectionViewCellIdentifier"];
    }
    return _gameCollectionView;
}

- (NSArray<DyGameModel *> *)datas {
    if (!_datas) {
        _datas = [NSArray array];
    }
    return _datas;
}

- (NSDictionary *)arguments {
    if (_arguments == nil) {
        _arguments = [NSDictionary dictionary];
    }
    return _arguments;
}

@end
