function scr_player_tumble() //scr_player_tumble
{
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    hsp = ((xscale * movespeed) + (railmovespeed * raildir))
    move = (key_right + key_left)
    mask_index = spr_crouchmask
    if (sprite_index == spr_tumblestart)
        movespeed = 6
    if ((!grounded) && sprite_index != spr_mach2jump && machland != 1 && (sprite_index == spr_player_machroll || sprite_index == spr_player_backslide || sprite_index == spr_player_backslideland))
    {
        vsp = 10
        sprite_index = spr_dive
    }
    if (grounded && sprite_index == spr_dive)
    {
		if !key_down
		{
			instance_create(x, y, obj_stompeffect)
	        sprite_index = spr_player_shoulder
			machland = 1
	        vsp = -9
			image_index = 0
			grounded = false
		}
		else 
		{
			sprite_index = spr_player_machroll
			image_index = 0
			machland = 0
		}
	}
    //if (grounded && sprite_index != spr_tumble)
    //    movespeed -= 0.05
    if (sprite_index == spr_dive && key_jump)
    {
        sprite_index = spr_player_poundcancel1
        image_index = 0
        state = (108 << 0)
        vsp = -9
    }
    if (movespeed <= 2 && sprite_index != spr_player_breakdance)
        state = (0 << 0)
    if ((!scr_slope()) && sprite_index == spr_tumblestart && floor(image_index) < 11)
        image_index = 11
    if (sprite_index == spr_mach2jump && grounded && !machland)
    {
        image_index = 0
        sprite_index = spr_player_machroll
    }
    if (sprite_index == spr_mach2jump && grounded && vsp > 0)
    {
        image_index = 0
        sprite_index = spr_player_machroll
		if machland 
		{
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            if movespeed < 12 movespeed = 12
            state = (121 << 0)
            image_index = 0
            sprite_index = spr_mach4
			machland = 0
		}
		/*else if vsp >= 0
		{
			sprite_index = spr_mach2jump
			image_index = 0
			movespeed -= 2
			vsp = -9
			machland = 1
		}*/
    }
    if (sprite_index == spr_crouchslip && (!grounded))
        sprite_index = spr_player_jumpdive2
    if (sprite_index == spr_player_Sjumpcancelland && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_Sjumpcancelslide
    if (sprite_index == spr_player_jumpdive2 && grounded)
        sprite_index = spr_crouchslip
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_machroll)
    {
        sprite_index = spr_player_backslideland
        image_index = 0
    }
    if (sprite_index == spr_player_machroll && (!grounded))
        sprite_index = spr_player_shoulder
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_backslideland)
        sprite_index = spr_player_backslide
    if (sprite_index == spr_player_Sjumpcancel && grounded)
        sprite_index = spr_player_Sjumpcancelland
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancelland)
        sprite_index = spr_player_Sjumpcancelslide
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdance)
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        movespeed = 12
        sprite_index = spr_breakdancesuper
    }
    if (sprite_index == spr_tumblestart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_tumble
        movespeed = 14
    }
    if (((place_meeting((x + xscale), y, obj_solid) || scr_solid_slope((x + xscale), y)) && (!(place_meeting((x + hsp), y, obj_rollblock))) && (!(place_meeting((x + hsp), y, obj_rattumble))) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || place_meeting(x, y, obj_timedgate))
    {
        if sprite_index != spr_dive 
		{
			hsp = 0
			movespeed = 0
		}
		else 
		{
			xscale = -xscale 
		}
    }
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0 && (!(place_meeting(x, y, obj_bigcheese))))
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded && hsp != 0 && sprite_index == spr_tumble)
    {
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        vsp = -9
        image_index = 0
    }
    if (crouchslipbuffer > 0)
        crouchslipbuffer--
    if ((!key_down) && key_attack && grounded && sprite_index != spr_tumble && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && sprite_index != spr_player_breakdance)
    {
		if !machland
		{
	        if (crouchslipbuffer == 0)
	        {
	            with (instance_create(x, y, obj_jumpdust))
	                image_xscale = other.xscale
				sprite_index = spr_player_shoulder
				image_index = 0
				machland = 1
				vsp = -9
	        }
		}
		if machland && sprite_index != spr_mach2jump && vsp > 0 && sprite_index != spr_dive
		{
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            if movespeed < 12 movespeed = 12
            state = (121 << 0)
            image_index = 0
            sprite_index = spr_mach4
			machland = 0
		}
    }
    if ((!key_down) && (!key_attack) && grounded && machland == 0 && sprite_index != spr_tumble && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && sprite_index != spr_player_breakdance)
    {
        if (crouchslipbuffer == 0)
        {
            if (movespeed > 6)
            {
                state = (105 << 0)
                sprite_index = spr_machslidestart
                image_index = 0
            }
            else
                state = (0 << 0)
        }
    }
    if (sprite_index == spr_player_Sjumpcancelslide || sprite_index == spr_breakdancesuper || sprite_index == spr_machroll || sprite_index == spr_tumble || sprite_index == spr_tumblestart || sprite_index == spr_player_machroll || sprite_index == spr_player_mach2jump)
        image_speed = (abs(movespeed) / 15)
    else if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach2jump)
        image_speed = 0
    else if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpcancel)
        image_speed = 0
    else
        image_speed = 0.35
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
}

