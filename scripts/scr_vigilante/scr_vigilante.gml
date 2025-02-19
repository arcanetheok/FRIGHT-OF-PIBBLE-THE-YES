function scr_vigilante_walk() //scr_vigilante_walk
{
    image_speed = 0.35
    image_xscale = -1
    if (abs((targetplayer.x - x)) < 400)
        move = -1
    else if (abs((targetplayer.x - x)) > 550)
        move = 0
    if (x > targetplayer.x)
        move = -1
    switch walkstate
    {
        case (134 << 0):
            if (sprite_index != spr_playerV_fall && sprite_index != spr_playerV_move)
                sprite_index = spr_playerV_move
            else if (sprite_index == spr_playerV_move && floor(image_index) == (image_number - 1))
                sprite_index = spr_playerV_move
            if (move != 0)
            {
                image_xscale = move
                movespeed = Approach(movespeed, 8, 0.5)
            }
            else
                movespeed = Approach(movespeed, 2, 0.5)
            if (!grounded)
                sprite_index = spr_playerV_fall
            else if (vsp > 0 && sprite_index == spr_playerV_bootsfall)
            {
                sprite_index = spr_playerV_land
                image_index = 0
            }
            if (movespeed >= 8)
            {
                walkstate = (104 << 0)
                sprite_index = spr_playerV_mach1
                image_index = 0
            }
            break
        case (104 << 0):
            image_speed = 0.6
            if ((sprite_index == spr_playerV_mach1 || sprite_index == spr_playerV_bootsland) && floor(image_index) == (image_number - 1))
                sprite_index = spr_playerV_bootsmove
            if (move == 0)
                movespeed = Approach(movespeed, 5, 0.5)
            if (!grounded)
                sprite_index = spr_playerV_bootsfall
            else if (vsp > 0 && sprite_index == spr_playerV_bootsfall)
            {
                sprite_index = spr_playerV_bootsland
                image_index = 0
            }
            if (movespeed <= 5)
            {
                walkstate = (105 << 0)
                sprite_index = spr_playerV_machslidestart
                image_index = 0
            }
            break
        case (105 << 0):
            if (floor(image_index) == (image_number - 1))
            {
                if (sprite_index == spr_playerV_machslidestart)
                    sprite_index = spr_playerV_machslideend
                else
                    walkstate = (134 << 0)
            }
            break
    }

    if (x > targetplayer.x)
        movespeed = Approach(movespeed, 20, 0.5)
    hsp = (image_xscale * movespeed)
    if (targetspot != oldtargetspot && grounded && vsp > 0 && distance_to_object(targetspot) < 400)
    {
        oldtargetspot = targetspot
        calculate_jump_velocity_alt(targetspot.x, targetspot.y, 20, grav)
        state = (92 << 0)
        sprite_index = spr_playerV_jump
        image_index = 0
    }
    else if (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y))
    {
        mask_index = spr_crouchmask
        if ((!(place_meeting((x + hsp), y, obj_solid))) && (!(scr_solid_slope((x + hsp), y))))
            state = (100 << 0)
        else
        {
            mask_index = spr_player_mask
            state = (37 << 0)
            wallspeed = 0
            if (wallspeed < 8)
                wallspeed = 8
        }
    }
}

function scr_vigilante_jump() //scr_vigilante_jump
{
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_jump)
        sprite_index = spr_playerV_fall
    if (scr_solid(x, (y + vsp)) && (!(scr_solid(x, y))) && vsp > 0)
    {
        sprite_index = spr_playerV_land
        image_index = 0
        image_xscale = 1
        hsp = 0
        switch targetspot.attack
        {
            case (0 << 0):
                state = (2 << 0)
                shot = 0
                cooldown = 10
                hsp = 0
                break
            case (3 << 0):
                state = (1 << 0)
                cooldown = 10
                revolver = 80
                hsp = 0
                break
            case (1 << 0):
            case (2 << 0):
                state = (74 << 0)
                attack = targetspot.attack
                cooldown = 10
                times = 3
                count = 4
                timer = 1
                timermax = 10
                if (attack == (1 << 0))
                {
                    times = 5
                    count = 1
                    timer = 1
                    timermax = 10
                }
                timescount = times
                break
            case (4 << 0):
                sprite_index = spr_playerV_jump
                image_index = 0
                state = (122 << 0)
                targetx = (x + 500)
                targety = (y - 100)
                calculate_jump_velocity_alt((targetx + 300), targety, 20, grav)
                vsp = -14
                create_particle(x, y, (5 << 0))
                break
        }

    }
}

function scr_vigilante_freefallprep() //scr_vigilante_freefallprep
{
    if (sprite_index != spr_playerV_bodyslamprep)
    {
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_jump)
            sprite_index = spr_playerV_fall
        if (vsp >= 0)
        {
            sprite_index = spr_playerV_bodyslamprep
            image_index = 0
            hsp = 0
            vsp = -8
            state = (108 << 0)
        }
    }
    else if (floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_playerV_bodyslam
        state = (108 << 0)
    }
}

