#ifndef WEBUPLOADER_H
#define WEBUPLOADER_H

#include "ofMain.h"
#include "ofxXmlSettings.h"
#include "ofxiPhoneFile.h"
#include "ofxFileLoader.h"

#define WEB_POST		0
#define WEB_GET			1

class ofxiWebUploader
{
    public:
        ofxiWebUploader();
        virtual ~ofxiWebUploader();
		
		ofxXmlSettings XML;
		ofxiPhoneFile rawXML;
		ofxFileLoader loader;
	
		string	send( string myUrl);
		string resultList;

		
    protected:
		
	
    private:
};

#endif // WEBUPLOADER_H
