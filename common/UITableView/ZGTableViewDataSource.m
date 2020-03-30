//
//  ZGTableViewDataSource.m
//  listDemo
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ZGTableViewDataSource.h"
#import "ZGListInfo.h"
#import "UIResponder+Router.h"
@interface ZGTableViewDataSource()

@end
@implementation ZGTableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ZGTableViewSectionInfo *model = self.dataArray[section];
    
    return model.iteamArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZGTableViewSectionInfo *model = self.dataArray[indexPath.row];

    ZGTableViewIteamInfo *iteaminfo =model.iteamArray[indexPath.row];
    
    NSString *cellIdentifer = @"UITableViewCell";
    
    if (iteaminfo.Identifier.length>0) {
        cellIdentifer =iteaminfo.Identifier;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[NSClassFromString(cellIdentifer) alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.ZGModel = model;
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    ZGTableViewSectionInfo *model = self.dataArray[section];
    
    ZGTableViewIteamInfo *info =(ZGTableViewIteamInfo *) model.headinfo;
    ZGBaseTableviewFramInfo *framInfo = info.framInfo;
    
   

    return framInfo.cellH;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    ZGTableViewSectionInfo *model = self.dataArray[section];
       
       ZGTableViewIteamInfo *info =(ZGTableViewIteamInfo *) model.footInfo;
       ZGBaseTableviewFramInfo *framInfo = info.framInfo;
       
      

    return framInfo.cellH;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZGTableViewSectionInfo *model = self.dataArray[indexPath.section];
    
  ZGTableViewIteamInfo *infoModel =   model.iteamArray[indexPath.row];
    
    ZGBaseTableviewFramInfo *framInfo = (ZGBaseTableviewFramInfo *)infoModel;

    return framInfo.cellH;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ZGTableViewSectionInfo *model = self.dataArray[section];

    NSString *footIdentifer = @"UITableViewHeaderFooterView";
       if (model.footInfo.Identifier.length>0) {
           footIdentifer = model.footInfo.Identifier;
       }
    
    UITableViewHeaderFooterView *head = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footIdentifer];
    if (!head) {
        head = [[NSClassFromString(footIdentifer) alloc]initWithReuseIdentifier:footIdentifer];
    }
    head.ZGModel =model;
    return head;
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    ZGTableViewSectionInfo *model = self.dataArray[section];
    NSString *footIdentifer = @"UITableViewHeaderFooterView";
    if (model.footInfo.Identifier.length>0) {
        footIdentifer = model.footInfo.Identifier;
    }

    UITableViewHeaderFooterView *foot = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footIdentifer];
    if (!foot) {
        foot = [[NSClassFromString(footIdentifer) alloc]initWithReuseIdentifier:model.footInfo.Identifier];
    }
    foot.ZGModel =model;
    return foot;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZGTableViewSectionInfo *model = self.dataArray[indexPath.row];

    ZGTableViewIteamInfo *iteaminfo =model.iteamArray[indexPath.row];
    
    if ([self.owner respondsToSelector:@selector(routerEventWithName:userInfo:)]) {
          [self.owner routerEventWithName:@"cellClick" userInfo:@{@"model":iteaminfo}];
      }
}

@end
