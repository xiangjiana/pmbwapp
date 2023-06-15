//
//  WebPageViewController.h
//  Runner
//
//  Created by Tmoson on 2022/8/9.
//

#import <UIKit/UIKit.h>
#import "OBBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WebPageViewController : OBBaseViewController

- (instancetype)initWithTitle:(NSString *)title url:(NSURL *)url;

- (instancetype)initWithTitle:(NSString *)title htmlString:(NSString *)htmlString;

@end

NS_ASSUME_NONNULL_END
