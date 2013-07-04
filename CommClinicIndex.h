//
//  CommClinicIndex.h
//  TestTableView
//
//  Created by wellsnake on 13-7-4.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommClinicIndex : NSObject
@property (nonatomic, strong) NSString *deptName;//科室名称
@property (nonatomic, strong) NSMutableArray *clinicDate;//开诊时间
- (id)initWithItem:(NSDictionary *)item;
@end
