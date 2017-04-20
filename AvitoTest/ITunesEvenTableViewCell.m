//
//  ITunesEvenTableViewCell.m
//  AvitoTest
//
//  Created by Alex on 17.04.17.
//  Copyright © 2017 Alexander Mikhaylov. All rights reserved.
//

#import "ITunesEvenTableViewCell.h"
#import "MediaItem.h"
#import "UIImageView+Network.h"

@implementation ITunesEvenTableViewCell

+ (UINib *)nib{
    return [UINib nibWithNibName:@"ITunesEvenTableViewCell" bundle:nil];
}

#pragma mark Initial

- (instancetype)initWithReuseID:(NSString *)reuseID{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    if (self){
        
        self = [[[NSBundle mainBundle]loadNibNamed:@"ITunesEvenTableViewCell"
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

#pragma marl CellProtocol

+ (NSString *)reuseIdentifier{
    return @"itunes_even_cell";
}

- (void)setObject:(MediaItem *)mediaItem {
    _object = mediaItem;
    
    [_nameItemLabel setText:mediaItem.trackName];
    [_authorLabel setText:mediaItem.artistName];
    _cellImageView.image = nil;
    [_cellImageView loadImageFromURLString:mediaItem.artworkUrl100];
}


@end
