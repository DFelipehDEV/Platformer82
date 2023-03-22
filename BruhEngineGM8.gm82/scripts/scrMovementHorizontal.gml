/// scrMovementHorizontal(InputLeft, InputRight, XSpeed, XSpeedMax, Accelerate, Decelerate, Friction)



    var speeds;
    speeds = argument2;


    // -- If key left is being pressed
    if (argument0 == true)
    {
        switch (sign(speeds))
        {
            case 0:
            case -1:
                speeds = scrApproach(speeds, -argument3, argument4);
            break;


            case 1:
                speeds = scrApproach(speeds, 0, argument6);
            break;
        }
    }
    else if (argument1 == true)
    {
        switch (sign(speeds))
        {
            case 0:
            case 1:
                speeds = scrApproach(speeds, argument3, argument4);
            break;


            case -1:
                speeds = scrApproach(speeds, 0, argument6);
            break;
        }
    }
    else
    {
        speeds = scrApproach(speeds, 0, argument5);
    }

    return speeds;
