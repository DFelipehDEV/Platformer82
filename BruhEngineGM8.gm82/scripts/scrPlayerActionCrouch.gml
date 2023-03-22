/// scrPlayerActionCrouch()


    if (input.inputDown == false)
    {
        animFrame = max(animFrame - 0.4, animFrameStart);


        if (floor(animFrame) == 0)
        {
            scrAnimationApply("IDLE");
            action = actionNormal;
            // -- Update collision
            sprite_index = maskPlayerNormal;

            y -= 6;
        }
    }
