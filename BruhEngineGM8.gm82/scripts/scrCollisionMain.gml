/// scrCollisionMain(X, Y, Object)
 // -- Check the main sensor

    switch (argument2)
    {
        case collisionSolid:
            solidPlace = instance_place(floor(argument0), floor(argument1), parSolid)
            // -- Check solid
            if (solidPlace)
            {
                terrainID      = solidPlace.id;
                terrainCurrent = terrainSolid;
                return true;
            }

            platformPlace = instance_place(floor(argument0), floor(argument1), parPlatform);
            // -- Check platform
            if (platformPlace)
            {
                terrainID      = platformPlace.id
                terrainCurrent = terrainPlatform;
                if (ySpeed >= 0)
                {
                    return true;
                }
            }
            terrainCurrent = 0;
        break;


        default:
            return instance_place(floor(argument0), floor(argument1), argument2);
    }

    return false;
