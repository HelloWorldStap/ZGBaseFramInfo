//
//  ZGBaseIteamViewInfo.h
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGBaseFramInfo.h"
NS_ASSUME_NONNULL_BEGIN

#pragma --标志cell t补充视图的各种信息 最直接交互的model，framinfo 需要

@interface ZGBaseIteamViewInfo : NSObject

/**
 每一个itam的数据的信息
 */
@property(nonatomic,strong)id dataModel;
/**
 每一个iteam的标志
 */
@property(nonatomic,strong)NSString *Identifier;
/**
 每一个itam的index 用来标志itam的位置，当数据相同fram相同标志相同的时候可以用index里面来区分
 */
@property(nonatomic,assign)NSInteger index;

@end

NS_ASSUME_NONNULL_END
