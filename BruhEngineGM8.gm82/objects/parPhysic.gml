#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    ySpeed = 0;             // -- Vertical speed (air)

    ground = 0;             // -- 0 - in air // -- 1 - in ground


    slopeHeight = 0;        // -- Slope height used while going up
    terrainID = 0;          // -- ID of the meeting terrain
    terrainCurrent = "";    // -- Weather is meeting a solid or a platform

    pSpeed = 0;     // -- Physical speed
    image_speed = 0
    terrainAngle = 0;

    drawX = x;
    drawY = y;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Main movement


// -- Main movement
var i;

if (ground && scrCollisionMain(x, y + 5, collisionSolid) &&
    !scrCollisionMain(x + pSpeed, y, collisionSolid) &&
    !scrCollisionMain(x + pSpeed, y + 1, collisionSolid))
{
    x += pSpeed;

    for (i = 0; i < abs(pSpeed) + 2; i += 1)
    {
        // -- Go down
        if (!(scrCollisionMain(x, y + 1, collisionSolid)))
        {
            y += 1;
        }
    }
}
else // -- Go up
{
    // -- Check if is meeting a solid
    var collisionMain;
    collisionMain = scrCollisionMain(x + pSpeed, y, collisionSolid);

    if (collisionMain)
    {
        slopeHeight = 0;

        for (i = 0; i < 4 + abs(pSpeed); i += 1)
        {
            // -- Keep adding 1 to slopeHeight until it's value is greater than our slope height or until the statement isn't true
            var collisionSlope;
            collisionSlope = scrCollisionMain(x + pSpeed, y - slopeHeight, collisionSolid);

            if (collisionSlope && slopeHeight <= 5)
            {
                slopeHeight += 1;
            }
        }

        // -- Check if we are colliding a wall and not a slope
        var collisionWall;
        collisionWall = scrCollisionMain(x + pSpeed, y - slopeHeight, collisionSolid);

        if (collisionWall)
        {
            for (i = 0; i < 2 + abs(pSpeed); i += 1)
            {
                // -- Move up with the slope x
                var collisionX;
                collisionX = scrCollisionMain(x + sign(pSpeed), y, collisionSolid);

                if (!(collisionX))
                {
                    x += sign(pSpeed);
                }
            }
            pSpeed = 0;
        }
        else // -- Otherwise, we are moving up a slope
        {
            y -= slopeHeight;
        }
    }

    // -- Approach to the pSpeed
    x += pSpeed;
}

for (i = 0; i < abs(pSpeed) + 1; i += 1)
{
    // -- Vertical movement
    var collisionVertical;
    collisionVertical = scrCollisionMain(x, y + ySpeed, parSolid);

    if (collisionVertical)
    {
        // -- Leave the solid
        var collisionLeave;
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


/*
    if (ground && scrCollisionMain(x, y + 5, collisionSolid)
    && !scrCollisionMain(x + pSpeed, y, collisionSolid)
    && !(scrCollisionMain(x + pSpeed, y + 1, collisionSolid)))
    {
        x += pSpeed;


        repeat (abs(pSpeed) + 2)
        {
            // -- Go down
            if !(scrCollisionMain(x, y + 1, collisionSolid))
            {
                y += 1;
            }
        }
    }
    else // -- Go up
    {
        // -- Check if is meeting a solid
        if scrCollisionMain(x + pSpeed, y, collisionSolid)
        {
            slopeHeight = 0;

            repeat (4 + abs(pSpeed))
            {
                // -- Keep adding 1 to slopeHeight until it's value is greater than our slope height or until the statement isn't true
                if (scrCollisionMain(x + pSpeed, y - slopeHeight, collisionSolid) && slopeHeight <= 5)
                {
                    slopeHeight += 1;
                }
            }

            // -- Check if we are colliding a wall and not a slope
            if scrCollisionMain(x + pSpeed, y - slopeHeight, collisionSolid)
            {
                repeat (2 + abs(pSpeed))
                {
                    // -- Move up with the slope x
                    if (!scrCollisionMain(x + sign(pSpeed), y, collisionSolid))
                    {
                        x += sign(pSpeed);
                    }
                }
                pSpeed = 0;
            }
            else // -- Otherwise, we are moving up a slope
            {
                y -= slopeHeight;
            }
        }
        // -- Approach to the pSpeed
        x += pSpeed;
    }

    repeat (abs(pSpeed) + 1)
    {
        // -- Vertical movement
        if (scrCollisionMain(x, y + ySpeed, parSolid))
        {
            // -- Leave the solid
            if !(scrCollisionMain(x, y + sign(ySpeed), parSolid))
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
/// -- Vertical movement


    switch(ground)
    {
        // -- In mid air
        case 0:
            ySpeed = scrApproach(ySpeed, 8, 0.23);
            // -- Land
            if (scrCollisionMain(x, y + 4, collisionSolid) && ySpeed >= 0)
            {
                ground = true;
                /*if (scrCollisionMain(x - 1, y + 4, collisionSolid) || scrCollisionMain(x + 1, y + 4, collisionSolid))
                {
                    scrPhysicsAngleSet(32, pSpeed)
                }
                pSpeed -= dsin(terrainAngle) * ySpeed;
                */
                ySpeed = 0;
            }
        break;

        // -- In ground
        case 1:
            // -- Leave the ground
            if (!scrCollisionMain(x, y + 4, collisionSolid))
            {
                ground = false;
            }
        break;
    }


    //pSpeed = xprevious - x
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Collision with other objects


    var near;
    near = instance_place(x, y, parInteractable);


    // -- Unclip
    if (near != noone)
    {
        x -= sign(near.x - x);
        y -= sign(near.y - y);

        pSpeed -= sign(near.x - x);
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Physics

    // -- Getting stuck in a wall
    if (slopeHeight == 6)
    {
        // -- Leave the ground
        if (place_meeting(x, y - 1, parTerrain) || place_meeting(x, y, parTerrain))
        {
            y -= 1;
        }


        if (place_meeting(x - sign(xprevious - x), y - sign(yprevious - y), parTerrain))
        {
            // -- Check for free space
            if (collision_point(x + 16, y, parTerrain, 0, 1) == false)
            {
                x -= 2;
                y -= 0.5;
            }
            else
            {
                x += 2;
                y -= 0.5;
            }
        }
        else
        {
            slopeHeight = 0;
        }
    }


    if (ground == true)
    {
        scrPhysicsAngleSet(32, pSpeed)
    }


    // -- Gain or loose slope speed
    if pSpeed < 0
    {
        if terrainAngle > 180 pSpeed -= 0.082*dsin(terrainAngle);
        else if terrainAngle < 180 pSpeed -= 0.2*dsin(terrainAngle);
    }
    else if pSpeed > 0
    {
        if terrainAngle < 180 pSpeed -= 0.082*dsin(terrainAngle);
        else if terrainAngle > 180 pSpeed -= 0.2*dsin(terrainAngle);
    }


    // -- Loose speed
    pSpeed -= min(abs(pSpeed), 0.05) * sign(pSpeed);

    image_angle += pSpeed*2;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Draw


    drawX = lerp(drawX, x, 0.15 + abs(pSpeed)/25);
    drawY = lerp(drawY, y, 0.15 + abs(pSpeed)/25);
    draw_sprite_ext(sprite_index, 0, drawX, drawY, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
