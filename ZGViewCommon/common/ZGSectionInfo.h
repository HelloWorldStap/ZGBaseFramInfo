//
//  ZGSectionInfo.h
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGBaseIteamViewInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZGSectionInfo : NSObject
/**
 位置
 */
@property(nonatomic,assign)int index;
/**
 描述
 */
@property(nonatomic,strong)NSString *descript;
/**
 头视图
 */
@property(nonatomic,strong)ZGBaseIteamViewInfo *headinfo;
/**
 尾视图
 */
@property(nonatomic,strong)ZGBaseIteamViewInfo *footInfo;
/**
 section的数据
 */
@property(nonatomic,strong)NSMutableArray *iteamArray;

@end

NS_ASSUME_NONNULL_END
