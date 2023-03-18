/// scrPlayerActionNormal()


    // -- Animation direction
    if (sign(xSpeed) != 0)
    {
        xDir = sign(xSpeed);
    }

    switch (ground)
    {
        case 1:
            xSpeed = scrMovementHorizontal(input.inputLeft, input.inputRight, xSpeed, 5, 0.08, 0.19, 0.28);
            // -- Idle animation
            if (xSpeed == 0)
            {
                scrAnimationApply("IDLE");
            }


            // -- Walk animation
            if (abs(xSpeed) > 0 && abs(xSpeed) < 4.5)
            {
                scrAnimationApply("WALK");
                animSpeed = (round(abs(xSpeed)/1.5)*1.5)/15
            }

            // -- Run animation
            if (abs(xSpeed) >= 4.5)
            {
                scrAnimationApply("RUN");
                animSpeed = (round(abs(xSpeed)/1.5)*1.5)/10
            }

            // -- Jump
            if (input.inputActionPressed == true)
            {
                if (abs(xSpeed) > 4)
                {
                    xSpeed = 6*sign(xSpeed);
                }
                ySpeed = -5;
                ground = false;
                action = actionJump;

                scrAnimationApply("JUMP");
            }

            // -- Look up
            if (input.inputUp == true && xSpeed == 0)
            {
                action = actionLookup;
                scrAnimationApply("LOOKUP");
            }


            // -- Crouch
            if (input.inputDown == true && xSpeed == 0)
            {
                action = actionCrouch;
                // -- Update collision
                sprite_index = maskPlayerCrouch;
                scrAnimationApply("CROUCH");

                y += 3;
            }
        break;

        case 0:
            ySpeed = scrApproach(ySpeed, 8, 0.23);
        break;
    }
