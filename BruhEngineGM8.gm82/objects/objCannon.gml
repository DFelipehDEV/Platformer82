#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Angle


    image_angle = 120 * image_xscale;

    state = 0;
    rotateTime = 0;
    objectIndex = 0;

    angle = 120 * image_xscale;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Check for objects


    if (state = 0)
    {
        image_angle = lerp(image_angle, 120 * image_xscale, 0.05)
        if (place_meeting(x, y, parInteractable) && round(image_angle) == 120*image_xscale)
        {
            objectIndex = instance_nearest(x, y, parInteractable);
            rotateTime = 0;
            state = 1;
            objectIndex.x = x;
            objectIndex.y = y;
            objectIndex.visible = false;
        }
    }

    if (state == 1)
    {
        rotateTime += 3;

        // -- Launch the object into the air
        if (rotateTime < 310)
        {
            image_angle = scrApproach(image_angle, dcos(rotateTime) * 90*image_xscale, 5);
            objectIndex.x = x;
            objectIndex.y = y;
        }
        else
        {
            image_angle = lerp(image_angle, angle, 0.3);

            if (rotateTime > 320)
            {
                if (rotateTime > 380)
                {
                    state = 0;
                }

                if (variable_instance_exists(objectIndex, "xSpeed"))
                {
                    objectIndex.xSpeed = 13*dcos(angle + 90)
                }
                objectIndex.pSpeed = 13*dcos(angle + 90)
                objectIndex.ySpeed = 13*-dsin(angle + 90)
                objectIndex.visible = true;


                if (objCamera.camTarget == objectIndex)
                {
                    objCamera.camLag = 5;
                }
            }
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw

    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite(sprite_index, 0, x, y)

    draw_text(x, bbox_top, string(image_angle))
