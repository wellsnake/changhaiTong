//
//  CommClinicIndex.m
//  TestTableView
//
//  Created by wellsnake on 13-7-4.
//  Copyright (c) 2013年 wellsnake. All rights reserved.
//

#import "CommClinicIndex.h"

@implementation CommClinicIndex
-(id)initWithItem:(NSDictionary *)item
{
    self = [super init];
    if (self)
    {
        _deptName = item[@"dept_name"];
        _clinicDate = [[NSMutableArray alloc] init];
        NSArray *array = [item[@"schedule_desc"] componentsSeparatedByString:@","];
        for (int i = 0;i < array.count; i++)
        {
            NSString *clinicDate = [self getClinicDateChineseName:i];
            if ([array[i] isEqualToString:@"1"])
            {
                [_clinicDate addObject:clinicDate];
            }
        }
    }
    return self;
}

-(NSString *)getClinicDateChineseName:(int) date
{
    if (date == 0)
    {
        return @"星期一上午";
    }else if (date == 1)
    {
        return @"星期一下午";
    }
    else if (date == 2)
    {
        return @"星期二上午";
    }
    else if (date == 3)
    {
        return @"星期二下午";
    }
    else if (date == 4)
    {
        return @"星期三上午";
    }
    else if (date == 5)
    {
        return @"星期三下午";
    }
    else if (date == 6)
    {
        return @"星期四上午";
    }
    else if (date == 7)
    {
        return @"星期四下午";
    }
    else if (date == 8)
    {
        return @"星期五上午";
    }
    else if (date == 9)
    {
        return @"星期五下午";
    }
    else if (date == 10)
    {
        return @"星期六上午";
    }
    else if (date == 11)
    {
        return @"星期六下午";
    }
    else if (date == 12)
    {
        return @"星期日上午";
    }
    else if (date == 13)
    {
        return @"星期日下午";
    }
    else
    {
        return @"err";
    }
}
@end
