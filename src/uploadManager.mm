/*
 *  uploadManager.cpp
 *  AIDawn
 *
 *  Created by Rez on 3/12/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "uploadManager.h"

//--------------------------------------------------------------
UploadManager::UploadManager(){	
	
	ofBackground(30, 30, 30);
	ofSetBackgroundAuto(true);

	
	franklinBook.loadFont(ofToDataPath("frabk.ttf"),12);

	// POST
	response = "no response yet";
	
}

//--------------------------------------------------------------
int UploadManager::send(char name[255], char points[255]){
	strcpy(buffer, "http://corelabs.cn/interactive/AIDawn/script_POST.php?titulo=");
	strcat(buffer, name);
	strcat(buffer, "&contenido=");
	strcat(buffer, points);
	
	printf("%s\n",buffer);
	
	response = uploader.send(buffer);
	cout << "post response : \n" << response << endl;

	if(response == ""){return ERR;}
	return OK;
	}


//--------------------------------------------------------------
void UploadManager::draw(){
	ofSetColor(0xffffff);
	franklinBook.drawString(response, 10,40);
}