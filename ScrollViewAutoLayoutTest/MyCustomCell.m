//
//  MyCustomCell.m
//  ScrollViewAutoLayoutTest
//
//  Created by Gray.Luo on 15/1/28.
//  Copyright (c) 2015年 Grey. All rights reserved.
//

#import "MyCustomCell.h"

@implementation MyCustomCell

- (void)awakeFromNib {
    // Initialization code
    _content.lineBreakMode = NSLineBreakByWordWrapping;
    _content.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)updateCellContentWith:(NSDictionary *)dic{
    NSString *content = [dic objectForKey:kRequestContent];
    _content.text = content;
    // load image with sdwebimage,here ignore it
    NSString *iconUrlStr = [dic objectForKey:kRequestIcon];
    _icon.image = [UIImage imageNamed:@"testIcon"];
}
@end
