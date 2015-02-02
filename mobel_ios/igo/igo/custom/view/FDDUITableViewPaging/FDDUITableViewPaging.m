//
//  HPUITableViewPaging.m
//  papm
//
//  Created by dean on 13-11-19.
//  Copyright (c) 2013年 pingan. All rights reserved.
//

#import "FDDUITableViewPaging.h"

@implementation FDDUITableViewPaging
@synthesize totalRecordCount = _totalRecordCount;
@synthesize actualTotalRecordCount = _actualTotalRecordCount;
@synthesize everyPageRecordCount = _everyPageRecordCount;
@synthesize currentPage = _currentPage;
@synthesize maxPage = _maxPage;
@synthesize currentPageRecordCount = _currentPageRecordCount;

/**
 *初始化分页的相关数据
 */
- (void)initPageingProperty
{
    _everyPageRecordCount = 10;//每页条数
    _totalRecordCount = 0;
    _actualTotalRecordCount = 0;
    _currentPage = 0;
    _maxPage = 0;
    _currentPageRecordCount = 0;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self initPageingProperty];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initPageingProperty];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initPageingProperty];
    }
    return self;
}

- (void)awakeFromNib
{
    [self initPageingProperty];
}


#pragma mark 能算出总页数，无block，表格数据源为追加模式
/**
 *\brief
 *返回的数据如果能算出总页数的情况，使用该方法
 */
- (void)setPageingWithTotolRecordCount:(int)totalRecordCount
                 currentPageDataSource:(NSArray *)currentPageDataSource
                   tableViewDataSource:(NSMutableArray *)tableViewDataSource
{
    NSAssert(tableViewDataSource, @"tableViewDataSource can not be nil");
    if (currentPageDataSource == nil || currentPageDataSource.count == 0) {//查出来的数据已经为空了，表明没有新数据了，将上拉关闭
        self.showsInfiniteScrolling = NO;
        [self stopPullAnimating];
        [self stopInfiniteAnimating];
    }else{
        [tableViewDataSource addObjectsFromArray:currentPageDataSource];
        _totalRecordCount = totalRecordCount;
        _maxPage = _totalRecordCount%_everyPageRecordCount == 0 ? _totalRecordCount/_everyPageRecordCount : (_totalRecordCount/_everyPageRecordCount)+1;
        _actualTotalRecordCount = (int)tableViewDataSource.count;
        _currentPageRecordCount = (int)currentPageDataSource.count;
        _currentPage++;
        [self reloadData];
        [self stopPullAnimating];
        [self stopInfiniteAnimating];
        if (_currentPage == _maxPage || _currentPage > _maxPage) {
            self.showsInfiniteScrolling = NO;
        }
    }
}


#pragma mark 能算出总页数，有block，表格数据源为追加模式
/**
 *\brief
 *返回的数据如果能算出总页数的情况，使用该方法
 *增加了重载表格数据之后运行block
 */
- (void)setPageingWithTotolRecordCount:(int)totalRecordCount
                 currentPageDataSource:(NSArray *)currentPageDataSource
                   tableViewDataSource:(NSMutableArray *)tableViewDataSource
             afterReloadTableViewBlock:(AfterReloadTableViewBlock)afterReloadTableViewBlock
{
    [self setPageingWithTotolRecordCount:totalRecordCount currentPageDataSource:currentPageDataSource tableViewDataSource:tableViewDataSource];
    afterReloadTableViewBlock();
}


#pragma mark 能算出总页数，无block，表格数据源为替换模式
/**
 *\brief
 *返回的数据如果能算出总页数的情况，使用该方法
 */
- (void)setPageingWithAllDataSource:(int)totalRecordCount
              currentPageDataSource:(NSArray *)currentPageDataSource
                      newDataSource:(NSArray *)newDataSource
                tableViewDataSource:(NSMutableArray *)tableViewDataSource
{
    NSAssert(tableViewDataSource, @"tableViewDataSource can not be nil");
    if (currentPageDataSource == nil || currentPageDataSource.count == 0) {//查出来的数据已经为空了，表明没有新数据了，将上拉关闭
        self.showsInfiniteScrolling = NO;
        [self stopPullAnimating];
        [self stopInfiniteAnimating];
    }else{
        [tableViewDataSource removeAllObjects];
        [tableViewDataSource addObjectsFromArray:newDataSource];
        _totalRecordCount = totalRecordCount;
        _maxPage = _totalRecordCount%_everyPageRecordCount == 0 ? _totalRecordCount/_everyPageRecordCount : (_totalRecordCount/_everyPageRecordCount)+1;
        _actualTotalRecordCount = (int)tableViewDataSource.count;
        _currentPageRecordCount = (int)currentPageDataSource.count;
        _currentPage++;
        [self reloadData];
        [self stopPullAnimating];
        [self stopInfiniteAnimating];
        if (_currentPage == _maxPage || _currentPage > _maxPage) {
            self.showsInfiniteScrolling = NO;
        }
    }
}


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
             afterReloadTableViewBlock:(AfterReloadTableViewBlock)afterReloadTableViewBlock
{
    [self setPageingWithAllDataSource:totalRecordCount currentPageDataSource:currentPageDataSource newDataSource:newDataSource tableViewDataSource:tableViewDataSource];
    afterReloadTableViewBlock();
}


