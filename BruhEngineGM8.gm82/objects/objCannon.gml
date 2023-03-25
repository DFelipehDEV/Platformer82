#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Angle

    // -- Cannon states
    state = 0; // -- Cannon state
    rotateTime = 0; // -- Rotation animation value
    objectIndex = 0; // -- Object inside cannon index

    // -- Cannon strength
    spd = 13;

    // -- Angle
    image_angle = 120 * image_xscale;
    angle = image_angle;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Check for objects

    // -- State of waiting for some object to get in
    if (state = 0)
    {
        // -- Rotate the object towards a target angle
        image_angle = lerp(image_angle, 120 * image_xscale, 0.05)
        // -- Check if the object is near an interactable object with the same angle
        if (place_meeting(x, y, parInteractable) && scrRoundNearMultiple(image_angle, 22.5) == scrRoundNearMultiple(120 * image_xscale, 22.5))
        {
            // -- Find the nearest interactable object and set its position and visibility
            objectIndex = instance_nearest(x, y, parInteractable);
            rotateTime = 0;
            state = 1;
            objectIndex.x = x;
            objectIndex.y = y;
            objectIndex.visible = false;
        }
    }

    // -- State when some object is inside the cannon
    if (state == 1)
    {
        // -- Increase the rotation time
        rotateTime += 3;

        if (rotateTime < 310)
        {
            // -- Rotate cannon to face the launch direction
            image_angle = scrApproach(image_angle, dcos(rotateTime) * 90* image_xscale, 5);
            objectIndex.x = x + dcos(image_angle + 90)*12;
            objectIndex.y = y - dsin(image_angle + 90)*12;
        }
        else // -- Prepare launch
        {
            // -- Rotate cannon to face the launch direction
            image_angle = lerp(image_angle, angle, 0.3);

            // -- Check if its looking near of the expected launch direction
            if (rotateTime > 320)
            {
                // -- Delay state reset
                if (rotateTime > 380)
                {
                    // -- Reset the state when the animation is complete
                    state = 0;
                }

                // -- Launch the interactable object into the air and make it visible
                objectIndex.xSpeed = spd*dcos(angle + 90)
                objectIndex.ySpeed = spd*-dsin(angle + 90)
                objectIndex.visible = true;

                // -- Adjust the camera's lag when targeting the object
                if (objCamera.camTarget == objectIndex)
                {
                    objCamera.camLag = 3;
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

    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, floor(image_angle), image_blend, image_alpha);
    draw_sprite(sprite_index, 0, x, y)
