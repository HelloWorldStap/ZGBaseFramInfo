//
//  UIView+BindModel.m
//  ZGAdd
//
//  Created by mac on 2019/5/21.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "UIView+BindModel.h"
#import <objc/runtime.h>
static NSString *nameKey = @"model";
static NSString *indexPathName  = @"indexPath";
static NSString *delegetName = @"deleget";
@implementation UIView (BindModel)
-(void)setZGModel:(NSObject *)ZGModel
{
    objc_setAssociatedObject(self, &nameKey, ZGModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}
- (NSObject *)ZGModel
{
    return objc_getAssociatedObject(self, &nameKey);

}
- (void)setZGIndexPath:(NSIndexPath *)ZGIndexPath
{
    objc_setAssociatedObject(self, &indexPathName, ZGIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSIndexPath *)ZGIndexPath
{
    return objc_getAssociatedObject(self, &indexPathName);

}
- (void)setZGDeleget:(id<UIViewDeleget>)ZGDeleget
{
    objc_setAssociatedObject(self, &delegetName, ZGDeleget, OBJC_ASSOCIATION_ASSIGN);

}
- (id<UIViewDeleget>)ZGDeleget
{
    return objc_getAssociatedObject(self, &delegetName);

}
@end
