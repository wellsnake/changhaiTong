//
//  SpecialClinicIndexList.h
//  TestTableView
//
//  Created by wellsnake on 13-7-3.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

@interface SpecialClinicIndexList : NSObject
@property (nonatomic, strong) NSString *deptName;
@property (nonatomic, strong) NSMutableArray *clinicIndexList;
- (id)initWithArray:(NSMutableArray *)list;
@end
