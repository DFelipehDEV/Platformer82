#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///  -- Debug

    draw_set_color(c_white)
    draw_set_font(debugFont)
    draw_text(view_xview + 16, view_yview + 16, string(fps))
    if (global.debug == -1) exit;
    draw_sprite_ext(sprCameraTrigger, 0, view_xview + 248, view_yview + 155, 179, 85, 0, c_black, 1);

    if (instance_exists(objPlayer))
    {
        draw_text(view_xview + 318, view_yview + 157, string(objPlayer.x))
        draw_text(view_xview + 318, view_yview + 167, string(objPlayer.y))
        draw_text(view_xview + 248, view_yview + 157, "XSPEED- " + string(objPlayer.xSpeed))
        draw_text(view_xview + 248, view_yview + 167, "YSPEED- " + string(objPlayer.ySpeed))
        draw_text(view_xview + 248, view_yview + 177, "GROUND- " + string(objPlayer.ground))
        draw_text(view_xview + 248, view_yview + 187, "DIR- " + string(objPlayer.xDir))
        draw_text(view_xview + 248, view_yview + 197, "ACTION- " + string(objPlayer.action))
        draw_text(view_xview + 248, view_yview + 217, "FPS- " + string(fps))
        draw_text(view_xview + 248, view_yview + 227, "ANIMATION- " + string(objPlayer.animIndex))
        draw_text(view_xview + 338, view_yview + 227, string(objPlayer.animFrame))
        if (mouse_check_button(mb_left))
        {
            objPlayer.x = lerp(objPlayer.x, mouse_x, 0.5);
            objPlayer.y = lerp(objPlayer.y, mouse_y, 0.5);
            objPlayer.ySpeed = 0;
        }
    }

    draw_text(view_xview + 318, view_yview + 137, string(mouse_x))
    draw_text(view_xview + 318, view_yview + 147, string(mouse_y))
    draw_set_color(c_black)
