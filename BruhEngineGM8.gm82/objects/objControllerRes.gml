#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables


    global.screenSize = 1;
    resolutionAdaptive = 1;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Center window


    window_center();
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Resize

    // -- Set to the minimum size if the window is too big
    if (global.screenSize >= 4)
    {
        global.screenSize = 1;
        window_set_fullscreen(false);
    }

    window_set_size(screenWidth * global.screenSize, screenHeight * global.screenSize);


    // -- Fullscreen
    if (global.screenSize == 3)
    {
        window_set_size(screenWidth, screenHeight);
        window_set_fullscreen(true);
    }


    // -- Center window
    alarm[0] = 2;
#define KeyPress_115
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Change screen size


    global.screenSize += 1;
    event_user(0);
