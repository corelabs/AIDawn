/*
 *  keyboardManager.h
 *  AIDawn
 *
 *  Created by Rez on 3/15/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _KEYBOARDMANAGER_H_
#define _KEYBOARDMANAGER_H_

#include "ofMain.h"
#include "button.h"
#include "uploadManager.h"

#define  FONTSIZE    6 
#define  KEYSIZE     25
#define  KEYDISTANCE 25
#define  ZEROROW_Y   294
#define  FIRSTROW_Y  ZEROROW_Y+33
#define  SECONDROW_Y FIRSTROW_Y+33
#define  THIRDROW_Y	 SECONDROW_Y+33
#define  FOURTHROW_Y THIRDROW_Y+33


class KeyboardManager {
	
	private:
		//vars
		ofTrueTypeFont	inputName;
		Button			**button;
		int				lastClicked;
		
		//methods
		void			sendPoints();
		void			actionText(int i);
		
	public:
		//vars
		char			name[255];
		char			responseText[255];
		float			puntuation;
		bool			okPressed;
	
		//constructor
		KeyboardManager();
	
		//methods
		void			update();
		void			draw();
		void			exit();

		void			mousePressed(int x, int y, int button);
		void			checkHit(int x, int y);
		void			keyReleassed();
	
	
};

#endif