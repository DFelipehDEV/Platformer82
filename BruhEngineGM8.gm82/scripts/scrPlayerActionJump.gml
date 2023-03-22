/// scrPlayerActionJump()


    // -- Animation direction
    if (sign(xSpeed) != 0)
    {
        xDir = sign(xSpeed);
    }

    xSpeed = scrMovementHorizontal(input.inputLeft, input.inputRight, xSpeed, 5, 0.04, 0.12, 0.13);

    switch (ground)
    {
        case 1:
            action = actionNormal;
        break;


        case 0:
            // -- Gravity
            ySpeed = scrApproach(ySpeed, 8, phyGravDefault);
            switch (sign(ySpeed))
            {
                case 1:
                    scrAnimationApply("FALL");
                break;


                case -1:
                    if (input.inputAction == false)
                    {
                        ySpeed = -0.05;
                    }
                break;
            }
        break;
    }
