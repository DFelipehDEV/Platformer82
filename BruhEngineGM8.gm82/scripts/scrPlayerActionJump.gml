/// scrPlayerActionJump()


    // -- Animation direction
    if (sign(xSpeed) != 0)
    {
        xDir = sign(xSpeed);
    }

    // -- Horizontal movement
    xSpeed = scrMovementHorizontal(input.inputLeft, input.inputRight, xSpeed, phySpeedTop, phyAcc/2, phyDec/2, phyFrc/2);

    switch (ground)
    {
        case 1:
            // -- Reset state when touching the ground
            action = actionNormal;
        break;


        case 0:
            // -- Apply gravity
            ySpeed = scrApproach(ySpeed, 8, phyGrv);
            switch (sign(ySpeed))
            {
                case 1:
                    // -- Set falling animation in case the YSpeed > 0
                    scrAnimationApply("FALL");
                break;


                case -1:
                    // -- Check if its holding the jump input
                    if (input.inputAction == false)
                    {
                        // -- Cancel the jump
                        ySpeed = -phyGravDefault;
                    }
                break;
            }
        break;
    }
