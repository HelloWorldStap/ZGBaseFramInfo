//
//  ZGTableViewDataSource.h
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZGBaseDataSource.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZGTableViewDataSource : ZGBaseDataSource<UITableViewDelegate,UITableViewDataSource>

@end

NS_ASSUME_NONNULL_END
