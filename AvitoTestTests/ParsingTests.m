//
//  ParsingTests.m
//  AvitoTest
//
//  Created by Alex on 19.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ParserMediaItem.h"
#import "ParserUser.h"

#import "User.h"
#import "MediaItem.h"

@interface ParsingTests : XCTestCase

@end

@implementation ParsingTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testParsingMediaItemsResponse{
    
    NSDictionary *dict =  @{
                            @"results":  @[@"1", @"2"],
                            @"test":     @"test",
                            };
    
    XCTAssertNotNil([ParserMediaItem parsingJSON:dict]);
    XCTAssertTrue([ParserMediaItem parsingJSON:dict].count > 0);
    
    dict = @{
             @"test":       @"test",
             };
    
    XCTAssertNotNil([ParserMediaItem parsingJSON:dict]);
    XCTAssertTrue([ParserMediaItem parsingJSON:dict].count == 0);
    
    XCTAssertNotNil([ParserMediaItem parsingJSON:nil]);
    XCTAssertTrue([ParserMediaItem parsingJSON:dict].count == 0);
    
}

- (void)testParsingUsersResponse{
    
    NSDictionary *dict =  @{
                            @"items":  @[@"1", @"2"],
                            @"test":     @"test",
                            };
    XCTAssertNotNil([ParserUser parsingJSON:dict]);
    XCTAssertTrue([ParserUser parsingJSON:dict].count > 0);
    
    dict = @{
             @"test":       @"test",
             };
    
    XCTAssertNotNil([ParserUser parsingJSON:dict]);
    XCTAssertTrue([ParserUser parsingJSON:dict].count == 0);
    
    XCTAssertNotNil([ParserUser parsingJSON:nil]);
    XCTAssertTrue([ParserUser parsingJSON:dict].count == 0);
    
}

- (void)testUserModel{
    
    NSDictionary *map =@{
                         @"avatar_url":  @"avatar_url",
                         @"login":       @"login",
                         @"url":         @"url"
                         };
    
    XCTAssertEqualObjects(map, [User mapping]);
}

- (void)testMediaItemsModel{
    
    NSDictionary *map = @{
                          @"artistName":  @"artistName",
                          @"trackName":   @"trackName",
                          @"artworkUrl100":         @"artworkUrl100"
                          };
    
    XCTAssertEqualObjects(map, [MediaItem mapping]);
}


@end
