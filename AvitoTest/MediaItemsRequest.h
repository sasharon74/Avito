//
//  MediaItemsRequest.h
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "ITunesJSONRequest.h"

#import "SearchAttributeProtocol.h"

@interface MediaItemsRequest : ITunesJSONRequest <SearchAttributeProtocol>

@end
