//
//  UsersRequest.h
//  AvitoTest
//
//  Created by Alex on 14.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "GitHubJSONRequest.h"
#import "SearchAttributeProtocol.h"

@interface UsersRequest : GitHubJSONRequest <SearchAttributeProtocol>


@end
