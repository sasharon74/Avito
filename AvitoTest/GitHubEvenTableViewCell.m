//
//  GitHubTableViewCell.m
//  AvitoTest
//
//  Created by Alex on 16.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "GitHubEvenTableViewCell.h"
#import "User.h"
#import "UIImageView+Network.h"

@implementation GitHubEvenTableViewCell

+ (UINib *)nib{
    return [UINib nibWithNibName:@"GitHubEvenTableViewCell" bundle:nil];
}

#pragma mark Initial

- (instancetype)initWithReuseID:(NSString*)reuseID{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    if (self){
        
        self = [[[NSBundle mainBundle]loadNibNamed:@"GitHubEvenTableViewCell"
                                             owner:self
                                           options:nil]firstObject];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UITapGestureRecognizer* tapGest =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToImage:)];
        
        [self.cellImageView addGestureRecognizer:tapGest];
    }
    return self;
}

#pragma mark UITapGestureRecognizer

- (void)tapToImage:(UITapGestureRecognizer*)tap{
    [self.delegate userDidTouch:tap image:self.cellImageView.image cell:self];
}

#pragma mark CellProtocol

+ (NSString *)reuseIdentifier{
    return @"github_even_cell";
}


- (void)setObject:(User *)user {
    _object = user;
    
    [_loginLabel setText:user.login];
    [_linkLabel setText:user.url];
    _cellImageView.image = nil;
    [_cellImageView loadImageFromURLString:user.avatar_url];
}

@end
