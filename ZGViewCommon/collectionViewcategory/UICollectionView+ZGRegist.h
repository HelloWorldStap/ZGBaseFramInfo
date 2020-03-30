//
//  UICollectionView+ZGRegist.h
//  ZGBookMall
//
//  Created by mac on 2019/12/17.
//  Copyright © 2019 offcn. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (ZGRegist)
-(void)registerCellClassAndIdentifier:(Class)cls,...NS_REQUIRES_NIL_TERMINATION;
-(void)registerHeadClassAndIdentifier:(Class)cls,...NS_REQUIRES_NIL_TERMINATION;
-(void)registerFootClassAndIdentifier:(Class)cls,...NS_REQUIRES_NIL_TERMINATION;
-(NSInteger)sectionForViewAtPointY:(CGFloat)pointY;
-(CGFloat)pointYwithSection:(NSInteger)section;



@end

NS_ASSUME_NONNULL_END
