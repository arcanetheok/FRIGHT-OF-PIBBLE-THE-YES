function scr_player_mortjump() //scr_player_mortjump
{
    image_speed = 0.35
    move = (key_left + key_right)
    hsp = movespeed
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
    {
        jumpstop = 1
        vsp /= 20
    }
    if (move != 0)
    {
        if (move == xscale)
            movespeed = Approach(movespeed, (xscale * 8), 0.5)
        else
            movespeed = Approach(movespeed, 0, 0.5)
        if (movespeed <= 0)
            xscale = move
    }
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        movespeed = 0
        if (sprite_index == spr_player_barrelmove)
            sprite_index = spr_player_barrelidle
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_player_mortjumpstart)
            sprite_index = spr_player_mortjump
        else if (sprite_index == spr_player_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
            sprite_index = spr_mortdoublejump
    }
    if (grounded && vsp > 0.5)
    {
        if (input_buffer_jump < 8)
        {
            input_buffer_jump = 8
            state = (12 << 0)
            vsp = -14
            sprite_index = spr_player_mortjumpstart
            image_index = 0
            doublejump = 0
            jumpstop = 0
            scr_soundeffect(sfx_jump)
            create_particle(x, y, (5 << 0), 0)
        }
        else
        {
            state = (11 << 0)
            landAnim = 1
            sprite_index = spr_land
            image_index = 0
        }
    }
    else if ((!doublejump) && key_jump)
    {
        scr_soundeffect(sfx_jump)
        jumpstop = 0
        input_buffer_jump = 8
        doublejump = 1
        state = (12 << 0)
        sprite_index = spr_player_mortdoublejump
        image_index = 0
        vsp = -11
        repeat (4)
            create_debris(x, y, 1149)
    }
    mort_attack()
}

