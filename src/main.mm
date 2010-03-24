#include "ofMain.h"
#include "testApp.h"
#include "ofAppGlutWindow.h"



//========================================================================
int main(int argc, char *argv[]) {
	ofSetupOpenGL(320,480, OF_FULLSCREEN);			// <-------- setup the GL context
	
	ofRunApp(new testApp);
	
}

