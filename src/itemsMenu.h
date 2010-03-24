/*
 *  itemsMenu.h
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/3/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "ofMain.h"
#include "constant.h"

class ItemsMenu {
	private:
		//vars
		char			titleString[MAX_STRING];
		char			howToPlayString[MAX_STRING];
		char			counterString[MAX_STRING];
		char			globalCounterString[MAX_STRING];
		char			resetString[MAX_STRING];
		char			counterDownString[MAX_STRING];
		ofTrueTypeFont 	tempesta;
		
		int				counter;
		int				globalcounter;
		float			time;
		float			countDownTimer;
	
		int				textColor;
		int				resetColor;
		int				barsColor;
	
	public:
		//vars
		bool			countDown;

		//constructor
		ItemsMenu();
	
		//methods
		void			draw(); //draw plane
		void			setTextColor(int color);
		void			setResetColor(int color);
		void			setBarsColor(int color);
		void			setCounter(int count);
		void			setTime(float timer);
		void			setCountDown(float timer);
		void			setGlobalCounter(int count);
	
};