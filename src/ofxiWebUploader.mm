#include "ofxiWebUploader.h"


ofxiWebUploader::ofxiWebUploader()
{
}

ofxiWebUploader::~ofxiWebUploader()
{
}

//string ofxiWebUploader::send( string myUrl, vector<string> titulo, vector<string>contenido, int mode)
string ofxiWebUploader::send( string myUrl)
{
		// WEB POST
		// set up url

		NSString *sUrl	= [[[NSString alloc] initWithUTF8String:myUrl.c_str() ] autorelease ];
		NSURL *url		= [NSURL URLWithString:[NSString stringWithFormat:@"%@",sUrl]];
		NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:url];
		
		// adding header information:
		[postRequest setHTTPMethod:@"POST"];
		
		// boundary -- not sure about boundaries, but this works for me
		NSString *stringBoundary = [NSString stringWithString:@"0xKhTmLbOuNdArY"];
		NSString *contentType	 = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",stringBoundary];
		[postRequest addValue:contentType forHTTPHeaderField: @"Content-Type"];
		
		
		//setting up the body:
		NSMutableData *postBody = [NSMutableData data];
		[postBody appendData:[[NSString stringWithFormat:@"--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];

		[postRequest setHTTPBody:postBody];
		
		NSURLResponse	* response;
		NSError			* error;
		
		NSData* result = [NSURLConnection sendSynchronousRequest:postRequest returningResponse:&response error:&error];
		NSString * responseString = [[[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding] autorelease];
		
		
		resultList = [responseString UTF8String];
	
		cout << "post resultList : \n" <<resultList << endl;
	
		return resultList;
	
}

