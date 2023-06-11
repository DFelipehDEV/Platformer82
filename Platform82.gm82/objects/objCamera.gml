#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    camTarget = -1;

    camXShift = 0;
    camYShift = 0;
    camLag = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Camera

    camLag = max(camLag - 1, 0)
    if (camLag == 0)
    {
        x = floor(lerp(x, camTarget.x + camXShift, 0.2*global.delta));
        y = floor(lerp(y, camTarget.y + camYShift, 0.2*global.delta));

        camXShift = inch(camXShift, (round(-(round((camTarget.xprevious - camTarget.x) / global.delta)/3)*3)*16), 1*global.delta);
    }
