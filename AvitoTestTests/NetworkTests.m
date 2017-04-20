//
//  NetworkRequestsSenderTests.m
//  AvitoTest
//
//  Created by Alex on 13.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MediaItemsRequest.h"
#import "APIClient.h"
#import "MediaItemsResponse.h"
#import "MediaItem.h"

#import "User.h"
#import "UsersRequest.h"
#import "UsersResponse.h"

#import "SimpleAPIResponse.h"
#import "SimpleAPIRequest.h"


@interface NetworkTests : XCTestCase



@end

@implementation NetworkTests

- (void)setUp {
    [super setUp];
    
    
}

- (void)tearDown {
    
    
    [super tearDown];
}

- (void)testITunesDataTask{
    
    XCTestExpectation *expect = [self expectationWithDescription:@"Fetched itunes media items"];
    
    MediaItemsRequest *itemsRequest = [[MediaItemsRequest alloc]init];
    [itemsRequest setSearchStringAttribute:@"Asap Rocky"];
    [[APIClient sharedInstance]getItems:^(MediaItemsResponse *response) {
        XCTAssertNotNil(response);
        
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
            XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", (long)statusCode);
        }
        
        XCTAssertTrue([response.processedResponseObject isKindOfClass:[NSArray class]]);
        XCTAssertTrue([[response.processedResponseObject firstObject] isKindOfClass:[MediaItem class]]);
        
        [expect fulfill];
    } withAPIRequest:itemsRequest];
    [self waitForExpectationsWithTimeout:100 handler:nil];
}

- (void)testGitHubDataTask{
    
    XCTestExpectation *expect = [self expectationWithDescription:@"Fetched github users"];
    
    UsersRequest *itemsRequest = [[UsersRequest alloc]init];
    [itemsRequest setSearchStringAttribute:@"Manchester"];
    [[APIClient sharedInstance]getItems:^(UsersResponse *response) {
        XCTAssertNotNil(response);
        
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
            XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", (long)statusCode);
        }
        
        XCTAssertTrue([response.processedResponseObject isKindOfClass:[NSArray class]]);
        XCTAssertTrue([[response.processedResponseObject firstObject] isKindOfClass:[User class]]);
        
        [expect fulfill];
    } withAPIRequest:itemsRequest];
    [self waitForExpectationsWithTimeout:100 handler:nil];
}

- (void)testThatClassConformToSimpleAPIResponseProtocol{

    SimpleAPIResponse *simpleResponse = [[SimpleAPIResponse alloc]init];
    
    XCTAssertTrue([simpleResponse conformsToProtocol:@protocol(SimpleAPIResponseProtocol)],
                  @"Class does not conform to SimpleAPIResponseProtocol protocol");
}

- (void)testThatClassConformToSimpleAPIRequestProtocol{
    
    SimpleAPIRequest *simpleResponse = [[SimpleAPIRequest alloc]init];
    
    XCTAssertTrue([simpleResponse conformsToProtocol:@protocol(SimpleAPIRequestProtocol)],
                  @"Class does not conform to SimpleAPIRequestProtocol protocol");
}


@end
