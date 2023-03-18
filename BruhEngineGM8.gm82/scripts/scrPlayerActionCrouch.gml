/// scrPlayerActionCrouch()

    if (input.inputDown == false)
    {
        scrAnimationApply("IDLE");
        action = actionNormal;
        // -- Update collision
        sprite_index = maskPlayerNormal;

        y -= 6;
    }
