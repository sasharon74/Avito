//
//  GitHubViewController.h
//  AvitoTest
//
//  Created by Alex on 17.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchTableViewConrollerProtocol.h"

@interface GitHubViewController : UIViewController <SearchTableViewConrollerProtocol>

@property (weak, nonatomic) IBOutlet UITableView *gitHubTableView;


@property (strong, nonatomic) NSString *searchStr;

@end

