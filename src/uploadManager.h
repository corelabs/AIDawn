/*
 *  uploadManager.h
 *  AIDawn
 *
 *  Created by Rez on 3/12/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _UPLOADMANAGER_H_
#define _UPLOADMANAGER_H_

#include "ofMain.h"
#include "ofxiWebUploader.h"
#include "constant.h"


class UploadManager {
	
	private:
		
		char			titulo[255];
		char			contenido[255];
		char			buffer[255];
		
	public:
		//constructor
		UploadManager();

		void			draw();
		int				send(char name[255], char points[255]);
		
		ofxiWebUploader	uploader;
		string			response;
		ofTrueTypeFont  franklinBook;
	
};

#endif