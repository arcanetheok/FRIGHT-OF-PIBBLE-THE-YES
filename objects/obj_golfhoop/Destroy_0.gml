if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id)
    if audio_is_playing(sfx_collecttopping)
        audio_stop_sound(sfx_collecttopping)
    scr_soundeffect(sfx_collecttopping)
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    with (obj_camera)
        healthshaketime = 30
    global.collect += 50
    with (instance_create(x, y, obj_smallnumber))
        number = string(50)
    create_particle(x, y, (9 << 0), 0)
}
