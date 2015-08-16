//
//  PhotoViewerViewController.h
//  selfie


#import <UIKit/UIKit.h>

@interface PhotoViewerViewController : UIViewController<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (strong, nonatomic)  UIScrollView *scrollView;
@property (strong, nonatomic)  UIImageView *zoomImage;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic)  UIPageControl *pageControll;
@property (assign, nonatomic) int page;
-(id)initWithArray:(NSMutableArray *)imgArray;
@end
