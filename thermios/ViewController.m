#import "ViewController.h"
#import <WebKit/WebKit.h>
#import <Therm/Therm.h>

@interface ViewController ()
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ThermStartWeb(@"192.168.1.92:9090");
    [NSThread sleepForTimeInterval:1.0];
    
    // Create WKWebView
    WKWebViewConfiguration *webConfiguration = [WKWebViewConfiguration new];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:webConfiguration];
    self.webView.inspectable = YES;
    self.webView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;

    [self.view addSubview:self.webView];

    // Load a webpage
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1:8080"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
}

@end

