//
//  SpecialClinicindex.h
//  TestTableView
//
//  Created by wellsnake on 13-7-2.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//


@interface SpecialClinicIndex : NSObject
@property (nonatomic, strong) NSString *deptName;//科室名称
@property (nonatomic, strong) NSArray *clinicDate;//开诊时间
@property (nonatomic, strong) NSString *clinicName;//专病号名称
- (id)initWithItem:(NSDictionary *)item;
@end
