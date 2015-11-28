


//
//  OrdCarDetailViewController.m
//  BaseProject
//
//  Created by mis on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "OrdCarDetailViewController.h"
#import "OldCarViewModel.h"
#import "OldDetailCell.h"
#import "TuiJuviewController.h"
@interface OrdCarDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) OldCarViewModel* oldCarVM;
@property (nonatomic,strong)UITableView* tableView;
@end

@implementation OrdCarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.name;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.oldCarVM getDataFromNetCompleteHandle:^(NSError *error) {
           [self.tableView.header endRefreshing];
           [self.tableView reloadData];
       }];
    }];
    [self.tableView.header beginRefreshing];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[OldDetailCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}

-(OldCarViewModel *)oldCarVM{
    if (!_oldCarVM) {
        _oldCarVM = [[OldCarViewModel alloc]initWithSign:self.sign Brandid:self.brandid];
    }
    return _oldCarVM;
}
kRemoveCellSeparator
#pragma mark - UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.oldCarVM.rowNumber;
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OldDetailCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.imageview setImageWithURL:[self.oldCarVM getImgURLForRow:indexPath.row]];
    cell.SeriesidLb.text = [self.oldCarVM getSeriesidForRow:indexPath.row];
    cell.SpacenameLb.text = [self.oldCarVM getSpaceNameForRow:indexPath.row];
    cell.registraiondate.text = [self.oldCarVM getregistraiondateForRow:indexPath.row];
    cell.priceLb.text = [self.oldCarVM getPriceForRow:indexPath.row];
    cell.pdataLb.text = [self.oldCarVM getpdataForRow:indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TuiJuviewController* vc = [[TuiJuviewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 75;
};



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
