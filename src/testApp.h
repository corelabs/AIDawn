#ifndef _TEST_APP
#define _TEST_APP


#include "ofMain.h"
#include "ofxMultiTouch.h"
#include "ofxVectorMath.h"
#include "ofxALSoundPlayer.h"
#include "ofxXmlSettings.h"
#include "newlevel.h"
#include "glu.h"
#include "constant.h"

#include "plane.h"
#include "circle.h"
#include "initMenu.h"
#include "resetMenu.h"
#include "itemsMenu.h"
#include "introStage.h"
#include "sound.h"
#include "stageManager.h"
#include "clock.h"
#include "uploadManager.h"


class testApp : public ofSimpleApp, public ofxMultiTouchListener{

	public:
	
		//vars
		int				counter;
		int				globalcounter;
		int				level;
		
		bool			menuScene;
		bool			resetPressed;
		bool			end;
		bool			printScreen;	
		bool			introStageFlag;	
		bool			alertMessage;
		bool			gameOver;
		bool			resultStage;
		bool			loaded;
	
		char			alertText[255];
	
		Sound			*soundSystem;
		ofTrueTypeFont 	tempesta;
	
		//methods
		void setup();
		void update();
		void draw();

		void keyPressed  (int key);
		void keyReleased (int key);

		void mouseMoved(int x, int y );
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		
		void touchDown(float x, float y, int touchId, ofxMultiTouchCustomData *data = NULL);
		void touchMoved(float x, float y, int touchId, ofxMultiTouchCustomData *data = NULL);
		void touchUp(float x, float y, int touchId, ofxMultiTouchCustomData *data = NULL);
		void touchDoubleTap(float x, float y, int touchId, ofxMultiTouchCustomData *data = NULL);
	
		void windowResized(int w, int h);
		void createPlane();
		void checkHit(int x, int y);
		void checkResetMenu(int x, int y);
		bool checkBeginButton(int x, int y);
		bool checkResetButton(int x, int y);
		bool checkPlaneHit(int x, int y);
	    void resetLevel();
	
		
	
	private:
		//vars
		float			zoomIn;
		bool			endStage;
		ofTexture		screen;
		
		InitMenu		*menuInicio;
		ResetMenu		*menuReset;
		ItemsMenu		*menuItems;
		Plane			**plane;
		StageManager	*stageManager;
		IntroStage		*introStage;
		Clock			*clockUp;
		Clock			*clockDown;
		UploadManager	*uploader;
	
		//methods
		void			initVars();
		void			checkHitIntroStage();
		void			checkHitMenuInicio();
		void			checkCountDownFinish();
		void			checkPrintScreen();
		bool			checkChangeStage();
		void			checkResetPressed();
		void			resetOption(resetMenuType option);
		void			drawScene();

};

#endif

