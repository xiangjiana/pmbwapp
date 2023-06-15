//
//  OBBaseViewController.h
//  Runner
//
//  Created by Tmoson on 2022/8/9.
//

#import <UIKit/UIKit.h>
#import "headerFile.h"

NS_ASSUME_NONNULL_BEGIN

@interface OBBaseViewController : UIViewController

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, assign) BOOL hiddenNav;

- (void)addRightNavButton:(UIButton *)btn;

- (void)backButtonClick:(nullable UIButton *)button;

@end

NS_ASSUME_NONNULL_END
