//
//  RequestsTest.m
//  AvitoTest
//
//  Created by Alex on 19.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MediaItemsRequest.h"
#import "MediaItemsResponse.h"
#import "MediaItem.h"

#import "User.h"
#import "UsersRequest.h"
#import "UsersResponse.h"

#import "SimpleAPIResponse.h"
#import "SimpleAPIRequest.h"

#import "JSONAPIRequest.h"
#import "ITunesJSONRequest.h"
#import "GitHubJSONRequest.h"

#import "NSURLRequest+Addition.h"
#import "NSURL+Addition.h"

@interface RequestsTest : XCTestCase

@end

@implementation RequestsTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHeadersRequest{
    JSONAPIRequest *request = [[JSONAPIRequest alloc]init];
    NSDictionary *headers = @{@"Accept": @"application/json", @"Content-type": @"application/json"};
    XCTAssertEqualObjects(request.headers, headers);
}

- (void)testMediaItemsRequest{
    MediaItemsRequest *mediaItemsRequest = [[MediaItemsRequest alloc]init];
    XCTAssertTrue([mediaItemsRequest conformsToProtocol:@protocol(SearchAttributeProtocol)],
                  @"Class does not conform to SearchAttributeProtocol protocol");
    XCTAssertEqualObjects(@"search", mediaItemsRequest.path);
    XCTAssertEqualObjects([MediaItemsResponse class], mediaItemsRequest.responseClass);
}

- (void)testUserRequest{
    UsersRequest *userRequest = [[UsersRequest alloc]init];
    XCTAssertTrue([userRequest conformsToProtocol:@protocol(SearchAttributeProtocol)],
                  @"Class does not conform to SearchAttributeProtocol protocol");
    XCTAssertEqualObjects(@"search/users", userRequest.path);
    XCTAssertEqualObjects([UsersResponse class], userRequest.responseClass);
}

- (void)testITunesJSONRequest{
    ITunesJSONRequest *itunesRequest = [[ITunesJSONRequest alloc]init];
    XCTAssertEqualObjects(@"https://itunes.apple.com/", itunesRequest.baseURL);
}

- (void)testGitHubJSONRequest{
    GitHubJSONRequest *gitHubJSONRequest = [[GitHubJSONRequest alloc]init];
    XCTAssertEqualObjects(@"https://api.github.com/", gitHubJSONRequest.baseURL);
}

- (void)testNSURLRequestForGitHub{
    UsersRequest *userRequest = [[UsersRequest alloc]init];
    [userRequest setSearchStringAttribute:@"asap"];
    
    NSURL *urlUsers = [NSURL urlWithString:userRequest.path
                                   baseURL:userRequest.baseURL
                                parameters:userRequest.parameters];
    XCTAssertNotNil(urlUsers);
    XCTAssertEqualObjects(urlUsers.absoluteString, @"https://api.github.com/search/users?q=asap");
    
    NSURLRequest *baseUserRequest = [NSURLRequest requestWithurl:urlUsers
                                                         headers:userRequest.headers];
    XCTAssertNotNil(baseUserRequest);
}

- (void)testNSURLRequestForITunes{
    MediaItemsRequest *mediaItemsRequest = [[MediaItemsRequest alloc]init];
    [mediaItemsRequest setSearchStringAttribute:@"Metallica"];
    
    NSURL *urlItems = [NSURL urlWithString:mediaItemsRequest.path
                                   baseURL:mediaItemsRequest.baseURL
                                parameters:mediaItemsRequest.parameters];
    XCTAssertNotNil(urlItems);
    XCTAssertEqualObjects(urlItems.absoluteString, @"https://itunes.apple.com/search?term=Metallica");
    
    NSURLRequest *baseItemsRequest = [NSURLRequest requestWithurl:urlItems
                                                          headers:mediaItemsRequest.headers];
    XCTAssertNotNil(baseItemsRequest);
    
}


@end
