#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables


    image_speed = 0;

    xDir   = 1;
    xSpeed = 0;             // -- Horizontal speed (ground and air)
    ySpeed = 0;             // -- Vertical speed (air)

    ground = 0;             // -- 0 - in air // -- 1 - in ground


    slopeHeight = 0;        // -- Slope height used while going up
    terrainID = 0;          // -- ID of the meeting terrain
    terrainCurrent = "";    // -- Weather is meeting a solid or a platform
    terrainAngle = 0;


    action = actionNormal;  // -- Current player state
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Misc

    // -- Create camera and set the camera to follow you
    camera              = instance_create(x, y, objCamera);
    camera.camTarget    = id;


    // -- Animation declare
    animSprite      = 0;        // -- The current animation sprite
    animPrevious    = "";       // -- The last animation that was played
    animIndex       = "";       // -- The current animation name
    animFrame       = 0;        // -- The current frame of the animation
    animFrameStart  = 0;        // -- The first frame of the animation
    animFrameEnd    = 0;        // -- The final frame of the animation
    animFrameLoop   = 0;        // -- The loop point of the animation if it has been repeated
    animSpeed       = 0;        // -- The speed of the animation
    animTime        = 0;        // -- How long the animation has been playing


    // -- Animation flags
    animFinished    = false;    // -- True in case the animation has ended
    animRepeat      = false;    // -- True if you want to the animation to repeat
    animReset       = false;    // -- True if you want to it to return to the first frame when the animation changes


    animAngle = 0;

    drawX = x;
    drawY = y
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Main movement


    scrMovementSlopes();


    if (ground == true)
    {
        switch (xDir)
        {
            case 1:
                if (abs(xSpeed) > 0)
                {
                    terrainAngle = round(point_direction(xprevious, yprevious, x, y)/22.5)*22.5
                }
            break;

            case -1:
                if (abs(xSpeed) > 0)
                {
                    terrainAngle = (round(point_direction(xprevious, yprevious, x, y)/22.5)*22.5) - 180
                }
            break;
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Vertical movement


    switch(ground)
    {
        // -- In mid air
        case 0:
            // -- Land
            if (scrCollisionMain(x, y + 4, collisionSolid) && ySpeed >= 0)
            {
                ground = true;
                ySpeed = 0;
            }
        break;

        // -- In ground
        case 1:
            // -- Leave the ground
            if (!scrCollisionMain(x, y + 4, collisionSolid))
            {
                ground = false;
                terrainAngle = 0;
            }

            // -- Leave inside the platform
            if (scrCollisionMain(x, y, parPlatform) && ySpeed >= 0)
            {
                y = terrainID.y - 16;
            }
        break;
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Actions


    switch (action)
    {
        case actionNormal:
            scrPlayerActionNormal();
        break;

        case actionJump:
            scrPlayerActionJump();
        break;

        case actionCrouch:
            scrPlayerActionCrouch();
        break;

        case actionLookup:
            scrPlayerActionLookup();
        break;
    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Animation system



    // Increase timer since the animation started
    animTime += 1;


    // Check if the animation has not ended
    if (animFinished == false && animSpeed != 0)
    {
        // Change the frame depending on the animation speed
        animFrame += animSpeed;

        if (floor(animFrame) > animFrameEnd)
        {
            // Repeat animation
            if(animRepeat == true)
            {
                animFrame = animFrameLoop;
            }
            else
            // Stop animation
            {
                animFrame = animFrameEnd;
                animFinished   =   true;
            }
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Physical push

    var physicalobj;
    physicalobj = instance_place(x + xSpeed, y, parInteractable);
    if (place_meeting(x + xSpeed, y, physicalobj))
    {
        //x -= sign(physicalobj.x - x);
        //y -= sign(physicalobj.y - y);


        // -- Check if the object is touching a wall or another object
        if place_meeting(physicalobj.x - 16, physicalobj.y - 3, parTerrain) && scrPhysicsReturnDir(physicalobj) <= 0
        || place_meeting(physicalobj.x + 16, physicalobj.y - 3, parTerrain) && scrPhysicsReturnDir(physicalobj) == 1
        {
            //xSpeed = 0;
        }
        else
        {
            physicalobj.pSpeed = (x - xprevious);
            physicalobj.image_angle += x - xprevious;
        }
        //physicalobj.y += y - yprevious;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw


    drawX = floor(x);
    drawY = floor(y);

    if global.debug
    draw_sprite(sprite_index, image_index, floor(x), floor(y));
    else
    draw_sprite_ext(animSprite, animFrame, drawX, drawY, xDir, image_yscale, 0, image_blend, image_alpha);


    if (ground)
    animAngle = point_direction(xprevious,yprevious, x, y)
