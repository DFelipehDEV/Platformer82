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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Camera


    x = lerp(x, camTarget.x + camXShift, 0.2);
    y = lerp(y, floor(camTarget.y), 0.2);

    camXShift = scrApproach(camXShift, round(-(round(camTarget.xprevious - camTarget.x)*2)/2)*16, 1);
