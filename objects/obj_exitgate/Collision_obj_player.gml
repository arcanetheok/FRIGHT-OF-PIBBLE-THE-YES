if (image_index == 1 && global.panic == 0 && room != war_13)
{
    with (obj_player)
    {
        if (state == (95 << 0) && floor(image_index) == (image_number - 2))
        {
            scr_soundeffect(sfx_groundpound)
            with (obj_player1)
            {
                lastroom = room
                sprite_index = spr_Timesup
                image_index = 0
                with (obj_camera)
                {
                    shake_mag = 10
                    shake_mag_acc = (30 / room_speed)
                }
            }
            if (global.coop == 1)
            {
                with (obj_player2)
                {
                    lastroom = room
                    sprite_index = spr_Timesup
                    image_index = 0
                    with (obj_camera)
                    {
                        shake_mag = 10
                        shake_mag_acc = (30 / room_speed)
                    }
                }
            }
            other.image_index = 0
            ds_list_add(global.saveroom, other.id)
        }
    }
}
if (drop && dropstate != (126 << 0))
    return;
with (obj_player)
{
    if (grounded && x > (other.x - 160) && x < (other.x + 160) && key_up && (state == (0 << 0) || state == (103 << 0) || state == (104 << 0) || state == (121 << 0)) && (global.panic == 1 || global.snickchallenge == 1 || room == war_13))
    {
        var ex = x
        var ey = y
        var cx = camera_get_view_x(view_camera[0])
        var cy = camera_get_view_y(view_camera[0])
        rankpos_x = (ex - cx)
        rankpos_y = (ey - cy)
        if (global.timeattack == 1)
            obj_timeattack.stop = 1
        targetDoor = "none"
        obj_camera.alarm[2] = -1
        var roomname = room_get_name(room)
        var namestring = string_letters(roomname)
        scr_savescore(global.leveltosave)
        if (global.combo > 0)
        {
            global.combotime = 0
            global.combo = 0
            obj_camera.alarm[4] = -1
            for (var i = 0; i < global.comboscore; i += 10)
                create_collect((obj_player1.x + irandom_range(-60, 60)), ((obj_player1.y - 100) + irandom_range(-60, 60)), choose(1559, 1561, 1562, 1563, 1560))
            global.comboscore = 0
        }
        if (!instance_exists(obj_endlevelfade))
            instance_create(x, y, obj_endlevelfade)
        obj_player1.state = (112 << 0)
        obj_player1.sprite_index = obj_player1.spr_lookdoor
        if instance_exists(obj_player2)
        {
            obj_player2.state = (112 << 0)
            obj_player2.sprite_index = obj_player2.spr_lookdoor
            if global.coop
                obj_player2.visible = true
        }
        obj_endlevelfade.alarm[0] = 235
        image_index = 0
        global.panic = 0
        global.snickchallenge = 0
        gamesave_async_save()
    }
}
