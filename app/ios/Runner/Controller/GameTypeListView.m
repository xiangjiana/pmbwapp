//
//  GameTypeListView.m
//  Runner
//
//  Created by Tmoson on 2022/9/20.
//

#import "GameTypeListView.h"
#import <Masonry/Masonry.h>
#import "NSArray+MKAdd.h"
#import "headerFile.h"
#import "UIImage+OBAdd.h"
#import "UIImageView+WebCache.h"
#import "GameTypeListModel.h"

@class SerListCollectionViewCell;

typedef void(^HomeSerListColAction)(SerListCollectionViewCell *cell);

@interface SerListCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) GameTypeListModel *listModel;

@property (nonatomic, strong) UIView *typeContentView;

@property (nonatomic, strong) UIImageView *typeImageView;

@property (nonatomic, strong) UILabel *typeLabel;

@property (nonatomic, strong) UIImageView *typeUnfoldImageView;

@property (nonatomic, copy) HomeSerListColAction serListActionBlock;

@property (nonatomic, assign) BOOL typeSelected;

@property (nonatomic, strong) NSDictionary *typeMapDict;

- (void)seriesButtonSelectedUI;

- (void)unfoldImage:(BOOL)unfold;

@end

@implementation SerListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.backgroundColor = RGBA(255, 255, 255, 0.04);
        self.contentView.layer.cornerRadius = 14;
        
        [self.contentView addSubview:self.typeContentView];
        [self.typeContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(seriesButtonClick:)];
        [self.contentView addGestureRecognizer:tap];
    
    }
    return self;
}

- (void)seriesButtonClick:(UIGestureRecognizer *)ges {
    self.typeSelected = YES;
    [self seriesButtonSelectedUI];
    if (self.serListActionBlock) {
        self.serListActionBlock(self);
    }
}

- (void)setListModel:(GameTypeListModel *)listModel {
    _listModel = listModel;
    
    
    self.typeLabel.text = listModel.title;
    
    NSString *iconName = self.typeMapDict[listModel.venueTypeCode];
    if (iconName != nil && [iconName isKindOfClass:[NSString class]] && iconName.length) {
        self.typeImageView.image = [[UIImage imageFlutterOBComBaseAssets:iconName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
 
    [self seriesButtonSelectedUI];
}

- (void)seriesButtonSelectedUI {
    if (self.typeSelected) {
        self.typeLabel.textColor = HexColor(0x3BC117);
        self.typeImageView.tintColor = HexColor(0x3BC117);
//        [UIView animateWithDuration:0.25 animations:^{
            [self.typeUnfoldImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(16);
            }];
//            [self layoutIfNeeded];
//        }];
        self.typeUnfoldImageView.hidden = NO;
        self.typeContentView.layer.borderColor = HexColor(0x3BC117).CGColor;
        self.typeContentView.layer.borderWidth = 1;
        
    } else {
        self.typeUnfoldImageView.hidden = YES;
//        [UIView animateWithDuration:0.25 animations:^{
            [self.typeUnfoldImageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(0);
            }];
//            [self layoutIfNeeded];
//        }];
        self.typeLabel.textColor = [UIColor.whiteColor colorWithAlphaComponent:0.6];
        self.typeImageView.tintColor = [UIColor.whiteColor colorWithAlphaComponent:0.6];
        
        self.typeContentView.layer.borderColor = UIColor.clearColor.CGColor;
        self.typeContentView.layer.borderWidth = 0;
    }
}

- (void)unfoldImage:(BOOL)unfold {
    if (self.typeSelected && unfold) {
        self.typeUnfoldImageView.transform = CGAffineTransformMakeRotation(M_PI);
        return;
    }
    self.typeUnfoldImageView.transform = CGAffineTransformIdentity;
}

- (UIView *)typeContentView {
    if (_typeContentView == nil) {
        _typeContentView = [[UIView alloc] init];
        _typeContentView.layer.cornerRadius = 14;
        _typeContentView.clipsToBounds = YES;
        
        [_typeContentView addSubview:self.typeImageView];
        [self.typeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(16);
            make.height.mas_equalTo(16);
            make.centerY.mas_equalTo(_typeContentView.mas_centerY);
            make.left.mas_equalTo(_typeContentView.mas_left).offset(4);
        }];
        
        [_typeContentView addSubview:self.typeLabel];
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_typeContentView.mas_centerY);
            make.left.mas_equalTo(self.typeImageView.mas_right).offset(6);
        }];
        
        [self.typeLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.typeLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        [_typeContentView addSubview:self.typeUnfoldImageView];
        [self.typeUnfoldImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(16);
            make.height.mas_equalTo(16);
            make.centerY.mas_equalTo(_typeContentView.mas_centerY);
            make.left.mas_equalTo(self.typeLabel.mas_right);
            make.right.mas_equalTo(_typeContentView.mas_right).offset(-4);
        }];
        
    }
    return _typeContentView;
}

