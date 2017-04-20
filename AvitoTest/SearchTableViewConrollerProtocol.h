//
//  ViewControllerProtocol.h
//  AvitoTest
//
//  Created by Alex on 17.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

@protocol SearchTableViewConrollerProtocol <NSObject>

- (void)performSearchWithText:(NSString *)text;

@property (strong, nonatomic, readonly) NSString *searchStr;

@end
