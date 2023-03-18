#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Step


    var interact;
    interact = instance_place(x, y - 2, parInteractable);
    if (interact != noone)
    {
        interact.x += hspeed;
        interact.y += vspeed;

        hspeed += 0.008;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index, image_index, floor(x), floor(y))
