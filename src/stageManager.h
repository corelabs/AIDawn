/*
 *  stageManager.h
 *  iPhone AI Dawn
 *
 *  Created by CORE LABS on 3/4/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#ifndef _STAGEMANAGER_H_
#define _STAGEMANAGER_H_

#include "stageOne.h"
#include "stageTwo.h"
#include "stageThree.h"
#include "stageFour.h"

class StageManager {
	private:
		//vars
		Plane		**plane;
		int			stage;
		int			counter;
	
		StageOne	*stageOne;
		StageTwo	*stageTwo;
		StageThree	*stageThree;
		
		
		//methods
		
	public:
		//vars
		StageFour	*stageFour;
	
		//constructor
		StageManager();
		
		//methods
		void		draw(); //draw plane
		void		update();
		void		setStage(int level);
		bool		checkHit(int x, int y);
		void		createItem();
		void		resetStage();
		void		setCounter(int count);
		void		setStatusText(char status[255]);
	
};

#endif