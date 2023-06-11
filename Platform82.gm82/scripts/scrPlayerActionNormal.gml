/// scrPlayerActionNormal()

    // -- Update animation direction
    if (sign(xSpeed) != 0)
    {
        xDir = sign(xSpeed);
    }

    switch (ground)
    {
        case true:
            // -- Update horizontal movement
            xSpeed = scrMovementHorizontal(input.inputLeft, input.inputRight, xSpeed, phySpeedTop, phyAcc*global.delta, phyDec*global.delta, phyFrc*global.delta);

            // -- Idle animation
            if (xSpeed == 0)
            {
                scrAnimationApply("IDLE");
            }

            // -- Walk animation
            if (abs(xSpeed) > 0)
            {
                scrAnimationApply("WALK");
                animSpeed = max(0.08, (round(abs(xSpeed)/1.5)*1.5)/10);
            }

            // -- Jump
            if (input.inputActionPressed == true)
            {
                if (abs(xSpeed) > 4)
                {
                    xSpeed = 6*sign(xSpeed);
                }
                ySpeed = -6;
                ground = false;
                action = actionJump;
                scrAnimationApply("JUMP");
                soundPlay(sndJump)
            }

            // -- Crouch
            if (input.inputDown == true && xSpeed == 0)
            {
                action = actionCrouch;
                // -- Update collision
                sprite_index = maskPlayerCrouch;
                scrAnimationApply("CROUCH");
                y += 4;
            }
        break;

        case false:
            // -- Apply gravity when not on the ground
            ySpeed = scrApproach(ySpeed, 11, phyGrv*global.delta);
        break;
    }
