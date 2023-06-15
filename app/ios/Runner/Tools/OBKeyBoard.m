//
//  OBKeyBoard.m
//  Runner
//
//  Created by Tmoson on 2022/5/7.
//

#import "OBKeyBoard.h"
#import <Masonry.h>
#import "UIImage+OBAdd.h"

static NSInteger const kKeyBoardTag = 1200;

/**
 *  颜色16进制
 */
#define UICOLOR_FROM_RGB_OxFF(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface OBKeyBoard ()

@end

@implementation OBKeyBoard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeViewComponents];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initializeViewComponents];
    }
    return self;
}


#pragma mark == private method
- (void)initializeViewComponents
{
    self.backgroundColor = UICOLOR_FROM_RGB_OxFF(0x151E25);
    

    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteButton.layer.cornerRadius = 5;
    [deleteButton.layer setMasksToBounds:YES];
    [deleteButton setImage:[UIImage imageNamed:@"back_space"] forState:UIControlStateNormal];
    [deleteButton setBackgroundImage:[UIImage imageWithColor:UICOLOR_FROM_RGB_OxFF(0x585F65)] forState:UIControlStateNormal];
    [deleteButton setBackgroundImage:[UIImage imageWithColor:UICOLOR_FROM_RGB_OxFF(0x3BC117)] forState:UIControlStateHighlighted];
    [deleteButton setBackgroundImage:[UIImage imageWithColor:UICOLOR_FROM_RGB_OxFF(0x3BC117)] forState:UIControlStateSelected];
    [deleteButton addTarget:self action:@selector(deleteKeyBoardClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:deleteButton];
    [deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).inset(6);
        make.right.mas_equalTo(self.mas_right).offset(-6);
        make.width.mas_equalTo(66);
        make.height.mas_equalTo(48 * 2 + 6);
    }];
    
    UIImage *imgage = [[UIImage imageFlutterOBComBaseAssets:@"assets/images/icon/keyboard_done_bg.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureButton setBackgroundColor:UICOLOR_FROM_RGB_OxFF(0x585F65)];
    sureButton.titleLabel.font = [UIFont systemFontOfSize:18];
    sureButton.titleLabel.numberOfLines = 0;
    sureButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    sureButton.layer.cornerRadius = 5;
    [sureButton.layer setMasksToBounds:YES];
    [sureButton setTitle:NSLocalizedString(@"confirm", nil) forState:UIControlStateNormal];
    [sureButton setBackgroundImage:imgage forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureKeyBoardClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sureButton];
    [sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(deleteButton.mas_bottom).offset(6);
        make.right.mas_equalTo(self.mas_right).offset(-6);
        make.width.mas_equalTo(66);
        make.height.mas_equalTo(48 * 2 + 6);
    }];
    
    UIView *numberView = [[UIView alloc] init];
    [self addSubview:numberView];
    [numberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(self).inset(6);
        make.top.mas_equalTo(self);
        make.right.mas_equalTo(deleteButton.mas_left).offset(-6);
    }];
    

    
    NSArray *array = @[@[@"1",@"2",@"3",],@[@"4",@"5",@"6"], @[@"7",@"8",@"9"],@[@".",@"0",@"↓"],];
    NSInteger kKeyBoardNumber = array.count;
    
    CGFloat stackY = 6.f;
    for (int i = 0; i < kKeyBoardNumber; i ++) {
        
        
        NSArray *arr = array[i];
        
        UIStackView *stackView = [[UIStackView alloc] init];
        stackView.distribution = UIStackViewDistributionFillEqually;
        stackView.spacing = 6;
        NSInteger kNumber = arr.count;
        for (int j = 0; j < kNumber; j ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = kKeyBoardTag + i * 100 + j;
            [button setBackgroundImage:[UIImage imageWithColor:UICOLOR_FROM_RGB_OxFF(0x585F65)] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageWithColor:UICOLOR_FROM_RGB_OxFF(0x3BC117)] forState:UIControlStateHighlighted];
            [button setBackgroundImage:[UIImage imageWithColor:UICOLOR_FROM_RGB_OxFF(0x3BC117)] forState:UIControlStateSelected];
            NSString *ti = arr[j];
            if ([ti isEqualToString:@"↓"]) {
                [button setImage:[UIImage imageNamed:@"pack_up"] forState:UIControlStateNormal];
            }else {
                [button setTitle:arr[j] forState:UIControlStateNormal];
            }
            button.titleLabel.font = [UIFont systemFontOfSize:25];
            
            button.layer.cornerRadius = 5;
            [button.layer setMasksToBounds:YES];
            
            
            [button addTarget:self action:@selector(keyBoardClick:) forControlEvents:UIControlEventTouchUpInside];
            [stackView addArrangedSubview:button];
            
        }
        [numberView addSubview:stackView];
        [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(numberView);
            make.height.mas_equalTo(48);
            make.top.mas_equalTo(numberView.mas_top).offset(stackY);
        }];
        
        stackY += (48 + 6);
        
    }
    

}

- (void)keyBoardClick:(UIButton *)sender {
    
    NSInteger tag = sender.tag - kKeyBoardTag;
    if (tag == (300 + 2)) {
        if (self.keyBoardClickBlock) {
            self.keyBoardClickBlock(OBKeyBoardDawn, sender.currentTitle);
        }
    }else {
        if (self.keyBoardClickBlock) {
            self.keyBoardClickBlock(OBKeyBoardOther, sender.currentTitle);
        }
    }
}

- (void)sureKeyBoardClick:(UIButton *)sender {
    
    if (self.keyBoardClickBlock) {
        self.keyBoardClickBlock(OBKeyBoardDawn, sender.currentTitle);
    }
}

- (void)deleteKeyBoardClick:(UIButton *)sender {
    if (self.keyBoardClickBlock) {
        self.keyBoardClickBlock(OBKeyBoardDelete, sender.currentTitle);
    }
}

@end