#pragma mark 无法计算出总页数，无block，表格数据源为追加模式
/**
 *\brief
 *返回的数据，不清楚总页数的情况下，使用该方法
 */
- (void)setPageingOnlyDataSource:(NSArray *)currentPageDataSource
             tableViewDataSource:(NSMutableArray *)tableViewDataSource
{
    NSAssert(tableViewDataSource, @"tableViewDataSource can not be nil");
    if (currentPageDataSource == nil || currentPageDataSource.count == 0) {
        self.showsInfiniteScrolling = NO;
        [self stopPullAnimating];
        [self stopInfiniteAnimating];
    }else{
        [tableViewDataSource addObjectsFromArray:currentPageDataSource];
        _actualTotalRecordCount = (int)tableViewDataSource.count;
        _currentPageRecordCount = (int)currentPageDataSource.count;
        _currentPage++;
        [self reloadData];
        [self stopPullAnimating];
        [self stopInfiniteAnimating];
        if (_currentPageRecordCount<_everyPageRecordCount) {
            self.showsInfiniteScrolling = NO;
        }
    }
}


#pragma mark 无法计算出总页数，有block，表格数据源为追加模式
/**
 *\brief
 *返回的数据，不清楚总页数的情况下，使用该方法
 *增加了重载表格数据之后运行block
 */
- (void)setPageingOnlyDataSource:(NSArray *)currentPageDataSource
             tableViewDataSource:(NSMutableArray *)tableViewDataSource
       afterReloadTableViewBlock:(AfterReloadTableViewBlock)afterReloadTableViewBlock
{
    [self setPageingOnlyDataSource:currentPageDataSource tableViewDataSource:tableViewDataSource];
    afterReloadTableViewBlock();
}

#pragma mark 无法计算出总页数，无block，表格数据源为替换模式
/**
 *\brief
 *返回的数据，不清楚总页数的情况下，使用该方法
 */
- (void)setPageingOnlyDataSource:(NSArray *)currentPageDataSource
                   newDataSource:(NSArray *)newDataSource
             tableViewDataSource:(NSMutableArray *)tableViewDataSource
{
    NSAssert(tableViewDataSource, @"tableViewDataSource can not be nil");
    if (currentPageDataSource == nil || currentPageDataSource.count == 0) {
        self.showsInfiniteScrolling = NO;
        [self stopPullAnimating];
        [self stopInfiniteAnimating];
    }else{
        [tableViewDataSource removeAllObjects];
        [tableViewDataSource addObjectsFromArray:newDataSource];
        _actualTotalRecordCount = (int)tableViewDataSource.count;
        _currentPageRecordCount = (int)currentPageDataSource.count;
        _currentPage++;
        [self reloadData];
        [self stopPullAnimating];
        [self stopInfiniteAnimating];
        if (_currentPageRecordCount<_everyPageRecordCount) {
            self.showsInfiniteScrolling = NO;
        }
    }
}


#pragma mark 无法计算出总页数，有block，表格数据源为替换模式
/**
 *\brief
 *返回的数据，不清楚总页数的情况下，使用该方法
 *增加了重载表格数据之后运行block
 */
- (void)setPageingOnlyDataSource:(NSArray *)currentPageDataSource
                   newDataSource:(NSArray *)newDataSource
             tableViewDataSource:(NSMutableArray *)tableViewDataSource
       afterReloadTableViewBlock:(AfterReloadTableViewBlock)afterReloadTableViewBlock
{
    [self setPageingOnlyDataSource:currentPageDataSource newDataSource:newDataSource tableViewDataSource:tableViewDataSource];
    afterReloadTableViewBlock();
}


/**
 *\brief
 *下拉刷新之前，用来重置我们分页的数据，例如清空列表，重置起始页
 */
- (void)reloadPageingViewAndDataSource:(NSMutableArray *)tableViewDataSource
{
    NSAssert(tableViewDataSource, @"tableViewDataSource can not be nil");
    _currentPage = 0;
    _actualTotalRecordCount = 0;
    _totalRecordCount = 0;
    _maxPage = 0;
    _currentPageRecordCount = 0;
    [tableViewDataSource removeAllObjects];
    [self reloadData];
    self.showsInfiniteScrolling = YES;
}


/**
 *\brief
 *停止下拉的动画
 */
- (void)stopPullAnimating
{
    if (self.pullToRefreshView.state != SVPullToRefreshStateStopped) {
        [self.pullToRefreshView stopAnimating];
    }
}


/**
 *\brief
 *停止上推的动画
 */
- (void)stopInfiniteAnimating
{
    if (self.infiniteScrollingView.state != SVInfiniteScrollingStateStopped) {
        [self.infiniteScrollingView stopAnimating];
    }
}

@end
