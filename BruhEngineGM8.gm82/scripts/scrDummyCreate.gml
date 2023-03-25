/// scrDummyCreate(Sprite, Image, X, Y, XScale, YScale, Angle, Alpha, AnimSpeed, RepeatTimes, Depth, BlendMode, Color)
 // -- Creates a dummy effect

    with (instance_create(argument2, argument3, parDummy))
    {
        sprite_index = argument0;
        image_index = argument1;
        image_xscale = argument4;
        image_yscale = argument5;
        image_angle = argument6;
        image_alpha = argument7;
        image_speed = argument8;

        repeatTimes = argument9;

        depth = argument10;

        blendMode = argument11;

        image_blend = argument12;
    }
