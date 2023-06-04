#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw bg


    draw_background(bgTest1, view_xview[0], view_yview[0]);

    draw_background(bgTest2, (view_xview[0] - 128) + dcos(global.roomTimer*1.3)*40, (view_yview[0] - dsin(global.roomTimer/2)*12) + 140);
