//
//  GameTypeListView.h
//  Runner
//
//  Created by Tmoson on 2022/9/20.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@class GameTypeListModel;
@class GameModel;

@protocol GameTypeListViewDelegate <NSObject>

- (void)typeListAction:(GameModel *)listModel;

- (void)typeListFrame:(CGRect)frame;

@end

@interface GameTypeListView : UIView

@property(nonatomic, weak) id<GameTypeListViewDelegate> delegate;

@property(nonatomic, assign) BOOL gameSkip;

@property(nonatomic, strong) NSString *curGameCode;

- (void)filldAnyDatas:(id)data;

@end

NS_ASSUME_NONNULL_END
