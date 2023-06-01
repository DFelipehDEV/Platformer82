/// scrAnimationApply(Animation)

    if (animIndex != argument0)
    {
        // -- Keep the last animation in track
        animPrevious = animIndex;
        animIndex = argument0;

        // -- Update animation
        scrPlayer1Animations();

        // -- Reset frame
        if (animReset == true)
        {
            animFrame = animFrameStart;
        }

        animFinished   = false;
        animTime       = 0;
    }
