if (room == Realtitlescreen || room == rm_eggplantdisclaimer || room == rank_room || room == rm_levelselect || room == timesuproom || room == boss_room1 || room == characterselect || room == hub_loadingscreen)
{
    visible = false
    sprite_index = spr_tv_off
}
else
    visible = true
if (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud))
    visible = false
image_speed = 0.35
if (targetgolf != noone && (!instance_exists(targetgolf)))
    targetgolf = -4
if (targetgolf != -4 && (!view_visible[1]))
{
    view_visible[1] = true
    view_enabled = true
}
if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
    if (prompt != -4)
        prompt_buffer = 2
    bubbleindex += image_speed
    if (floor(bubbleindex) == sprite_get_number(bubblespr))
    {
        bubbleindex = 0
        switch bubblespr
        {
			case spr_tv_bubbleopen:
				bubblespr = spr_tv_bubble
				break
			case spr_tv_bubbleclose:
				bubblespr = spr_tv_bubbleclosed
				if (prompt == -4 or prompt == "")
					bubblespr = -4
				break
        }

    }
}
switch state
{
    case (0 << 0):
        idlespr = spr_tv_idle
        if (!obj_player.ispeppino)
            idlespr = spr_tv_idleN
        if obj_player.isgustavo
        {
            idlespr = spr_tv_idleG
            if global.panic
                idlespr = spr_tv_escapeG
        }
        var _state = obj_player1.state
        if (_state == (84 << 0) || _state == (61 << 0))
            _state = obj_player1.tauntstoredstate
        var _transfo = 1
        switch _state
        {
            case (47 << 0):
            case (48 << 0):
            case (38 << 0):
                idlespr = spr_tv_knight
                break
            case (51 << 0):
                idlespr = spr_tv_bombpep
                break
            case (9 << 0):
                idlespr = spr_tv_fireass
                if (obj_player1.sprite_index == obj_player1.spr_scaredjump1 || obj_player1.sprite_index == obj_player1.spr_scaredjump2)
                    idlespr = spr_tv_scaredjump
                break
            case (5 << 0):
                if (obj_player1.sprite_index == obj_player1.spr_tumble || obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend)
                    idlespr = spr_tv_tumble
                break
            case (10 << 0):
                idlespr = spr_tv_firemouth
                break
            case (16 << 0):
            case (17 << 0):
                idlespr = spr_tv_ghost
                break
            case (59 << 0):
                if (obj_player1.sprite_index == obj_player1.spr_squished)
                    idlespr = spr_tv_squished
                break
            case (0 << 0):
            case (92 << 0):
            case (42 << 0):
            case (100 << 0):
            case (93 << 0):
                with (obj_player1)
                {
                    if shotgunAnim
                        other.idlespr = spr_tv_shotgun
                    else if global.mort
                        other.idlespr = spr_tv_mort
                }
                break
            case (122 << 0):
            case (108 << 0):
            case (111 << 0):
                if obj_player1.shotgunAnim
                    idlespr = spr_tv_shotgun
                break
            case (72 << 0):
                if global.mort
                    idlespr = spr_tv_mort
                break
            case (66 << 0):
            case (71 << 0):
            case (57 << 0):
            case (70 << 0):
            case (67 << 0):
            case (68 << 0):
                idlespr = spr_tv_shotgun
                break
            case (113 << 0):
                idlespr = spr_tv_barrel
                break
            case (148 << 0):
                idlespr = spr_tv_golf
                break
            case (184 << 0):
                idlespr = spr_tv_rocket
                break
            case (21 << 0):
                idlespr = spr_tv_cheeseball
                break
            case (24 << 0):
            case (25 << 0):
            case (29 << 0):
            case (30 << 0):
                idlespr = spr_tv_cheesepep
                break
            case (33 << 0):
            case (35 << 0):
            case (34 << 0):
                idlespr = spr_tv_boxxedpep
                break
            case (104 << 0):
            case (37 << 0):
            case (65 << 0):
            case (78 << 0):
                if obj_player1.skateboarding
                    idlespr = spr_tv_clown
                break
            default:
                _transfo = 0
                break
        }

        if (!obj_player1.ispeppino)
        {
            var spr = sprite_get_name(idlespr)
            spr = asset_get_index(concat(spr, "N"))
            if (spr > -1)
                idlespr = spr
        }
        if (!_transfo)
        {
            with (obj_player1)
            {
                if (mach4mode == 1)
					tv_do_expression(spr_tv_exprmach4)
                else if (state == (121 << 0) || sprite_index == spr_mach3boost)
					tv_do_expression(spr_tv_exprmach3)
                else if (state == (107 << 0))
					tv_do_expression(spr_tv_exprhurt)
                else if (state == (196 << 0))
					tv_do_expression(spr_tv_hurtG)
                else if (global.combo >= 3 && (!obj_player.isgustavo))
					tv_do_expression(spr_tv_exprcombo)
                else if (global.stylethreshold >= 3 && (!obj_player.isgustavo))
                    tv_do_expression(spr_tv_exprheat)
            }
        }
        switch sprite_index
        {
            case spr_tv_off:
                if visible
                {
                    sprite_index = spr_tv_open
                    image_index = 0
                }
                break
            case 2536:
                if (floor(image_index) == (image_number - 1))
                    sprite_index = idlespr
                break
            case 2700:
            case 802:
                if (idleanim > 0)
                    idleanim--
                if (sprite_index != idlespr)
                    sprite_index = idlespr
                if (idleanim <= 0 && floor(image_index) == (image_number - 1))
                {
                    sprite_index = choose(spr_tv_idleanim1, spr_tv_idleanim2)
                    if (!obj_player1.ispeppino)
                    {
                        if (sprite_index == spr_tv_idleanim1)
                            sprite_index = spr_tv_idleanim1N
                        if (sprite_index == spr_tv_idleanim2)
                            sprite_index = spr_tv_idleanim2N
                    }
                    image_index = 0
                }
                break
			case spr_tv_idleanim1:
			case spr_tv_idleanim2:
			case spr_tv_idleanim1N:
			case spr_tv_idleanim2N:
                if (floor(image_index) == (image_number - 1))
                {
                    sprite_index = idlespr
                    idleanim = (240 + (60 * irandom_range(-1, 2)))
                }
                if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
                    sprite_index = idlespr
                break
            default:
                sprite_index = idlespr
        }

        if (sprite_index != spr_tv_open)
        {
            if (!ds_list_empty(tvprompts_list))
            {
                var b = ds_list_find_value(tvprompts_list, 0)
                prompt_buffer = prompt_max
                if (b[0] != "" && b[0] != -4)
                {
                    bubblespr = spr_tv_bubbleopen
                    bubbleindex = 0
                    prompt = b[0]
                    promptspd = b[3]
                    promptx = promptxstart
                }
                else
                {
                    if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
                        bubblespr = spr_tv_bubbleclose
                    if (bubblespr == spr_tv_bubbleclosed)
                        bubblespr = -4
                    bubbleindex = 0
                    promptx = promptxstart
                    prompt = -4
                }
                if (b[1] == (0 << 0))
                {
                    sprite_index = spr_tv_open
                    image_index = 0
                    tvsprite = b[2]
                    if (!obj_player1.ispeppino)
                    {
                        spr = sprite_get_name(tvsprite)
                        spr = asset_get_index(concat(spr, "N"))
                        if (spr > -1)
                            tvsprite = spr
                    }
                }
                else
                {
                    tvsprite = b[2]
                    if (!obj_player1.ispeppino)
                    {
                        spr = sprite_get_name(tvsprite)
                        spr = asset_get_index(concat(spr, "N"))
                        if (spr > -1)
                            tvsprite = spr
                    }
                    sprite_index = tvsprite
                    image_index = 0
                }
                state = (8 << 0)
            }
            else
                bubblespr = -4
        }
        break
    case (8 << 0):
        if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1))
            sprite_index = tvsprite
        if (sprite_index == tvsprite)
        {
            if (prompt_buffer > 0)
                prompt_buffer--
            else
            {
                promptx = promptxstart
                ds_list_delete(tvprompts_list, 0)
                state = (0 << 0)
            }
        }
        break
    case (250 << 0):
        sprite_index = spr_tv_whitenoise
        if (noisebuffer > 0)
            noisebuffer--
        else
        {
            noisebuffer = noisemax
            if (expressionsprite != -4)
            {
                state = (251 << 0)
                sprite_index = expressionsprite
            }
            else
                state = (0 << 0)
            image_index = 0
        }
        break
    case (251 << 0):
        switch expressionsprite
        {
            case spr_tv_exprhurt:
                if (obj_player1.state != (107 << 0))
                {
                    if (expressionbuffer > 0)
                        expressionbuffer--
                    else
                    {
                        state = (250 << 0)
                        expressionsprite = -4
                    }
                }
                break
            case spr_tv_hurtG:
                if (obj_player1.state != (196 << 0))
                {
                    if (expressionbuffer > 0)
                        expressionbuffer--
                    else
                    {
                        state = (250 << 0)
                        expressionsprite = -4
                    }
                }
                break
            case spr_tv_exprcombo:
                if (global.combo < 3 || obj_player1.isgustavo)
                {
                    state = (250 << 0)
                    expressionsprite = -4
                    if (obj_player1.state == (107 << 0))
                        tv_do_expression(spr_tv_exprhurt)
                }
                break
			case spr_tv_exprcollect:
			case spr_tv_happyG:
                if (expressionbuffer > 0)
                    expressionbuffer--
                else
                {
                    state = (250 << 0)
                    expressionsprite = -4
                }
                break
			case spr_tv_exprmach3:
                with (obj_player1)
                {
                    if (state != (121 << 0) && (state != (61 << 0) || tauntstoredstate != (121 << 0)) && sprite_index != spr_mach3boost && mach4mode == 0)
                    {
                        other.state = (250 << 0)
                        other.expressionsprite = -4
                    }
                }
                break
			case spr_tv_exprmach4:
                with (obj_player1)
                {
                    if (mach4mode == 0)
                    {
                        other.state = (250 << 0)
                        other.expressionsprite = -4
                    }
                }
                break
            case spr_tv_exprheat:
                _transfo = 0
                with (obj_player1)
                {
                    if (!scr_transformationcheck())
                        _transfo = 1
                    if isgustavo
                        _transfo = 1
                }
                if (global.stylethreshold < 3 || _transfo)
                {
                    state = (250 << 0)
                    expressionsprite = -4
                }
                break
        }

        if (!ds_list_empty(tvprompts_list))
        {
            state = (250 << 0)
            expressionsprite = -4
        }
        break
}

