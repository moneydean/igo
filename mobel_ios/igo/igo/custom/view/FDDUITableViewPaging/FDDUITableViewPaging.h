//
//  FDDUITableViewPaging.h
//  papm
//
//  Created by dean on 13-11-19.
//  Copyright (c) 2013年 pingan. All rights reserved.
//
//  分页查询的表格

#import <UIKit/UIKit.h>
#import "SVPullToRefresh.h"

/**
 *\brief
 *重载表格之后的block
 */
typedef void (^AfterReloadTableViewBlock)(void);

@interface FDDUITableViewPaging : UITableView

/**
 *\brief
 *记录总条数，分页查询从数据库中count出来的
 */
@property (assign,nonatomic) int totalRecordCount;

/**
 *\brief
 *实际记录总条数，目前查出到前台的所有记录条数
 */
@property (assign,nonatomic) int actualTotalRecordCount;

/**
 *\brief
 *每页记录条数
 */
@property (assign,nonatomic,readonly) int everyPageRecordCount;

/**
 *\brief
 *当前第几页
 */
@property (assign,nonatomic,readonly) int currentPage;

/**
 *\brief
 *最大页面数量
 */
@property (assign,nonatomic,readonly) int maxPage;

/**
 *\brief
 *当前页的条数
 */
@property (assign,nonatomic,readonly) int currentPageRecordCount;


#pragma mark 能算出总页数，无block，表格数据源为追加模式
/**
 *\brief
 *返回的数据如果能算出总页数的情况，使用该方法
 */
- (void)setPageingWithTotolRecordCount:(int)totalRecordCount
                 currentPageDataSource:(NSArray *)currentPageDataSource
                   tableViewDataSource:(NSMutableArray *)tableViewDataSource;


#pragma mark 能算出总页数，有block，表格数据源为追加模式
/**
 *\brief
 *返回的数据如果能算出总页数的情况，使用该方法
 *增加了重载表格数据之后运行block
 */
- (void)setPageingWithTotolRecordCount:(int)totalRecordCount
                 currentPageDataSource:(NSArray *)currentPageDataSource
                   tableViewDataSource:(NSMutableArray *)tableViewDataSource
             afterReloadTableViewBlock:(AfterReloadTableViewBlock)afterReloadTableViewBlock;


#pragma mark 能算出总页数，无block，表格数据源为替换模式
/**
 *\brief
 *返回的数据如果能算出总页数的情况，使用该方法
 */
- (void)setPageingWithAllDataSource:(int)totalRecordCount
              currentPageDataSource:(NSArray *)currentPageDataSource
                      newDataSource:(NSArray *)newDataSource
                tableViewDataSource:(NSMutableArray *)tableViewDataSource;


#pragma mark 能算出总页数，有block，表格数据源为替换模式
/**
 *\brief
 *返回的数据如果能算出总页数的情况，使用该方法
 *增加了重载表格数据之后运行block
 */
- (void)setPageingWithTotolRecordCount:(int)totalRecordCount
                 currentPageDataSource:(NSArray *)currentPageDataSource
                         newDataSource:(NSArray *)newDataSource
                   tableViewDataSource:(NSMutableArray *)tableViewDataSource
             afterReloadTableViewBlock:(AfterReloadTableViewBlock)afterReloadTableViewBlock;



#pragma mark 无法计算出总页数，无block，表格数据源为追加模式
/**
 *\brief
 *返回的数据，不清楚总页数的情况下，使用该方法
 */
- (void)setPageingOnlyDataSource:(NSArray *)currentPageDataSource
             tableViewDataSource:(NSMutableArray *)tableViewDataSource;


#pragma mark 无法计算出总页数，有block，表格数据源为追加模式
/**
 *\brief
 *返回的数据，不清楚总页数的情况下，使用该方法
 *增加了重载表格数据之后运行block
 */
- (void)setPageingOnlyDataSource:(NSArray *)currentPageDataSource
             tableViewDataSource:(NSMutableArray *)tableViewDataSource
       afterReloadTableViewBlock:(AfterReloadTableViewBlock)afterReloadTableViewBlock;


#pragma mark 无法计算出总页数，无block，表格数据源为替换模式
/**
 *\brief
 *返回的数据，不清楚总页数的情况下，使用该方法
 */
- (void)setPageingOnlyDataSource:(NSArray *)currentPageDataSource
                   newDataSource:(NSArray *)newDataSource
             tableViewDataSource:(NSMutableArray *)tableViewDataSource;


#pragma mark 无法计算出总页数，有block，表格数据源为替换模式
/**
 *\brief
 *返回的数据，不清楚总页数的情况下，使用该方法
 *增加了重载表格数据之后运行block
 */
- (void)setPageingOnlyDataSource:(NSArray *)currentPageDataSource
                   newDataSource:(NSArray *)newDataSource
             tableViewDataSource:(NSMutableArray *)tableViewDataSource
       afterReloadTableViewBlock:(AfterReloadTableViewBlock)afterReloadTableViewBlock;


/**
 *\brief
 *下拉刷新之前，用来重置我们分页的数据，例如清空列表，重置起始页
 */
- (void)reloadPageingViewAndDataSource:(NSMutableArray *)tableViewDataSource;


/**
 *\brief
 *停止下拉的动画
 */
- (void)stopPullAnimating;


/**
 *\brief
 *停止上推的动画
 */
- (void)stopInfiniteAnimating;

@end
