#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    global.roomTimer = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Room control


    if (fps > 1)
    {
        global.roomTimer += FRAMERATE / fps;
    }


    if (keyboard_check_pressed(ord("R")))
    {
        room_restart();
    }

    if (keyboard_check_pressed(ord("P")))
    {
        room_speed += 5;
    }
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Reset room


    global.roomTimer = 0;
