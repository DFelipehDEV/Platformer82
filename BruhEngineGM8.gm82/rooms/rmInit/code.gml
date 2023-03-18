/// -- Init


    instance_create(0, 0, objControllerInput);
    instance_create(0, 0, objControllerRender);
    instance_create(0, 0, objControllerRoom);
    instance_create(0, 0, objControllerRes);

    global.playerHealth = 100;
    global.playerCold = 100;
    global.playerHunger = 100;
    global.playerWeight = 70;

    global.debug = -1;

    //application_surface_draw_enable(false)
    room_goto_next();
