/*
 *  initMenu.h
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/2/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _INITMENU_H_
#define _INITMENU_H_

#include "ofMain.h"

#define TEXT_INTRO_Y  50
#define BEGIN_POS_X   135
#define BEGIN_POS_Y   315
#define BEGIN_WITH    50
#define BEGIN_HEIGHT  50


class InitMenu {
	private:
		//vars
		ofTrueTypeFont 	tempesta;
		ofTrueTypeFont 	title;
		int textColor;
		int buttonColor;
	
	public:	
		//constructor
		InitMenu();
		
		//methods
		void draw(); //draw plane
		void setTextColor(int color);
		void setButtonColor(int color);
};
#endif