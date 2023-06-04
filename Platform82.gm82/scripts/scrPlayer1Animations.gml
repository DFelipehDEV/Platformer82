/// scrPlayer1Animations()


    // scrAnimationSet(Sprite, frame start, frame end, frame loop, speed, frame reset, frame repeat)
    switch (animIndex)
    {
        // -- Idle animation
        case "IDLE":
            scrAnimationSet(sprPlayerIdle, 0, -1, 0, 0.2, 1, 1);
        break;

        // -- Crouch animation
        case "CROUCH":
            scrAnimationSet(sprPlayerCrouch, 0, -1, 0, 0.32, 1, 0);
        break;

        // -- Walk animation
        case "WALK":
            scrAnimationSet(sprPlayerWalk, 0, -1, 0, 0, 1, 1);
        break;

        // -- Jump animation
        case "JUMP":
            scrAnimationSet(sprPlayerJump, 0, -1, 0, 0.27, 1, 0);
        break;

        // -- Falling animation
        case "FALL":
            scrAnimationSet(sprPlayerFall, 0, -1, 3, 0.25, 1, 1);
        break;
    }
