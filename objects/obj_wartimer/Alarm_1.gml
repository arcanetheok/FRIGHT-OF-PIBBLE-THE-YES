if (room != rank_room)
{
    with (obj_player)
    {
        targetDoor = "A"
        room = timesuproom
        state = (64 << 0)
        sprite_index = spr_Timesup
        image_index = 0
        audio_stop_all()
        scr_soundeffect(mu_timesup)
    }
    instance_create(0, 0, obj_timesupwar)
    instance_destroy()
}
