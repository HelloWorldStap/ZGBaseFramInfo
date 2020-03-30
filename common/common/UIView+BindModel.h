//
//  UIView+BindModel.h
//  ZGAdd
//
//  Created by mac on 2019/5/21.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UIViewDeleget <NSObject>
@optional
/**
 此方法可以用于代理事件的传递，如果多层（cell里面多层view）传递的话可以考虑UIResponder+Router
 不同的事件的处理name不能重复 dic传递的是参数
 */
-(void)touchName:(NSString *)name WithParam:(NSDictionary *)dic;

@end

@interface UIView (BindModel)
/**
 绑定的model
 */
@property(nonatomic,strong)NSObject *ZGModel;
/**
 绑定的位置
 */
@property(nonatomic,strong)NSIndexPath *ZGIndexPath;
/**
 绑定的代理
 */
@property(nonatomic,weak)id<UIViewDeleget>ZGDeleget;
@end

NS_ASSUME_NONNULL_END
