//
//  MyCustomCell.h
//  ScrollViewAutoLayoutTest
//
//  Created by wdj on 15/1/28.
//  Copyright (c) 2015年 Grey. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kRequestIcon @"RequestIcon"
#define kRequestContent @"RequestContent"

@interface MyCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *content;

- (void)updateCellContentWith:(NSDictionary *)dic;

@end
