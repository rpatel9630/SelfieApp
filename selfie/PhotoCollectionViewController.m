//
//  PhotoCollectionViewController.m
//  selfie


#import "PhotoCollectionViewController.h"
#import "PhotoViewerViewController.h"
#import "collectionViewCell.h"
@interface PhotoCollectionViewController ()

@end

@implementation PhotoCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

-(id)initWithPhotoArray:(NSMutableArray *)photos
{
    if (!self) {
        self = [super init];
    }
    _photoArray = [[NSMutableArray alloc] initWithArray:photos];
    return self;
}
-(void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)savePhotos
{
    for (int i=0;i<[_photoArray count];i++){
        UIImage *image = (UIImage *)[_photoArray objectAtIndex:i];
        //Now it will do this for each photo in the array
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    [self goBack];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(goBack)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    [self.navigationController.navigationBar setHidden:NO];
    self.title = @"Photo Viewer";
    self.view.backgroundColor = [UIColor clearColor];
   
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[collectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
     self.collectionView.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_photoArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    collectionViewCell *cell = (collectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.cellImage.image = [_photoArray objectAtIndex:indexPath.row];
    // Configure the cell
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //You may want to create a divider to scale the size by the way..
    return CGSizeMake(100, 100);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //UIImage * image = [_photoArray objectAtIndex:indexPath.row];
    PhotoViewerViewController *pvc = [[PhotoViewerViewController alloc] initWithArray:_photoArray];
    [self.navigationController pushViewController:pvc animated:YES];
    
    
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
