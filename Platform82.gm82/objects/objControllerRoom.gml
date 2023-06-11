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

    global.delta = ((delta_time*1000)/1000000) / (1/60);
    global.roomTimer += 1 * global.delta;

    if (keyboard_check_pressed(ord("R")))
    {
        room_restart();
    }

    if (keyboard_check_pressed(ord("P")))
    {
        room_speed += 10;
    }

    if (keyboard_check_pressed(ord("O")))
    {
        room_speed -= 10;
    }
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Reset room


    global.roomTimer = 0;
