/// scrCollisionMain(x, y, object)
 // -- Check the main sensor


    switch (argument2)
    {
        case collisionSolid:
            // -- Check solid
            if (place_meeting(floor(argument0),  floor(argument1), parSolid) == true)
            {
                var solidPlace;
                solidPlace = instance_place(floor(argument0),  floor(argument1), parSolid)
                terrainID      = solidPlace.id;
                terrainCurrent = "SOLID";
                return true;
            }

            // -- Check platform
            if (place_meeting(floor(argument0),  floor(argument1), parPlatform) == true && ySpeed >= 0)
            {
                var platformPlace;
                platformPlace = instance_place(floor(argument0),  floor(argument1), parPlatform);
                terrainID      = platformPlace.id
                terrainCurrent = "PLATFORM";
                return true;
            }
        break;


        default:
            return instance_place(floor(argument0),  floor(argument1), argument2);
    }
