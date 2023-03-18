/// scrMovementSlopes()


    if (ground && scrCollisionMain(x, y + 5, collisionSolid)
    && !scrCollisionMain(x + xSpeed, y, collisionSolid)
    && !(scrCollisionMain(x + xSpeed, y + 1, collisionSolid)))
    {
        x += xSpeed;

        // -- Go down
        repeat (abs(xSpeed) + 3)
        {
            if !(scrCollisionMain(x, y + 1, collisionSolid))
            {
                y += 1;
            }
        }
    }
    else // -- Go up
    {
        // -- Check if is meeting a solid
        if scrCollisionMain(x + xSpeed, y, collisionSolid)
        {
            slopeHeight = 0;

            // -- Keep adding 1 to slopeHeight until it's value is greater than our slope height or until the statement isn't true
            repeat (3 + abs(xSpeed))
            {
                if (scrCollisionMain(x + xSpeed, y - slopeHeight, collisionSolid) && slopeHeight <= 5)
                {
                    slopeHeight += 1;
                }
            }

            // -- If even after adding slopeHeight to our y coordinate would result in a collision, that means we are moving into a wall
            if scrCollisionMain(x + xSpeed, y - slopeHeight, collisionSolid)
            {
                repeat (3 + abs(xSpeed))
                {
                    // -- Move up with the slope x
                    if (!scrCollisionMain(x + sign(xSpeed), y, collisionSolid))
                    {
                        x += sign(xSpeed);
                    }
                }
                switch (terrainCurrent)
                {
                    case "SOLID":
                        xSpeed = 0;
                    break;
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


    repeat (abs(xSpeed) + 1)
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
