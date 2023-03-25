#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// -- Disable outside objects


    // -- Deactivate all instances except for parActive and objPlayer
    instance_deactivate_all(1);
    instance_activate_object(parActive);
    instance_activate_object(objPlayer);

    // -- Activate instances within the view plus a buffer of 32 pixels
    instance_activate_region(view_xview[0] - 32, view_yview[0] - 32, view_wview[0] + 64, view_hview[0] + 64, 1);

    // -- Activate the camera's target object if it exists
    if (instance_exists(objCamera)) 
    {
        instance_activate_object(objCamera.camTarget);
    }
