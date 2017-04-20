//
//  MediaItem.h
//  AvitoTest
//
//  Created by Alex on 15.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+JSONSerialization.h"

@interface MediaItem : NSObject

@property (nonatomic, strong) NSString *artistName;
@property (nonatomic, strong) NSString *trackName;
@property (nonatomic, strong) NSString *artworkUrl100;

@end
