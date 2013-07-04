//
//  SpecialClinicindex.m
//  TestTableView
//
//  Created by wellsnake on 13-7-2.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

#import "SpecialClinicIndex.h"
@implementation SpecialClinicIndex
-(id)initWithItem:(NSDictionary *)item
{
    self = [super init];
    if (self)
    {
        _deptName = item[@"dept_name"];
        _clinicName = item[@"clinic_name"];
        _clinicDate = [item[@"schedule_desc"] componentsSeparatedByString:@"、"];
    }
    return self;
}
@end
