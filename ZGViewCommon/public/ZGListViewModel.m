//
//  ZGListViewModel.m
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ZGListViewModel.h"
@interface ZGListViewModel()
@property(nonatomic,weak)UIViewController *owner;
@property(nonatomic,strong)ZGBaseDataSource *datasouce;
@end
@implementation ZGListViewModel
-(instancetype)initWithOwner:(UIViewController *)owner
{
    if (self=[super init]) {
        self.owner = owner;
    }
    return self;
}

-(void)setDataModel:(id)dataModel
{
    _dataModel = dataModel;
    
    if (self.adapt&&self.datasouce) {
        NSArray *array  = [self.adapt modelArrayFromData:dataModel];
        self.datasouce.dataArray = array;

    }else
    {
         NSAssert(self.adapt, @"需要制定哪一个类执行数据的处理以及绑定的数据处理");
    }
    

   
    
}

-(void)setBindView:(UIView *)bindView
{
    if ([bindView isKindOfClass:UICollectionView.class]) {
        ZGCollectionViewDataSource *dataSouce = [[ZGCollectionViewDataSource alloc]init];
           UICollectionView *collectionView = (UICollectionView *)bindView;
           collectionView.dataSource = dataSouce;
           collectionView.delegate = dataSouce;
            dataSouce.owner = self.owner;
           self.datasouce = dataSouce;
    }else if ([bindView isKindOfClass:UITableView.class])
    {
        ZGTableViewDataSource *dataSouce = [[ZGTableViewDataSource alloc]init];
        UITableView *biew= (UITableView *)bindView;
        biew.dataSource = dataSouce;
        biew.delegate = dataSouce;
        dataSouce.owner = self.owner;
        self.datasouce  = dataSouce;
    }else
    {
        
        NSAssert([bindView isKindOfClass:UICollectionView.class]||[bindView isKindOfClass:UITableView.class], @"bindView 必须是tableview或者collectionview");
    }
   
    
}
@end
