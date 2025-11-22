#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create WKWebView
    WKWebViewConfiguration *webConfiguration = [WKWebViewConfiguration new];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:webConfiguration];
    self.webView.inspectable = YES;
    self.webView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;

    [self.view addSubview:self.webView];

    // Load a webpage
    NSURL *url = [NSURL URLWithString:@"https://freenome.com"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
}

@end

