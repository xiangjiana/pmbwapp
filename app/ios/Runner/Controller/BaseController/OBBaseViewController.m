//
//  OBBaseViewController.m
//  Runner
//
//  Created by Tmoson on 2022/8/9.
//

#import "OBBaseViewController.h"
#import "DeviceUtils.h"
#import "UIImage+OBAdd.h"

@interface OBBaseViewController ()

@property (nonatomic, strong) UIView *contentNavView;

@end

@implementation OBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [DeviceUtils setupDeviceOrientationPortraitAction];
    
    if (self.hiddenNav == NO) {
        [self.view addSubview:[self topNavView]];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [DeviceUtils setupDeviceOrientationPortraitAction];
}

- (UIView *)topNavView {
    UIView *topNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kLayoutNavbarHeight)];
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

- (UIView *)contentNavView {
    if (_contentNavView == nil) {
        _contentNavView = [[UIView alloc] initWithFrame:CGRectMake(0, kLayoutStatusBarHeight, SCREEN_WIDTH, kLayoutNavbarHeight - kLayoutStatusBarHeight)];
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
        [_backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return  _backButton;
}

- (void)backButtonClick:(nullable UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return YES;
}

@end