- (UIImageView *)typeImageView {
    if (_typeImageView == nil) {
        _typeImageView = [[UIImageView alloc] init];
    }
    return _typeImageView;
}

- (UILabel *)typeLabel {
    if (_typeLabel == nil) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _typeLabel;
}

- (UIImageView *)typeUnfoldImageView {
    if (_typeUnfoldImageView == nil) {
        _typeUnfoldImageView = [[UIImageView alloc] init];
        _typeUnfoldImageView.image = [[UIImage imageNamed:@"home_more_down"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _typeUnfoldImageView.tintColor = HexColor(0x3BC117);
    }
    return _typeUnfoldImageView;
}


- (NSDictionary *)typeMapDict {
    if (_typeMapDict == nil) {
        _typeMapDict = @{
            @"zr" : @"assets/images/venue/type_zhenren.png",
            @"ty" : @"assets/images/venue/type_tiyu.png",
            @"qp" : @"assets/images/venue/type_qipai.png",
            @"qkl" : @"assets/images/venue/type_haxi.png",
            @"dj" : @"assets/images/venue/type_dianjin.png",
            @"cp" : @"assets/images/venue/type_caipiao.png",
            @"by" : @"assets/images/venue/type_buyu.png",
            @"dy" : @"assets/images/venue/type_dianzi.png",
        };
    }
    return _typeMapDict;
}

@end

#pragma --mark VenueCollectionViewCell

@interface VenueCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong) GameModel *singleModel;

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIImageView *venueImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIView *maintenanceView;

@end

@implementation VenueCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.bgImageView];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
        
        [self.contentView addSubview:self.venueImageView];
        [self.venueImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];

        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView).offset(10);
            make.left.mas_equalTo(self.contentView).offset(10);
            make.width.mas_lessThanOrEqualTo(self.contentView.mas_width).multipliedBy(0.5);
        }];
        
        [self.contentView addSubview:self.maintenanceView];
        [self.maintenanceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setSingleModel:(GameModel *)singleModel {
    _singleModel = singleModel;
    
    self.nameLabel.text = singleModel.venueName;
    
    UIImage *imgage = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/venue/venue_default_bg.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.bgImageView.image = [imgage scaleToSize:CGSizeMake(50, 51)];
    [self.venueImageView sd_setImageWithURL:[NSURL URLWithString:singleModel.venueTransferIconUrlApp] placeholderImage:nil];
    
    if (singleModel.selected) {
        self.venueImageView.layer.borderColor = UIColor.whiteColor.CGColor;
        self.venueImageView.layer.borderWidth = 1;
    } else {
        self.venueImageView.layer.borderColor = UIColor.clearColor.CGColor;
        self.venueImageView.layer.borderWidth = 0;
    }
    
    self.maintenanceView.hidden = ![singleModel.status isEqualToString:@"2"];

}

- (UIImageView *)venueImageView {
    if (_venueImageView == nil) {
        _venueImageView = [[UIImageView alloc] init];
        _venueImageView.layer.cornerRadius = 12;
        _venueImageView.clipsToBounds = YES;
    }
    return _venueImageView;
}

- (UIImageView *)bgImageView {
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.layer.cornerRadius = 12;
        _bgImageView.clipsToBounds = YES;
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
        _nameLabel.numberOfLines = 4;
    }
    return _nameLabel;
}

