//
//  ViewController.m
//  ScrollViewAutoLayoutTest
//
//  Created by wdj on 15/1/27.
//  Copyright (c) 2015年 Grey. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomCell.h"

@interface ViewController ()
@property (nonatomic,strong) NSMutableArray *testArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupViews];
}

- (void)setupViews{
    _testArray = [@[] mutableCopy];
    for (int i = 0; i < 100; i++) {
        NSDictionary *dic = @{kRequestContent:[NSString stringWithFormat:@"[%d]看清了很多人，却不能随意拆穿；讨厌着很多人，却又不能轻易翻脸。有时候，生活就是要逼自己变得逆来顺受，宠辱不惊.",i],kRequestIcon:@"http://img0.bdstatic.com/img/image/shouye/sheying0128.jpg"};
        [_testArray addObject:dic];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _testArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *CellIdentifier = @"MyCustomCell";
     MyCustomCell *cell = (MyCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     if (cell == nil) {
         NSArray *array = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
         cell = [array objectAtIndex:0];
     }
     NSDictionary *dic = [_testArray objectAtIndex:indexPath.row];
     [cell updateCellContentWith:dic];
     if(_iTableView.frame.size.height != _iTableView.contentSize.height)
     {
         CGRect newFrame = _iTableView.frame;
         newFrame.size = _iTableView.contentSize;
         _iTableView.frame = newFrame;
         _iScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, _iTableView.frame.origin.y + newFrame.size.height);
         
     }
     return cell;
}
@end
