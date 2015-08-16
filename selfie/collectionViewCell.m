//
//  collectionViewCell.m
//  selfie


#import "collectionViewCell.h"

@implementation collectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
        [self.contentView addSubview:self.cellImage];;
    }
    return self;
}
@end