- (UIView *)maintenanceView {
    if (_maintenanceView == nil) {
        UIView *maintenanceView = [[UIView alloc] init];
        maintenanceView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        maintenanceView.layer.cornerRadius = 12;
        maintenanceView.clipsToBounds = YES;
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

@end

#pragma --mark GameTypeListView

@interface GameTypeListView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *seriesCollectionView;

@property (nonatomic, strong) UICollectionView *venueCollectionView;

@property (nonatomic, strong) NSArray <GameTypeListModel *>*datas;

@property (nonatomic, assign) NSInteger mkselectedIndex;

@property (nonatomic, assign) CGSize ticketSize;

@property (nonatomic, assign) CGRect curFrame;

@property (nonatomic, assign) BOOL curUnfoldStatus;

@property (nonatomic, strong) GameModel *curGModel;

@end

@implementation GameTypeListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.curFrame = frame;
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    
    self.backgroundColor = HexColor(0x171E24);
    
    [self addSubview:self.venueCollectionView];
    [self addSubview:self.seriesCollectionView];
    
    [self.seriesCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self);
        make.height.mas_equalTo(52);
    }];
    
    [self.venueCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.top.mas_equalTo(self.seriesCollectionView.mas_bottom);
    }];
    
    [self seriesClick:NO];
}

- (void)filldAnyDatas:(id)data {
    if (data != nil) {
        GameDataListModel *d = [GameDataListModel yy_modelWithJSON:data];
        if (d != nil && [d isKindOfClass:[GameDataListModel class]]) {
          
            NSMutableArray *dataArray = [NSMutableArray array];
            for (GameTypeListModel *listModel in d.list) {
                if (listModel.venueList.count) {
                    listModel.title = listModel.venueList.firstObject.venueTypeName;
                    for (GameModel *gModel in listModel.venueList) {
                        if (self.curGameCode != nil && [self.curGameCode isEqualToString:gModel.venueCode]) {
                            self.curGModel.selected = NO;
                            gModel.selected = YES;
                            self.curGModel = gModel;
                        }else {
                            gModel.selected = NO;
                        }
                    }
                    [dataArray addObject:listModel];
                }
            }
            
            _datas = dataArray;
            [self.seriesCollectionView reloadData];
            [self.venueCollectionView reloadData];
        }
    }
    
}

