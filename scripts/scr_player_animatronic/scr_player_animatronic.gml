function scr_player_animatronic() //scr_player_animatronic
{
    sprite_index = spr_pepanimatronic
    move = (key_left + key_right)
    hsp = (move * movespeed)
    if (vsp < 0 && (!key_jump2) && (!jumpstop))
    {
        jumpstop = 1
        vsp /= 10
    }
    if key_jump
        input_buffer_jump = 0
    if (move != 0)
    {
        xscale = move
        movespeed = 4
    }
    else
        movespeed = 0
    if (animatronic_buffer > 0)
        animatronic_buffer--
    else
    {
        repeat (3)
            create_debris(x, y, 1475)
        state = (0 << 0)
    }
    if (animatronic_collect_buffer > 0)
        animatronic_collect_buffer--
    else
    {
        animatronic_collect_buffer = 30
        if (global.collect > 0)
        {
            global.collect -= 5
            repeat (10)
                create_debris(x, y, choose(1559, 1562, 1561, 1560, 1563), 1)
        }
    }
    if (grounded && vsp > 0 && input_buffer_jump < 8)
    {
        input_buffer_jump = 8
        vsp = -9
        jumpstop = 0
    }
}

