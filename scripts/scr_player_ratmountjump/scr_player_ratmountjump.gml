function scr_player_ratmountjump() //scr_player_ratmountjump
{
    move = (key_left + key_right)
    if (sprite_index == spr_lonegustavo_dashjump)
        image_speed = 0.6
    else
        image_speed = 0.35
    if key_jump
        input_buffer_jump = 0
    if ((!jumpstop) && vsp < 0.5 && (!key_jump2))
    {
        vsp /= 10
        jumpstop = 1
    }
    hsp = movespeed
    if ((place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || (abs(movespeed) < 8 && move != xscale) || abs(movespeed) <= 6)
    {
        gustavodash = 0
        ratmount_movespeed = 8
    }
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && gustavodash != 51)
        movespeed = 0
    if (move != 0)
    {
        if (move == xscale)
            movespeed = Approach(movespeed, (xscale * ratmount_movespeed), 0.5)
        else if (gustavodash == 51)
            movespeed = Approach(movespeed, 0, 0.5)
        else
            movespeed = Approach(movespeed, 0, 0.5)
    }
    else if (gustavodash == 51)
        movespeed = Approach(movespeed, 0, 0.5)
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if (move != xscale && move != 0)
    {
        ratmount_movespeed = 8
        xscale = move
    }
    if (jumpAnim && floor(image_index) == (image_number - 1))
    {
        jumpAnim = 0
        switch sprite_index
        {
            case spr_lonegustavo_jumpstart:
                sprite_index = spr_lonegustavo_jump
                break
            case 2465:
                sprite_index = spr_lonegustavo_dashjump
                break
            case 2757:
                sprite_index = spr_player_ratmountgroundpoundfall
                break
            case 2575:
                sprite_index = spr_player_ratmountfall
                break
            case 2396:
                sprite_index = spr_player_ratmountfall2
                break
            case 379:
                sprite_index = spr_player_ratmountballoonend3
                break
            case 30:
                jumpAnim = 1
                image_index = (image_number - 1)
                break
            case 1268:
                if (vsp > 0)
                {
                    jumpAnim = 1
                    sprite_index = spr_player_ratmountballoonend2
                }
                else
                    jumpAnim = 1
                break
        }

    }
    if key_down2
    {
        if brick
        {
            with (instance_create(x, y, obj_brickcomeback))
            {
                wait = 1
                instance_create(x, y, obj_genericpoofeffect)
            }
        }
        brick = 0
        movespeed = hsp
        state = (197 << 0)
        image_index = 0
        sprite_index = spr_lonegustavo_groundpoundstart
    }
    if (key_slap2 && brick)
        ratmount_kickbrick()
    else if (key_slap2 && (!brick))
    {
        state = (259 << 0)
        vsp = -6
        ratmountpunchtimer = 25
        image_index = 0
        if (move != 0)
            xscale = move
        movespeed = hsp
        sprite_index = spr_lonegustavo_punch
    }
    if (key_jump && brick)
    {
        state = (197 << 0)
        sprite_index = spr_lonegustavo_jumpstart
        image_index = 0
        image_speed = 0.35
        gustavokicktimer = 2
        brick = 0
        with (instance_create((x - (xscale * 10)), (y + 60), obj_ratmountgroundpound))
        {
            image_xscale = other.xscale
            image_index = 0
        }
    }
    if (key_jump2 && grounded && brick && vsp > 0)
    {
        state = (198 << 0)
        sprite_index = spr_player_ratmountbounce
        image_index = 0
        tauntstoredvsp = -14
        ratmount_fallingspeed = 0
    }
    else if (grounded && vsp > 0)
    {
        doublejump = 0
        create_particle(x, y, (12 << 0), 0)
        state = (191 << 0)
        landAnim = 1
        jumpstop = 0
        if brick
            sprite_index = spr_player_ratmountland
        image_index = 0
    }
    with (ratgrabbedID)
        scr_enemy_ratgrabbed()
    ratmount_shootpowerup()
    ratmount_dotaunt()
}

