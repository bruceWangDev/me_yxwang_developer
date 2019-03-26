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

@interface ViewController ()

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

- (void)viewDidLoad {

    [super viewDidLoad];
    
//    self.groups; // 这样就等于调用了一下 get 方法 ..
    
    
}

#pragma mark - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    FriendGroup * fg = self.groups[section];
    return fg.friends.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * ID = @"friendcell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 设置数据源
    FriendGroup * fg = self.groups[indexPath.section];
    Friend * f = fg.friends[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:f.icon];
    cell.textLabel.text  = f.name;
    cell.detailTextLabel.text = f.intro;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    FriendGroup * fg = self.groups[section];
    return fg.name;
    
}

@end
