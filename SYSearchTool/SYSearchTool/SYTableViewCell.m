//
//  SYTableViewCell.m
//  SYSearchTool
//
//  Created by FaceBook on 2018/11/14.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import "SYTableViewCell.h"

@implementation SYTableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview{
    static NSString *ID = @"SYTableViewCell";
    SYTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SYTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle              = UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
    }
    return self;
}

-(void)InitDataWithModel:(SYModel *)model{
    self.textLabel.text = model.name;
    self.detailTextLabel.text = model.code;
}

@end
