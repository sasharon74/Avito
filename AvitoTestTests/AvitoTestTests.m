//
//  AvitoTestTests.m
//  AvitoTestTests
//
//  Created by Alex on 13.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface AvitoTestTests : XCTestCase

@end

@implementation AvitoTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInstallInWindow{
    
    XCTAssert([[[[[UIApplication sharedApplication]delegate] window] rootViewController] isKindOfClass:[ViewController class]]);
}

@end
