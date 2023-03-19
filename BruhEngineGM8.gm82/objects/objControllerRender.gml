#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Disable outside objects


    instance_deactivate_all(1);

    instance_activate_object(parActive);
    instance_activate_object(objPlayer);

    instance_activate_region(view_xview[0]-64, view_yview[0]-64, (view_wview[0]+64) + 64, (view_hview[0]+64) + 64, 1);

    if (instance_exists(objCamera))
    {
        instance_activate_object(objCamera.camTarget);
    }
