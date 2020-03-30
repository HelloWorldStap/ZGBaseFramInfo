//
//  ZGListViewModel.h
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGBaseDataSource.h"
#import <UIKit/UIKit.h>
#import "UICollectionView+ZGRegist.h"
#import "ZGBaseAdapt.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZGListViewModel : NSObject
@property(nonatomic,strong)UIView *bindView;
/**
 执行数据排序的是哪一个
 */
@property(nonatomic,strong)ZGBaseAdapt *adapt;
/**
 获取的数据（数组、字典、模型都可以）
 */
@property(nonatomic,strong)id dataModel;
-(instancetype)initWithOwner:(UIViewController *)owner NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
