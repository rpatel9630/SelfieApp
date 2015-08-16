//
//  PhotoCollectionViewController.h
//  selfie


#import <UIKit/UIKit.h>

@interface PhotoCollectionViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *photoArray;
-(id)initWithPhotoArray:(NSMutableArray *)photos;
@end