function scr_vigilante_freefall() //scr_vigilante_freefall
{
    if (sprite_index == spr_playerV_bodyslamprep && floor(image_index) == (image_number - 1))
        sprite_index = spr_playerV_bodyslam
    move = sign((targetplayer.x - x))
    if (x > (targetplayer.x - 32) && x < (targetplayer.x + 32))
        move = 0
    with (obj_player)
    {
        if place_meeting(x, y, other)
        {
            var s = state
            scr_hurtplayer(id)
            if (s != state)
                other.hit = 1
        }
    }
    hsp = Approach(hsp, (move * 3), 0.5)
    if (grounded && vsp > 0)
    {
        scr_soundeffect(sfx_groundpound)
        state = (111 << 0)
        hsp = 0
        sprite_index = spr_playerV_bodyslamland
        create_particle(x, y, (12 << 0))
        image_index = 0
    }
}

function scr_vigilante_freefallland() //scr_vigilante_freefallland
{
    if (floor(image_index) == (image_number - 1))
    {
        state = (134 << 0)
        sprite_index = spr_playerV_idle
        image_index = 0
        if (!hit)
            oldtargetspot = -4
    }
}

function scr_vigilante_throwing() //scr_vigilante_throwing
{
    image_speed = 0.35
    if (floor(image_index) == (image_number - 1))
    {
        s = sprite_index
        switch sprite_index
        {
            case spr_playerV_land:
                sprite_index = spr_playerV_idle
                break
            case 2366:
                sprite_index = spr_playerV_idle
                break
        }

        if (s != sprite_index)
            image_index = 0
    }
    if (cooldown > 0)
        cooldown--
    else if (timescount > 0 && sprite_index != spr_playerV_dynamitethrow && (!(place_meeting(x, y, obj_electricpotato))))
    {
        timescount--
        sprite_index = spr_playerV_dynamitethrow
        image_index = 0
        switch attack
        {
            case (1 << 0):
                with (instance_create((x + (image_xscale * 8)), (y - 16), obj_cow))
                {
                    vsp = -6
                    image_xscale = other.image_xscale
                    offscreen = 1
                    state = (134 << 0)
                }
                break
            case (2 << 0):
                with (instance_create((x + (image_xscale * 8)), (y - 16), obj_electricpotato))
                {
                    move = 1
                    distance = 800
                }
                break
        }

    }
    else if (timescount == 0)
    {
        cooldown = (300 - (wastedhits * 10))
        timescount = times
    }
}

function scr_vigilante_revolver() //scr_vigilante_revolver
{
    image_speed = 0.35
    if (floor(image_index) == (image_number - 1))
    {
        s = sprite_index
        switch sprite_index
        {
            case spr_playerV_land:
                sprite_index = spr_playerV_idle
                break
            case 2360:
                sprite_index = spr_playerV_revolverhold
                break
            case 2363:
                sprite_index = spr_playerV_revolverend
                break
            case 2364:
                sprite_index = spr_playerV_idle
                break
        }

        if (s != sprite_index)
            image_index = 0
    }
    if (cooldown > 0)
        cooldown--
    else if (revolver > 0)
    {
        revolver--
        if (sprite_index != spr_playerV_revolverstart && sprite_index != spr_playerV_revolverhold)
        {
            sprite_index = spr_playerV_revolverstart
            image_index = 0
        }
    }
    else if (sprite_index != spr_playerV_revolvershoot)
    {
        sprite_index = spr_playerV_revolvershoot
        image_index = 0
        cooldown = (120 - (wastedhits * 10))
        revolver = 80
        scr_soundeffect(sfx_killingblow)
        with (instance_create(x, y, obj_enemybullet))
        {
            image_xscale = other.image_xscale
            spd = 16
        }
    }
}

function scr_vigilante_dynamite() //scr_vigilante_dynamite
{
    image_speed = 0.35
    if (floor(image_index) == (image_number - 1))
    {
        s = sprite_index
        switch sprite_index
        {
            case spr_playerV_land:
                sprite_index = spr_playerV_idle
                break
            case 2366:
                sprite_index = spr_playerV_idle
                break
        }

        if (s != sprite_index)
            image_index = 0
    }
    if (cooldown > 0)
        cooldown--
    else
    {
        cooldown = (120 - (wastedhits * 10))
        sprite_index = spr_playerV_dynamitethrow
        image_index = 0
        with (instance_create((x + (image_xscale * 8)), (y - 16), obj_dynamite))
        {
            image_xscale = other.image_xscale
            playerid = other.id
            obj_explosion = 376
            movespeed = 8
            vsp = -6
        }
    }
}

function scr_vigilante_climbwall() //scr_vigilante_climbwall
{
    sprite_index = spr_playerV_wallclimb
    hsp = 0
    vsp = (-wallspeed)
    if (wallspeed < 8)
        wallspeed += 0.5
    if (!(scr_solid((x + image_xscale), y)))
    {
        state = (134 << 0)
        walkstate = (104 << 0)
        movespeed = 8
        vsp = 0
        hsp = (image_xscale * movespeed)
        sprite_index = spr_playerV_bootsmove
    }
}

function scr_vigilante_crouch() //scr_vigilante_crouch
{
    sprite_index = spr_playerV_crouchmove
    hsp = (image_xscale * movespeed)
    mask_index = spr_crouchmask
    if (!(place_meeting(x, (y - 16), obj_solid)))
    {
        state = (134 << 0)
        movespeed = 8
        sprite_index = spr_playerV_mach1
        image_index = 0
    }
}

