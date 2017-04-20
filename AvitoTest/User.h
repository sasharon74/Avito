//
//  User.h
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ParserUser.h"
#import "NSObject+JSONSerialization.h"

@interface User : NSObject

@property (nonatomic, strong) NSString *avatar_url;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *url;

@end
