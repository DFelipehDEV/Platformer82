#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Variables

    collectedTimer = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Collected

    collectedTimer = min(collectedTimer + 2 * global.delta, 90);

    if (collectedTimer < 40)
    {
        x = lerp(x, objPlayer.x, 0.15 * global.delta);
        y = scrEasings(collectedTimer, objPlayer.y, -40, 40, "easeOutBack");
    }
    else
    {
        x = lerp(x, objPlayer.x, 0.3 * global.delta);
        y = lerp(y, objPlayer.y, 0.15 * global.delta);
    }

    if (collectedTimer >= 55)
    {

        x = objPlayer.x;
        y = objPlayer.y;
        image_xscale = lerp(image_xscale, -dsin(collectedTimer*2)*4, 0.15 * global.delta)
        image_yscale = image_xscale

        image_alpha -= 0.02 * global.delta;
        if (collectedTimer == 90)
        {
            repeat(3)
            {
                scrDummyCreate(choose(sprVFXSparkle1, sprVFXSparkle2), 0, x + irandom_range(20, -20), y + irandom_range(20, -20), 1, 1, irandom(360), 1, 0.4 * global.delta, 0, -2, bm_normal, c_white)
            }
            instance_destroy();
        }
    }
