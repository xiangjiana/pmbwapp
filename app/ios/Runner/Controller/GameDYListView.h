//
//  GameDYListView.h
//  Runner
//
//  Created by Tmoson on 2023/3/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GameDYListViewDelegate <NSObject>

- (void)dyListAction:(id)arguments;

- (void)dyListback;

- (void)dyListTap;

@end

@interface GameDYListView : UIView

@property(nonatomic, weak) id<GameDYListViewDelegate> delegate;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *backButton;

- (void)dySetArguments:(id)arguments;

- (void)dyListClean;

@end

NS_ASSUME_NONNULL_END
