#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///  -- Debug

    draw_set_color(c_white)
    draw_set_font(debugFont)
    draw_text(view_xview[0] + 16, view_yview[0] + 8, "O - LESS FPS#P - MORE FPS#" + string(fps))
    if (global.debug == -1) exit;
    draw_sprite_ext(sprCameraTrigger, 0, view_xview[0] + 200, view_yview[0] + 155, 179+48, 85, 0, c_black, 1);
    draw_text(view_xview[0] + 32, view_yview[0] + 32, string(global.delta));
    draw_text(view_xview[0] + 32, view_yview[0] + 48, string(delta_time*1000));
    if (instance_exists(objPlayer))
    {
        draw_text(view_xview[0] + 318, view_yview[0] + 157, string(objPlayer.x))
        draw_text(view_xview[0] + 318, view_yview[0] + 167, string(objPlayer.y))
        draw_text(view_xview[0] + 200, view_yview[0] + 157, "XSPD- " + string(objPlayer.xSpeed) + " " + string(objPlayer.xVelocity))
        draw_text(view_xview[0] + 200, view_yview[0] + 167, "YSPD- " + string(objPlayer.ySpeed) + " " + string(objPlayer.yVelocity))
        draw_text(view_xview[0] + 200, view_yview[0] + 177, "GROUND- " + string(objPlayer.ground))
        draw_text(view_xview[0] + 200, view_yview[0] + 187, "DIR- " + string(objPlayer.xDir))
        draw_text(view_xview[0] + 200, view_yview[0] + 197, "ACTION- " + string(objPlayer.action))
        draw_text(view_xview[0] + 200, view_yview[0] + 217, "FPS- " + string(fps))
        draw_text(view_xview[0] + 200, view_yview[0] + 227, "ANIMATION- " + string(objPlayer.animIndex))
        draw_text(view_xview[0] + 298, view_yview[0] + 227, string(objPlayer.animFrame))
        if (mouse_check_button(mb_left))
        {
            objPlayer.x = lerp(objPlayer.x, mouse_x, 0.5);
            objPlayer.y = lerp(objPlayer.y, mouse_y, 0.5);
            objPlayer.ySpeed = 0;
        }
    }

    draw_text(view_xview[0] + 318, view_yview[0] + 137, string(mouse_x))
    draw_text(view_xview[0] + 318, view_yview[0] + 147, string(mouse_y))
    draw_set_color(c_black)
