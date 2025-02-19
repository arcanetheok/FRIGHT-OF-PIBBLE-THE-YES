if (room == custom_lvl_room)
    tile_layer_delete_at(1, x, y)
if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (2)
    {
        with (create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), 2619, 1))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
            image_speed = 0.35
        }
    }
    with (instance_create((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), obj_parryeffect))
    {
        sprite_index = spr_deadjohnsmoke
        image_speed = 0.35
    }
    scr_sleep(5)
    tile_layer_delete_at(1, x, y)
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1)
        audio_stop_sound(sfx_breakblock2)
    }
    scr_soundeffect(sfx_breakblock1, 16)
    ds_list_add(global.saveroom, id)
}
