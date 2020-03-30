//
//  ZGCollectionBaseFramInfo.m
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ZGCollectionBaseFramInfo.h"

@implementation ZGCollectionBaseFramInfo
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellSzie = CGSizeMake(0, 0.001);
    }
    return self;
}
@end
