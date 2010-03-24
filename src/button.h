/*
 *  button.h
 *  AIDawn
 *
 *  Created by CORE LABS on 3/15/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _BUTTON_H_
#define _BUTTON_H_

#include "ofMain.h"
#include "constant.h"

class Button {
	private:
		//vars
		ofTrueTypeFont	key;
		int				buttonColor;
	
	public:
		//vars
		alphabet		name;
		char			character[5];
		int				boxX;
		int				boxY;
		int				x;
		int				y;
		int				w;
		int				h;
	
		// Constructor
		Button(int type);
		
		//methods
		void draw();
		void setPosition(int type);
		void setButtonColor(int color);
	
};
#endif