var change_pos = 0
if (obj_player.x > (room_width - 224) && obj_player.y < 187)
    change_pos = 1
if (bubblespr != -4 && obj_player.x > 316 && obj_player.y < 101)
    change_pos = 1
var spd = 15
if change_pos
    hud_posY = Approach(hud_posY, -300, spd)
else
    hud_posY = Approach(hud_posY, 0, spd)
pizzaface_index += 0.35
hand_index += 0.35
johnface_index += 0.35
if (global.panic && global.fill > 0)
{
    showtime_buffer = 100
    if (!instance_exists(obj_ghostcollectibles))
        timer_y = Approach(timer_y, timer_ystart, 1)
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 4)
}
else if global.panic
{
    if (pizzaface_sprite == spr_timer_pizzaface1)
    {
        pizzaface_sprite = spr_timer_pizzaface2
        pizzaface_index = 0
    }
    else if (pizzaface_sprite == spr_timer_pizzaface2)
    {
        if (floor(pizzaface_index) == (sprite_get_number(pizzaface_sprite) - 1))
        {
            pizzaface_sprite = spr_timer_pizzaface3
            pizzaface_index = 0
        }
    }
    else if (showtime_buffer > 0)
        showtime_buffer--
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 1)
}
else
{
    pizzaface_sprite = spr_timer_pizzaface1
    hand_sprite = spr_timer_hand1
    timer_y = (timer_ystart + 212)
}
if (global.panic && global.fill < (chunkmax / 5))
    hand_sprite = spr_timer_hand2
