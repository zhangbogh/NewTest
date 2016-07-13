//
//  KINGTest7ViewController.m
//  NewTest
//
//  Created by 王旭 on 16/5/16.
//  Copyright © 2016年 pitt. All rights reserved.
//

#import "KINGTest7ViewController.h"
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface KINGTest7ViewController ()

@end

@implementation KINGTest7ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//  TextOneViewController.m
//  TCFExamTextOne
//
//  Created by apple on 13-7-13.
//  Copyright (c) 2013年 apple. All rights reserved.
//









- (IBAction)DidSearch:(id)sender
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory ,  NSUserDomainMask ,  YES );
    NSString* documentPath = [ paths objectAtIndex: 0 ];
    
    NSString* dbPath = [ documentPath stringByAppendingPathComponent: @"TCFexam.db" ];
    
    FMDatabase* database = [ FMDatabase databaseWithPath: dbPath ];
    if ( ![ database open ] )
    {
        return;
    }
    
    // 查找表 AllTheQustions
    FMResultSet* resultSet = [ database executeQuery: @"select * from AllTheQustions" ];
    
    // 逐行读取数据
    while ( [ resultSet next ] )
    {
        // 对应字段来取数据
        NSString* history = [ resultSet stringForColumn: @"History" ];
        NSString* question = [ resultSet stringForColumn: @"Question" ];
        NSLog( @"history: %@ , question: %@" , history , question );
    }
    
    [ database close ];
    
    
}


@end
