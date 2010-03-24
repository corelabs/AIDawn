/*
 *  clock.h
 *  AIDawn
 *
 *  Created by CORE LABS on 3/11/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _CLOCK_H_
#define _CLOCK_H_

#include <time.h>
#include "constant.h"

class Clock {
	private:
		// VARS
		bool	stoped;
		bool	countDown;
		int		time_max;
		int		limit;
	
		float	init;
		float	end;
		float	acc;
		float	endPause;
		float	initPause;
	
	public:
		//vars
		float total;
		
		/* Constructor countup */
		Clock();
		
		/* Constructor countdown */
		Clock(int time_limit);
		
		//methods
		void	start();
		void	stop();
		void	reset();
		void	pause();
		void	cont();
		void	countup();
		float	countdown();
		float	time();
};
#endif