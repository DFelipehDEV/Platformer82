/// scrMovementSlopes()
/// -- Main movement

    // -- Main movement
    var i;

    if (ground && scrCollisionMain(x, y + 5, collisionSolid) &&
        scrCollisionMain(x + xSpeed, y + 5, collisionSolid) &&
        !scrCollisionMain(x + xSpeed, y, collisionSolid) &&
        !scrCollisionMain(x + xSpeed, y + 1, collisionSolid))
    {
        x += xSpeed;

        for (i = 0; i < floor(abs(xSpeed)) + 1; i += 1)
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
        collisionMain = scrCollisionMain(x + xSpeed, y, collisionSolid);

        if (collisionMain)
        {
            slopeHeight = 0;

            for (i = 0; i < floor(abs(xSpeed)) + 1; i += 1)
            {
                // -- Keep adding 1 to slopeHeight until it's value is greater than our slope height or until the statement isn't true
                var collisionSlope;
                collisionSlope = scrCollisionMain(x + xSpeed, y - slopeHeight, collisionSolid);

                if (collisionSlope && slopeHeight <= 5)
                {
                    slopeHeight += 1;
                }
            }

            // -- Check if we are colliding a wall and not a slope
            var collisionWall;
            collisionWall = scrCollisionMain(x + xSpeed, y - slopeHeight, collisionSolid);

            if (collisionWall)
            {
                //for (i = 0; i < 2 + abs(xSpeed); i += 1)
                {
                    // -- Move up with the slope x
                    var collisionX;
                    collisionX = scrCollisionMain(x + sign(xSpeed), y, collisionSolid);

                    if (!(collisionX))
                    {
                        x += sign(xSpeed);
                    }
                }
                if (terrainCurrent == terrainSolid)
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

    for (i = 0; i < abs(xSpeed) + 1; i += 1)
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