- (void)setCurGameCode:(NSString *)curGameCode {
    _curGameCode = curGameCode;
    
    if (curGameCode.length) {
        
        if (self.gameSkip == YES) return;
        
        self.gameSkip = YES;
        
        BOOL found = NO;
        for (NSInteger i = 0; i < self.datas.count; i++) {
            GameTypeListModel *listModel = [self.datas objectAtIndexSecure:i];
            for (GameModel *gModel in listModel.venueList) {
                if ([curGameCode isEqualToString:gModel.venueCode]) {
                    self.mkselectedIndex = i;
                    self.curGModel.selected = NO;
                    found = YES;
                    gModel.selected = YES;
                    self.curGModel = gModel;
                    break;
                }
            }
        }
        if (found) {
            [self.seriesCollectionView reloadData];
            [self.venueCollectionView reloadData];
        }
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([collectionView isEqual:self.seriesCollectionView]) {
        return self.datas.count;
    }else {
        GameTypeListModel *listModel = [self.datas objectAtIndexSecure:self.mkselectedIndex];
        return listModel.venueList.count;
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.seriesCollectionView) {
        BOOL flg = self.mkselectedIndex == indexPath.row;
        SerListCollectionViewCell *scCell = (SerListCollectionViewCell *)cell;
        scCell.typeSelected = flg;
        [scCell seriesButtonSelectedUI];
        [scCell unfoldImage:self.curUnfoldStatus];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == self.seriesCollectionView) {
        SerListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SerListCollectionViewCellIdentifier" forIndexPath:indexPath];
        BOOL flg = self.mkselectedIndex == indexPath.row;
        cell.typeSelected = flg;
        [cell seriesButtonSelectedUI];
        cell.listModel = [self.datas objectAtIndexSecure:indexPath.row];
        [cell unfoldImage:self.curUnfoldStatus];
        @weakify(self)
        cell.serListActionBlock = ^(SerListCollectionViewCell * _Nonnull cell) {
            @strongify(self);
            
            if (self.mkselectedIndex != indexPath.row) {
                SerListCollectionViewCell *lastCell = (SerListCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:self.mkselectedIndex inSection:0]];
                if (lastCell) {
                    lastCell.typeSelected = NO;
                    [lastCell seriesButtonSelectedUI];
                }
                cell.typeSelected = YES;
                [cell seriesButtonSelectedUI];
                self.mkselectedIndex = indexPath.row;
                [self seriesClick:YES];
                self.gameSkip = YES;
            } else {
                [self seriesClick:!self.curUnfoldStatus];
            }
            [cell unfoldImage:self.curUnfoldStatus];
            [collectionView reloadData];
            [self.seriesCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.mkselectedIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
            
        };
        return cell;
    }else {
        VenueCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VenueCollectionViewCellIdentifier" forIndexPath:indexPath];
        GameTypeListModel *listModel = [self.datas objectAtIndexSecure:self.mkselectedIndex];
        cell.singleModel = [listModel.venueList objectAtIndexSecure:indexPath.row];
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([collectionView isEqual:self.venueCollectionView]) {
        GameTypeListModel *listModel = [self.datas objectAtIndexSecure:self.mkselectedIndex];
        GameModel *gModel = [listModel.venueList objectAtIndexSecure:indexPath.row];
        self.curGModel.selected = NO;
        gModel.selected = YES;
        self.curGModel = gModel;
        _curGameCode = gModel.venueCode;
        
        [self.venueCollectionView reloadData];
        if (self.delegate && [self.delegate respondsToSelector:@selector(typeListAction:)]) {
            [self.delegate typeListAction:gModel];
        }
    }
}

- (UICollectionView *)venueCollectionView {
    if (!_venueCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        self.ticketSize = CGSizeMake(104, 90);
        layout.itemSize = self.ticketSize;
        layout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
        layout.minimumLineSpacing = 12;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _venueCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _venueCollectionView.dataSource = self;
        _venueCollectionView.delegate = self;
        _venueCollectionView.showsHorizontalScrollIndicator = NO;
        _venueCollectionView.showsVerticalScrollIndicator = NO;
        _venueCollectionView.backgroundColor = [UIColor clearColor];
        _venueCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
        [_venueCollectionView registerClass:[VenueCollectionViewCell class] forCellWithReuseIdentifier:@"VenueCollectionViewCellIdentifier"];
    }
    return _venueCollectionView;
}

- (UICollectionView *)seriesCollectionView {
    if (!_seriesCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.estimatedItemSize = CGSizeMake(74, 28);
        layout.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _seriesCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _seriesCollectionView.dataSource = self;
        _seriesCollectionView.delegate = self;
        _seriesCollectionView.showsHorizontalScrollIndicator = NO;
        _seriesCollectionView.showsVerticalScrollIndicator = NO;
        _seriesCollectionView.backgroundColor = [UIColor clearColor];
        [_seriesCollectionView registerClass:[SerListCollectionViewCell class] forCellWithReuseIdentifier:@"SerListCollectionViewCellIdentifier"];
    }
    return _seriesCollectionView;
}

- (NSArray<GameTypeListModel *> *)datas {
    if (!_datas) {
        _datas = [NSArray array];
    }
    return _datas;
}

- (void)setMkselectedIndex:(NSInteger)mkselectedIndex {
    _mkselectedIndex = mkselectedIndex;
}

- (void)seriesClick:(BOOL)unfold {
    [self.venueCollectionView reloadData];
    [self.venueCollectionView setContentOffset:CGPointMake(0, 0)];
    
    if (unfold) {
        self.frame = self.curFrame;
        self.venueCollectionView.hidden = NO;
    } else {
        self.frame = CGRectMake(self.curFrame.origin.x, self.curFrame.origin.y, self.curFrame.size.width, 52);
        self.venueCollectionView.hidden = YES;
    }
    self.curUnfoldStatus = unfold;
    if (self.delegate && [self.delegate respondsToSelector:@selector(typeListFrame:)]) {
        [self.delegate typeListFrame:self.frame];
    }
}

@end
