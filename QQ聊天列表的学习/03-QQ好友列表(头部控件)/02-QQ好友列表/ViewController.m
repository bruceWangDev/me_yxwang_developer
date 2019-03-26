//
//  ViewController.m
//  02-QQ好友列表
//
//  Created by brucewang on 2019/3/19.
//  Copyright © 2019 brucewang. All rights reserved.
//

#import "ViewController.h"
#import "FriendGroup.h"
#import "Friend.h"
#import "HeadView.h"
#import "FriendCell.h"

@interface ViewController () <HeadViewDelegate>

@property (nonatomic, strong) NSArray * groups;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)groups {
    
    if (_groups == nil) {
       
        NSString * path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
        NSArray  * dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * groupArrays = [[NSMutableArray alloc] init];
        for (NSDictionary * dict in dictArray) {
            
            FriendGroup * fg = [FriendGroup groupWithDict:dict];
            [groupArrays addObject:fg];
        }
        _groups = groupArrays;
    }
    return _groups;
}

- (BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
//    self.groups; // 这样就等于调用了一下 get 方法 ..
    self.tableView.sectionHeaderHeight = 50; // 每一组头部控件的高度
    
}

#pragma mark - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    FriendGroup * fg = self.groups[section];
    return fg.isOpend ? fg.friends.count : 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FriendCell * cell = [FriendCell cellWithTableView:tableView];
    
    // 设置数据源
    FriendGroup * fg = self.groups[indexPath.section];
    Friend * fd = fg.friends[indexPath.row];

    cell.fd = fd;
    
    return cell;
}

/**
 返回每一组需要显示的头部标题(字符串)
 */
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//
//    FriendGroup * fg = self.groups[section];
//    return fg.name;
//
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    HeadView * headV = [HeadView headViewWithTableView:tableView]; // 位置和尺寸不用关心 或者说只设置高度就行 它的宽度永远是 tableView 的宽度
    
    headV.delegate = self;
    
    // 2.传递模型
    FriendGroup * fg = self.groups[section];
    headV.fg = fg;
    
    return headV;
}

#pragma mark - delegate
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//    return 44;
//
//}

#pragma mark - head delegate
- (void)headViewDidClickedName:(HeadView *)headView {
    
    [self.tableView reloadData];
    
}

@end
