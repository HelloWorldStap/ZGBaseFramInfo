//
//  ZGBaseDataSource.h
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ZGBaseDataSource : NSObject
@property(nonatomic,strong)NSArray *dataArray;
/**
 方法执行需要
 */
@property(nonatomic,weak)UIViewController * owner;
@end

NS_ASSUME_NONNULL_END
