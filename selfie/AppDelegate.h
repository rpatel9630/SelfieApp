//
//  AppDelegate.h
//  selfie


#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic,assign) BOOL isLaunchFirstTime;
@property (strong, nonatomic) UIWindow *window;
+(AppDelegate *)sharedInstance;
@end

