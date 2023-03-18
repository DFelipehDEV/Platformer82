/// scrAnimationSet(Sprite, frame start, frame end, frame loop, speed, frame reset, frame repeat)



    animSprite         =   argument0;
    animFrameStart     =   argument1;

    if (argument2 == -1)
    {
        animFrameEnd    = sprite_get_number(argument0) - 1;
    }
    else
    {
        animFrameEnd    = argument2;
    }


    if (argument3 == -1)
    {
        animFrameLoop  =   0;
    }
    else
    {
        animFrameLoop  =   argument3;
    }

    animSpeed       =   argument4;
    animReset       =   argument5;
    animRepeat      =   argument6;
