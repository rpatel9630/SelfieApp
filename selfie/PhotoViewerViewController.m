//
//  PhotoViewerViewController.m
//  selfie


#import "PhotoViewerViewController.h"

@interface PhotoViewerViewController ()

@end

@implementation PhotoViewerViewController
-(void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)savePhotos
{
        UIImage *image = (UIImage *)[self.imageArray objectAtIndex:_page];
        //Now it will do this for each photo in the array
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
}
- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *message;
    NSString *title;
    if (!error)
    {
        title = @"Photo";
        message = @"Photo saved on photo album.";
    }
    else
    {
        title = @"Error";
        message = [error description];
    }
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:title
                          message:message
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}
-(id)initWithArray:(NSMutableArray *)imgArray
{
    if (self == [super init]) {
        self.imageArray = [[NSMutableArray alloc] initWithArray:imgArray];
    }
    return self;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _page = 0;
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(goBack)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(savePhotos)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-60)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    
    for (int i = 0; i < [self.imageArray count]; i++) {
       UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        UIImage *image = [self.imageArray objectAtIndex:i];
        imageView.image = [self.imageArray objectAtIndex:i];
        CGSize size = image.size;
        if (size.width == size.height) {
            imageView.contentMode = UIViewContentModeScaleAspectFit;
        }
        [_scrollView addSubview:imageView];
    }
    [self.view addSubview:_scrollView];
    
    _scrollView.contentSize = CGSizeMake([_imageArray count]*_scrollView.frame.size.width, 0);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    tap.numberOfTapsRequired =2;
    [_scrollView addGestureRecognizer:tap];
    [self.navigationController.navigationBar setHidden:NO];
    
    _pageControll = [[UIPageControl alloc] initWithFrame:CGRectMake(self.view.center.x-30, CGRectGetMaxY(_scrollView.frame), 80, 37)];
    _pageControll.numberOfPages = [self.imageArray count];
    [self.view addSubview:_pageControll];
    
    // Do any additional setup after loading the view.
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _page = scrollView.contentOffset.x / scrollView.frame.size.width;
    [_pageControll setCurrentPage:_page];
}
-(void)handleTap
{
    _scrollView.zoomScale =1;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
