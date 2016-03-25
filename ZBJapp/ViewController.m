//
//  ViewController.m
//  ZBJapp
//
//  Created by 范茂羽 on 16/3/24.
//  Copyright © 2016年 范茂羽. All rights reserved.
//

#import "ViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "ZBJCell.h"
#import "PrjModel.h"

#define ZBJCellID @"ZBJCellID"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)NSMutableArray *dataArray;


@end

@implementation ViewController

-(NSMutableArray *)dataArray
{
    if(!_dataArray)
    {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSString *cql = [NSString stringWithFormat:@"select * from %@ limit 100", @"table_prjList"];
    
    [AVQuery doCloudQueryInBackgroundWithCQL:cql callback:^(AVCloudQueryResult *result, NSError *error)
     {
         NSArray *array = result.results;
         
         for(AVObject *obj in array)
         {
             
             NSString *price = [obj objectForKey:@"price"];
             NSString *title = [obj objectForKey:@"title"];
             NSString *introduce = [obj objectForKey:@"introduce"];
             PrjModel *model = [[PrjModel alloc]init];
             model.price = price;
             model.title = title;
             model.introduce = introduce;
             
             [self.dataArray addObject:model];
         }
         
         [self.tableView reloadData];
     }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return self.dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZBJCell *cell = [tableView dequeueReusableCellWithIdentifier:ZBJCellID];
    PrjModel *model = self.dataArray[indexPath.section];
    [cell configUI:model];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return .1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return [ZBJCell heightForCell:self.dataArray[indexPath.section]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
