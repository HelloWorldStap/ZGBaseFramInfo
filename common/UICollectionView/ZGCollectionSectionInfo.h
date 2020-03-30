//
//  ZGCollectionSectionInfo.h
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ZGSectionInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZGCollectionSectionInfo : ZGSectionInfo
/**
 minimumLineSpacing
 */
@property(nonatomic,assign)CGFloat minimumLineSpacing;
/**
 minimumInteritemSpacing
 */
@property(nonatomic,assign)CGFloat minimumInteritemSpacing;
/**
 每一组的内切
 */
@property(nonatomic,assign)UIEdgeInsets sectionInsets;

@end

NS_ASSUME_NONNULL_END
