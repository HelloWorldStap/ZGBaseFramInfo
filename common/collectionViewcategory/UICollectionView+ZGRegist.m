//
//  UICollectionView+ZGRegist.m
//  ZGBookMall
//
//  Created by mac on 2019/12/17.
//  Copyright © 2019 offcn. All rights reserved.
//

#import "UICollectionView+ZGRegist.h"



@implementation UICollectionView (ZGRegist)
-(void)registerCellClassAndIdentifier:(Class)cls,...NS_REQUIRES_NIL_TERMINATION
{
    if (cls) {
        // 取出第一个参数
        [self registerClass:cls forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@",cls]];
        // 定义一个指向个数可变的参数列表指针；
        va_list args;
        // 用于存放取出的参数
         Class arg;
        // 初始化变量刚定义的va_list变量，这个宏的第二个参数是第一个可变参数的前一个参数，是一个固定的参数
        va_start(args, cls);
        // 遍历全部参数 va_arg返回可变的参数(a_arg的第二个参数是你要返回的参数的类型)
        while ((arg = va_arg(args,  Class))) {

            
        [self registerClass:arg forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@",arg]];
        }
        
        [self registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"UICollectionViewCell"];
        // 清空参数列表，并置参数指针args无效
        va_end(args);
    }

}
-(void)registerHeadClassAndIdentifier:(Class)cls,...NS_REQUIRES_NIL_TERMINATION
{
    if (cls) {
        // 取出第一个参数
        [self registerClass:cls forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@",cls]];
        // 定义一个指向个数可变的参数列表指针；
        va_list args;
        // 用于存放取出的参数
         Class arg;
        // 初始化变量刚定义的va_list变量，这个宏的第二个参数是第一个可变参数的前一个参数，是一个固定的参数
        va_start(args, cls);
        // 遍历全部参数 va_arg返回可变的参数(a_arg的第二个参数是你要返回的参数的类型)
        while ((arg = va_arg(args,  Class))) {
        [self registerClass:arg forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@",arg]];
        }
        
        [self registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView"];
        // 清空参数列表，并置参数指针args无效
        va_end(args);
    }

}
-(void)registerFootClassAndIdentifier:(Class)cls,...NS_REQUIRES_NIL_TERMINATION
{
    
    if (cls) {
        // 取出第一个参数
        [self registerClass:cls forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[NSString stringWithFormat:@"%@",cls]];
        // 定义一个指向个数可变的参数列表指针；
        va_list args;
        // 用于存放取出的参数
         Class arg;
        // 初始化变量刚定义的va_list变量，这个宏的第二个参数是第一个可变参数的前一个参数，是一个固定的参数
        va_start(args, cls);
        // 遍历全部参数 va_arg返回可变的参数(a_arg的第二个参数是你要返回的参数的类型)
        while ((arg = va_arg(args,  Class))) {
        [self registerClass:arg forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[NSString stringWithFormat:@"%@",arg]];
        }
        [self registerClass:UICollectionReusableView.class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView"];

        // 清空参数列表，并置参数指针args无效
        va_end(args);
    }

}
-(NSInteger)sectionForViewAtPointY:(CGFloat)pointY
{
  NSArray *array =  [self.collectionViewLayout layoutAttributesForElementsInRect:self.bounds];
    
    for (NSInteger i=0; i<array.count; i++) {
        UICollectionViewLayoutAttributes *Attribute = array[i];
        
        CGRect iteamFram = Attribute.frame;
        
        CGFloat minY = iteamFram.origin.y;
        CGFloat maxY = iteamFram.origin.y+iteamFram.size.height;
        
        if (pointY>=minY&&pointY<=maxY) {
            
            return Attribute.indexPath.section;
            
        }
        
        
    }
    
    return 0;
    
}

-(CGFloat)pointYwithSection:(NSInteger)section
{
    
    NSIndexPath *inexpath = [NSIndexPath indexPathForRow:0 inSection:section];
    
   UICollectionViewLayoutAttributes *layoutAttributs = [self layoutAttributesForSupplementaryElementOfKind:UICollectionElementKindSectionHeader atIndexPath:inexpath];
    
    return layoutAttributs.frame.origin.y;
    
}
@end
