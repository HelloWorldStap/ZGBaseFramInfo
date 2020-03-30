//
//  ZGCollectionSectionInfo.m
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ZGCollectionSectionInfo.h"
#import "ZGCollectionViewIteamInfo.h"
@implementation ZGCollectionSectionInfo
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.headinfo = [[ZGCollectionViewIteamInfo alloc]init];
        self.footInfo = [[ZGCollectionViewIteamInfo alloc]init];
        
        self.minimumLineSpacing = 0.001;
        self.minimumInteritemSpacing = 0.001;
        self.sectionInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}
@end
