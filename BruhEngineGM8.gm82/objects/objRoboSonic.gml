#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Move objects


    var interact;
    interact = instance_place(x, y - 2, parInteractable);
    if (interact != noone)
    {
        hspeed += 0.008;
        interact.x += hspeed;
        interact.y += vspeed;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw object

    draw_sprite(sprite_index, image_index, x, y)
