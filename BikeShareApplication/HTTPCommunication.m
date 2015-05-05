#import "HTTPCommunication.h"

@implementation HTTPCommunication

-(void)retrieveURL:(NSURL *)url successBlock:(void (^)(NSData *))successBlock{
    
    // persisting given successBlock for calling it later
    
    self.successBlock = successBlock;
    
    //Creating the request using the given url
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    
    // Set the default configuration
    
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // set up the session
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf delegate:self delegateQueue:nil];
    
    //preparing the download task
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    
    //establish the connection
    [task resume];
    
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
    //getting the download data from the local storage
    
    NSData *data =[NSData dataWithContentsOfURL:location];
    
    // ensure that you call the successBlock from the main thread by using the dispatch
    
    dispatch_async(dispatch_get_main_queue(), ^{
       // calling the block stored before as a callback
        self.successBlock(data);
    });
    
}

@end
