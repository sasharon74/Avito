//
//  TableViewControllerTests.m
//  AvitoTest
//
//  Created by Alex on 19.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ITunesViewController.h"
#import "GitHubViewController.h"

#import "TableDataSource.h"

@interface TableViewControllerTests : XCTestCase

@property (nonatomic, strong) ITunesViewController *itunesTableViewController;
@property (nonatomic, strong) GitHubViewController *githubTableViewController;

@end

@implementation TableViewControllerTests

- (void)setUp {
    [super setUp];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ITunesStoryboard" bundle: nil];
    self.itunesTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"itunes_view_id"];
    
    storyboard = [UIStoryboard storyboardWithName:@"GitHubStoryboard" bundle: nil];
    self.githubTableViewController = [storyboard instantiateViewControllerWithIdentifier:@"github_view_id"];
    
    UIView *view = self.githubTableViewController.view;
    view = self.itunesTableViewController.view;
}

- (void)tearDown {
    
    self.itunesTableViewController = nil;
    self.githubTableViewController = nil;
    
    [super tearDown];
}

- (void)testThatViewLoads{
    
    XCTAssertNotNil(self.itunesTableViewController.view);
    XCTAssertNotNil(self.githubTableViewController.view);
}

- (void)testParentViewHasTableViewSubview{
    
    NSArray *subviews = self.itunesTableViewController.view.subviews;
    XCTAssertTrue([subviews containsObject:self.itunesTableViewController.itunesTableView]);
    
    subviews = self.githubTableViewController.view.subviews;
    XCTAssertTrue([subviews containsObject:self.githubTableViewController.gitHubTableView]);
}


- (void)testThatObjectConformsToUITableViewDataSource{
    XCTAssertTrue([TableDataSource conformsToProtocol:@protocol(UITableViewDataSource) ],
                  @"TableDataSource does not conform to UITableView datasource protocol");
}

- (void)testThatTablesHaveDataSource{
    
    XCTAssertNotNil(self.itunesTableViewController.itunesTableView.dataSource);
    XCTAssertNotNil(self.githubTableViewController.gitHubTableView.dataSource);
    
    XCTAssertTrue([self.itunesTableViewController.itunesTableView.dataSource isKindOfClass:[TableDataSource class]]);
    XCTAssertTrue([self.githubTableViewController.gitHubTableView.dataSource isKindOfClass:[TableDataSource class]]);
}

- (void)testTableViewHeightForRowAtIndexPath{
    CGFloat expectedHeight = 131.0;
    CGFloat actualHeight = self.githubTableViewController.gitHubTableView.rowHeight;
    XCTAssertEqual(expectedHeight, actualHeight, @"Cell should have %f height, but they have %f", expectedHeight, actualHeight);
}

- (void)testTableViewCellCreateCellsWithReuseIdentifier{
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    UITableViewCell *cell = [self.vc tableView:self.vc.tableView cellForRowAtIndexPath:indexPath];
//    NSString *expectedReuseIdentifier = [NSString stringWithFormat:@"%ld/%ld",(long)indexPath.section,(long)indexPath.row];
//    XCTAssertTrue([cell.reuseIdentifier isEqualToString:expectedReuseIdentifier], @"Table does not create reusable cells");
}

- (void)testClassConformToSearchTableViewConrollerProtocol{
    
    XCTAssertTrue([self.githubTableViewController conformsToProtocol:@protocol(SearchTableViewConrollerProtocol)],
                  @"Class does not conform to SearchTableViewConrollerProtocol protocol");
    XCTAssertTrue([self.itunesTableViewController conformsToProtocol:@protocol(SearchTableViewConrollerProtocol)],
                  @"Class does not conform to SearchTableViewConrollerProtocol protocol");
}


@end