barfill_x -= 0.2
if (barfill_x < -173)
    barfill_x = 0
if (pizzaface_index > (sprite_get_number(pizzaface_sprite) - 1))
    pizzaface_index = frac(pizzaface_index)
if (hand_index > (sprite_get_number(hand_sprite) - 1))
    hand_index = frac(hand_index)
if (johnface_index > (sprite_get_number(johnface_sprite) - 1))
    johnface_index = frac(johnface_index)
if (global.combotime > 0 && global.combo != 0)
{
    switch combo_state
    {
        case 0:
            combo_posY += combo_vsp
            combo_vsp += 0.5
            if (combo_posY > 20)
                combo_state++
            break
        case 1:
            combo_posY = lerp(combo_posY, 0, 0.05)
            if (combo_posY < 1)
            {
                combo_posY = 0
                combo_vsp = 0
                combo_state++
            }
            break
        case 2:
            if (global.combotime < 30)
            {
                combo_posY += combo_vsp
                if (combo_vsp < 20)
                    combo_vsp += 0.5
                if (combo_posY > 0)
                {
                    combo_posY = 0
                    combo_vsp = -1
                    if (global.combotime < 15)
                        combo_vsp = -2
                }
            }
            else
                combo_posY = Approach(combo_posY, 0, 10)
            break
    }

}
else
{
    combo_posY = Approach(combo_posY, -500, 5)
    combo_vsp = 0
    combo_state = 0
}
combofill_index += 0.35
if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
    combofill_index = frac(combofill_index)
