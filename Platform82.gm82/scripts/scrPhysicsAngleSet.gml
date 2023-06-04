/// scrPhysicsAngleSet(NumberOfAngles, Speed)

    switch (sign(argument1))
    {
        case 0:
        case 1:
            terrainAngle = round(point_direction(xprevious, yprevious, x, y)/(360/argument0))*(360/argument0)
        break;

        case -1:
            terrainAngle = (round(point_direction(xprevious, yprevious, x, y)/(360/argument0))*(360/argument0)) - 180
        break;
    }
