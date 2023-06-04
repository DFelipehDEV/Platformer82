#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables


    global.inputMap[inputMLeft] = vk_left;
    global.inputMap[inputMRight] = vk_right;
    global.inputMap[inputMUp] = vk_up;
    global.inputMap[inputMDown] = vk_down;
    global.inputMap[inputMAct] = ord("A");
    global.inputMap[inputMSpecial1] = ord("S");
    global.inputMap[inputMSpecial2] = ord("D");
    global.inputMap[inputMStart] = vk_enter;


    inputs = true;


    inputLeft = 0;
    inputRight = 0;
    inputUp = 0;
    inputDown = 0;
    inputAction = 0;
    inputSpecial1 = 0;
    inputSpecial2 = 0;

    inputLeftPressed = 0;
    inputRightPressed = 0;
    inputUpPressed = 0;
    inputDownPressed = 0;
    inputActionPressed = 0;
    inputSpecial1Pressed = 0;
    inputSpecial2Pressed  = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Inputs

    if (inputs == true)
    {
        inputLeft     = keyboard_check(global.inputMap[inputMLeft]);
        inputRight    = keyboard_check(global.inputMap[inputMRight]);

        inputUp       = keyboard_check(global.inputMap[inputMUp]);
        inputDown     = keyboard_check(global.inputMap[inputMDown]);

        inputAction   = keyboard_check(global.inputMap[inputMAct]);
        inputSpecial1 = keyboard_check(global.inputMap[inputMSpecial1]);
        inputSpecial2 = keyboard_check(global.inputMap[inputMSpecial2]);

        inputStart    = keyboard_check(global.inputMap[inputMStart]);


        inputLeftPressed      = keyboard_check_pressed(global.inputMap[inputMLeft]);
        inputRightPressed     = keyboard_check_pressed(global.inputMap[inputMRight]);

        inputUpPressed        = keyboard_check_pressed(global.inputMap[inputMUp]);
        inputDownPressed      = keyboard_check_pressed(global.inputMap[inputMDown]);

        inputActionPressed    = keyboard_check_pressed(global.inputMap[inputMAct]);
        inputSpecial1Pressed  = keyboard_check_pressed(global.inputMap[inputMSpecial1]);
        inputSpecial2Pressed  = keyboard_check_pressed(global.inputMap[inputMSpecial2]);

        inputStartPressed    = keyboard_check(global.inputMap[inputMStart]);
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Debug

    if (keyboard_check_pressed(vk_tab))
    {
        global.debug = -global.debug;
    }

    if (mouse_check_button_released(mb_right))
    {
        if (collision_point(mouse_x, mouse_y, parInteractable, 0, 1))
        {

            objCamera.camTarget = instance_nearest(mouse_x, mouse_y, parInteractable);
        }
    }


    if (mouse_check_button_released(mb_middle))
    {
        instance_create(mouse_x, mouse_y, objBall)
    }
