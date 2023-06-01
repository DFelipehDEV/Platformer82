/// scrMovementSlopes()
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
