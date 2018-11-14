//
//  SYTableViewCell.h
//  SYSearchTool
//
//  Created by FaceBook on 2018/11/14.
//  Copyright © 2018年 FaceBook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface SYTableViewCell : UITableViewCell

+(instancetype)CellWithTableView:(UITableView *)tableview;

-(void)InitDataWithModel:(SYModel *)model;
@end

NS_ASSUME_NONNULL_END
