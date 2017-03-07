// #define DOUBLES(var1,var2) ##var1##_##var2
#define QUOTE(var1) #var1

#ifdef TASK_FORCE
    #define RESPAWN_TYPE -1
    #define FPS_LOGGING 1
#else
    #define RESPAWN_TYPE 0
    #define FPS_LOGGING 0
#endif

// #define LS(ID) QUOTE(\mrb_mod\data\loadingScreens\DOUBLES(load,ID).paa)
// __EXEC(loadingScreen = selectRandom [LS(0), LS(1), LS(2), LS(3), LS(4), LS(5), LS(6)]);

// __EXEC(loadingMessage = selectRandom ["Loading message #1", "Loading message #2", "Loading message #3"]);

respawnOnStart = RESPAWN_TYPE;
fpsLogging = FPS_LOGGING;
// loadScreen = __EVAL(loadingScreen);
// overviewPicture = __EVAL(loadingScreen);
// onLoadMission = __EVAL(loadingMessage)
// onLoadIntro = __EVAL(loadingMessage)

#define FNC(NAME) class NAME {};

#define SET_SYS(CORE,VAR,VAL,TYPE) class CORE##_##VAR { \
    value = VAL; \
    typeName = QUOTE(TYPE); \
    force = 1; \
};
#define SETB(A,B) SET_SYS(ace,A,B,BOOL)
#define SETS(A,B) SET_SYS(ace,A,B,SCALAR)
#define XSETB(A,B) SET_SYS(acex,A,B,BOOL)
#define XSETS(A,B) SET_SYS(acex,A,B,SCALAR)
