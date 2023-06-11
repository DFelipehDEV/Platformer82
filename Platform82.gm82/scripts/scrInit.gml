/// scrInit()


    instance_create(0, 0, objControllerInput);
    instance_create(0, 0, objControllerRender);
    instance_create(0, 0, objControllerRoom);
    instance_create(0, 0, objControllerRes);

    global.sfxVolume = 1;
    global.debug = -1;
    global.delta = 0;

    room_goto_next();
