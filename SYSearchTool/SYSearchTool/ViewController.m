//
//  ViewController.m
//  SYSearchTool
//
//  Created by FaceBook on 2018/11/14.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "ViewController.h"
#import "SYTableViewCell.h"
#import "SYSearchTool.h"
#import <Masonry.h>
#import <MJExtension.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate,UISearchResultsUpdating>
@property(nonatomic,strong)UITableView *listTableView;
@property(nonatomic,strong)UISearchController *searchController;
@property(nonatomic,strong)NSMutableArray *lists;
@property(nonatomic,strong)NSMutableArray *souce;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configView];
    [self loadDataSoucre];
}

-(void)configView{
    
    _listTableView = ({
        UITableView *iv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];;
        [self.view addSubview:iv];
        iv.showsVerticalScrollIndicator =NO;
        iv.showsHorizontalScrollIndicator =NO;
        iv.separatorStyle = UITableViewCellSeparatorStyleNone;
        iv.dataSource = self;
        iv.delegate = self;
        iv.estimatedSectionFooterHeight = 0;
        iv.estimatedSectionHeaderHeight = 0;
        iv.rowHeight = 44.0f;
        iv.backgroundColor =[UIColor whiteColor];
        iv.tableFooterView  =[UIView new];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
        iv;
    });
    
    _searchController = ({
        UISearchController *iv = [[UISearchController alloc]initWithSearchResultsController:nil];
        iv.delegate = self;
        iv.searchResultsUpdater= self;
        iv.searchBar.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 44);
        iv.searchBar.placeholder =  @"您可以通过股票名称，简拼或代码进行查询";
        iv.dimsBackgroundDuringPresentation = NO;
        iv.obscuresBackgroundDuringPresentation = NO;
        iv.hidesNavigationBarDuringPresentation = NO;
        self.listTableView.tableHeaderView = iv.searchBar;
        iv;
    });
}

-(void)loadDataSoucre{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"search" ofType:@"plist"];
    NSArray *fileArray = [NSArray arrayWithContentsOfFile:path];
    self.lists = [SYModel mj_objectArrayWithKeyValuesArray:fileArray];
    [self.listTableView reloadData];
}


#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchController.active) {
        return self.souce.count;
    }else{
        return self.lists.count;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SYTableViewCell *cell = [SYTableViewCell CellWithTableView:tableView];
    if (self.searchController.active) {
        [cell InitDataWithModel:self.souce[indexPath.row]];
    }else{
        [cell InitDataWithModel:self.lists[indexPath.row]];
    }
    return cell;
}

#pragma mark 适配ios11
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",indexPath);
}

#pragma mark UISearchControllerDelegate,UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    self.souce = (NSMutableArray *)[[SYSearchTool tool] searchWithFieldArray:@[@"name",@"pingyin",@"code"]
                                                                 inputString:searchController.searchBar.text
                                                                     inArray:self.lists];
    [self.listTableView reloadData];
}
@end
