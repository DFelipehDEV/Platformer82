#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    image_speed = 0;

    // -- Speeds
    xSpeed = 0;                 // -- Horizontal speed (ground and air)
    ySpeed = 0;                 // -- Vertical speed (airborne)

    // -- Terrain
    slopeHeight = 0;            // -- Slope height used while going up
    slopeMax = 7;               // -- Max slope height the player can move
    terrainID = 0;              // -- ID of the meeting terrain
    terrainCurrent = 0;         // -- Whether the player is meeting a solid or a platform
    terrainAngle = 0;           // -- Angle of terrain
    solidPlace = 0;
    platformPlace = 0;

    // -- States
    action = actionNormal;      // -- Current player state
    ground = false;

    // -- Player's direction
    xDir = 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Misc

    // -- Camera
    camera = instance_create(x, y, objCamera);
    camera.camTarget = id;

    // -- Animation declarations
    animSprite = 0;         // -- The current animation sprite
    animPrevious = "";      // -- The last animation that was played
    animIndex = "";         // -- The current animation name
    animFrame = 0;          // -- The current frame of the animation
    animFrameStart = 0;     // -- The first frame of the animation
    animFrameEnd = 0;       // -- The final frame of the animation
    animFrameLoop = 0;      // -- The loop point of the animation if it has been repeated
    animSpeed = 0;          // -- The speed of the animation
    animTime = 0;           // -- How long the animation has been playing

    // -- Animation flags
    animFinished = false;   // -- True in case the animation has ended
    animRepeat = false;     // -- True if you want the animation to repeat
    animReset = false;      // -- True if you want it to return to the first frame when the animation changes

    animAngle = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Physics

    // -- Ground acceleration, deceleration and friction
    phyAcc = 0.09;
    phyDec = 0.14;
    phyFrc = 0.25;

    // -- Speeds
    phySpeedTop = 5;

    // -- Gravity
    phyGrv = 0.28;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Main movement

    // -- Main movement
    var i;

    var spdFloor;
    spdFloor = floor(abs(xSpeed));
    if (ground && scrCollisionMain(x, y + slopeMax, collisionSolid) &&
        scrCollisionMain(x + xSpeed, y + slopeMax, collisionSolid) &&
        !scrCollisionMain(x + xSpeed, y, collisionSolid) &&
        !scrCollisionMain(x + xSpeed, y + 1, collisionSolid))
    {
        x += xSpeed;

        // -- Go down
        while (!(scrCollisionMain(x, y + 1, collisionSolid)))
        {
            y += 1;
        }
    }
    else // -- Go up
    {
        // -- Check if is meeting a solid
        var collisionMain;
        collisionMain = scrCollisionMain(x + xSpeed, y, collisionSolid);

        if (collisionMain)
        {
            slopeHeight = 0;

            var collisionSlope;
            for (i = 0; i < spdFloor + 3; i += 1)
            {
                // -- Keep adding 1 to slopeHeight until it's value is greater than our slope height or until the statement isn't true
                collisionSlope = scrCollisionMain(x + xSpeed, y - slopeHeight, collisionSolid);

                if (collisionSlope && slopeHeight <= slopeMax)
                {
                    slopeHeight += 1;
                }
            }

            // -- Check if we are colliding a wall and not a slope
            var collisionWall;
            collisionWall = scrCollisionMain(x + xSpeed, y - slopeHeight, collisionSolid);

            if (collisionWall)
            {
                // -- Move up with the slope x
                var collisionX;
                collisionX = scrCollisionMain(x + sign(xSpeed), y, collisionSolid);

                if (!(collisionX))
                {
                    x += sign(xSpeed);
                }
                if (terrainCurrent != terrainPlatform)
                {
                    xSpeed = 0;
                }
            }
            else // -- Otherwise, we are moving up a slope
            {
                y -= slopeHeight;
            }
        }

        // -- Approach to the xSpeed
        x += xSpeed;
    }

    var collisionVertical, collisionLeave;
    for (i = 0; i < spdFloor + 1; i += 1)
    {
        // -- Vertical movement
        collisionVertical = scrCollisionMain(x, y + ySpeed, parSolid);

        if (collisionVertical)
        {
            // -- Leave the solid
            collisionLeave = !(scrCollisionMain(x, y + sign(ySpeed), parSolid));

            if (collisionLeave)
            {
                y += sign(ySpeed);
            }
            ySpeed = 0;
        }
    }

    // -- Approach to the ySpeed
    y += ySpeed;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Terrain angle

    // -- Check if the player is on the ground
    if (ground == true)
    {
        // -- Check which direction the player is facing
        switch (xDir)
        {
            case 1:
                // -- If the player is moving horizontally, calculate the terrain angle
                if (abs(xSpeed) > 0)
                {
                    terrainAngle = round(point_direction(xprevious, yprevious, x, y)/22.5)*22.5;
                }
            break;

            case -1:
                // -- If the player is moving horizontally, calculate the terrain angle
                if (abs(xSpeed) > 0)
                {
                    terrainAngle = (round(point_direction(xprevious, yprevious, x, y)/22.5)*22.5) - 180;
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

    // -- Vertical movement
    if (ground == false)
    {
        // -- Check if landing on solid ground
        if (scrCollisionMain(x, y + 2, collisionSolid) && ySpeed >= 0)
        {
            switch terrainCurrent
            {
                case terrainSolid:
                    ground = true;
                    ySpeed = 0;
                break;

                case terrainPlatform:
                    // -- Check if we are above the platform
                    if (y < terrainID.y - 12 + ySpeed)
                    {
                        y = terrainID.y - 16;
                        ground = true;
                        ySpeed = 0;
                    }
                break;
            }
        }
    }
    else
    {
        // -- Check if leaving the ground
        if (!scrCollisionMain(x, y + 5, collisionSolid))
        {
            ground = false;
            terrainAngle = 0;
        }
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

    // -- Increase timer since the animation started
    animTime += 1;

    // -- Check if the animation has not ended
    if (animFinished == false && animSpeed != 0)
    {
        // -- Change the frame depending on the animation speed
        animFrame += animSpeed;

        if (floor(animFrame) > animFrameEnd)
        {
            // -- Repeat animation
            if(animRepeat == true)
            {
                animFrame = animFrameLoop;
            }
            else
            // -- Stop animation
            {
                animFrame = animFrameEnd;
                animFinished = true;
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
        // -- Check if the object is touching a wall or another object
        if place_meeting(physicalobj.x - 24, physicalobj.y - 3, parTerrain) //&& scrPhysicsReturnDir(physicalobj) <= 0
        || place_meeting(physicalobj.x + 24, physicalobj.y - 3, parTerrain) //&& scrPhysicsReturnDir(physicalobj) == 1
        {
            exit;
        }
        else
        {
            physicalobj.xSpeed = (x - xprevious);
            physicalobj.image_angle += x - xprevious;
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Interacting with level objects

    if (collision_check_fast(objTicket))
    {
        soundPlay(sndCollect)
        with (instance_nearest(x, y, objTicket))
        {
            instance_create(x, y, objTicketCollected);
            instance_destroy();
        }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw

    if global.debug
    {
        draw_sprite(sprite_index, image_index, floor(x), floor(y));

        if (instance_exists(parPhysic))
        {
            var near2;
            near2 = instance_nearest(x, y, parPhysic);
            draw_sprite(sprite_index, image_index, floor(near2.x + 24*sign(xSpeed)), floor(near2.y - 3));
        }
    }
    else
    draw_sprite_ext(animSprite, floor(min(animFrame, animFrameEnd)), floor(x), floor(y), xDir, image_yscale, 0, image_blend, image_alpha);
