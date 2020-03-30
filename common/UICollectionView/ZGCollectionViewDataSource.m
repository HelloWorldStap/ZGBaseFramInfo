//
//  ZGCollectionViewDataSource.m
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ZGCollectionViewDataSource.h"
#import "ZGListInfo.h"
#import "UIResponder+Router.h"
@interface ZGCollectionViewDataSource()

@end
@implementation ZGCollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return  self.dataArray.count;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    ZGCollectionSectionInfo *model = self.dataArray[section];
    
    return model.iteamArray.count;
    
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZGCollectionSectionInfo *model = self.dataArray[indexPath.section];

    
    ZGBaseIteamViewInfo *man = model.iteamArray[indexPath.row];
    
    
    if ([self.owner respondsToSelector:@selector(routerEventWithName:userInfo:)]) {
        [self.owner routerEventWithName:@"cellClick" userInfo:@{@"model":man}];
    }
    
//    if (man.sel) {
//
//        #pragma clang diagnostic push
//
//        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//
//             [self performSelector:man.sel withObject:@{@"ZGCellManagerModel":man}];
//
//        #pragma clang diagnostic pop
//
//    }



    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
     ZGCollectionSectionInfo *model = self.dataArray[indexPath.section];

       
       ZGBaseIteamViewInfo *man = model.iteamArray[indexPath.row];
    
        NSString *Identifier  = @"UICollectionViewCell";
    
        if (man.Identifier.length>0) {
            Identifier = man.Identifier;
        }
    
   UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Identifier forIndexPath:indexPath];
    cell.ZGModel = man;
    
    return cell;
        
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    ZGCollectionSectionInfo *model = self.dataArray[indexPath.section];

    NSString *Identifier = @"UICollectionReusableView";
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        Identifier =model.headinfo.Identifier;
    }else
    {
        Identifier = model.footInfo.Identifier;
    }
    
    
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:Identifier forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        view.ZGModel =model;
    }else
    {
        view.ZGModel = model;
    }

    
    
    
    return view;

    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
     ZGCollectionSectionInfo *model = self.dataArray[indexPath.section];
    ZGCollectionViewIteamInfo *man = model.iteamArray[indexPath.row];
    
    ZGCollectionBaseFramInfo *framInfo = man.framInfo;
    
    return framInfo.cellSzie;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    ZGCollectionSectionInfo *model = self.dataArray[section];

    ZGCollectionViewIteamInfo *info =(ZGCollectionViewIteamInfo *) model.headinfo;
    
  ZGCollectionBaseFramInfo *headFramInfo  = info.framInfo;
    
    return headFramInfo.cellSzie;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    ZGCollectionSectionInfo *model = self.dataArray[section];

       ZGCollectionViewIteamInfo *info =(ZGCollectionViewIteamInfo *) model.footInfo;
       
     ZGCollectionBaseFramInfo *footFramInfo  = info.framInfo;
      
      return footFramInfo.cellSzie;


    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    ZGCollectionSectionInfo *model = self.dataArray[section];
    return   model.sectionInsets;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    ZGCollectionSectionInfo *model = self.dataArray[section];

    return model.minimumLineSpacing;
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    ZGCollectionSectionInfo *model = self.dataArray[section];

    return model.minimumInteritemSpacing;
}

@end
