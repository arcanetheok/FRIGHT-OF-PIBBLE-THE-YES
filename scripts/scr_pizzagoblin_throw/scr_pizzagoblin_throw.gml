function scr_pizzagoblin_throw() //scr_pizzagoblin_throw
{
    if (!variable_global_exists("throw_frame"))
    {
        global.throw_frame = 0
        global.throw_frame[444] = 11
        global.throw_frame[446] = 13
        global.throw_frame[445] = 18
        global.throw_frame[440] = 6
        global.throw_frame[460] = 2
        global.throw_frame[195] = 7
        global.throw_frame[30] = 2
        global.throw_frame[462] = 2
        global.throw_frame[442] = 2
        global.throw_frame[443] = 8
        global.throw_frame[450] = 6
        global.throw_frame[455] = 3
        global.throw_frame[777] = 8
        global.throw_frame[453] = 15
        global.throw_frame[452] = 10
        global.throw_frame[451] = 2
        global.throw_frame[219] = 6
        global.throw_frame[432] = 9
        global.throw_frame[433] = 9
        global.throw_frame[408] = 9
        global.throw_frame[222] = 13
        global.throw_frame[470] = 3
        global.throw_frame[805] = 7
        global.throw_frame[281] = 11
        global.throw_sprite = spr_plug
        global.throw_sprite[444] = spr_pizzagoblin_throwbomb
        global.throw_sprite[446] = spr_canongoblin_throwbomb
        global.throw_sprite[445] = spr_archergoblin_shoot
        global.throw_sprite[440] = spr_cheeserobot_attack
        global.throw_sprite[460] = spr_spitcheese_spit
        global.throw_sprite[195] = spr_tank_shoot
        global.throw_sprite[30] = spr_trash_throw
        global.throw_sprite[462] = spr_invtrash_throw
        global.throw_sprite[442] = spr_robot_attack
        global.throw_sprite[443] = spr_kentukykenny_throw
        global.throw_sprite[450] = spr_pizzard_shoot
        global.throw_sprite[455] = spr_pepgoblin_kick
        global.throw_sprite[777] = spr_pepbat_kick
        global.throw_sprite[453] = spr_swedishmonkey_eat
        global.throw_sprite[452] = spr_ranch_shoot
        global.throw_sprite[451] = spr_pickle_attack
        global.throw_sprite[219] = spr_tank_shoot
        global.throw_sprite[432] = spr_shrimp_knife
        global.throw_sprite[433] = spr_shrimp_knife
        global.throw_sprite[408] = spr_shrimp_knife
        global.throw_sprite[222] = spr_pizzaslug_cough
        global.throw_sprite[470] = spr_ufolive_shoot
        global.throw_sprite[805] = spr_kentukybomber_attack
        global.throw_sprite[281] = spr_ufogrounded_shoot
        global.reset_timer = 0
        global.reset_timer[444] = 200
        global.reset_timer[446] = 200
        global.reset_timer[445] = 200
        global.reset_timer[440] = 200
        global.reset_timer[460] = 100
        global.reset_timer[195] = 400
        global.reset_timer[30] = 100
        global.reset_timer[462] = 100
        global.reset_timer[442] = 150
        global.reset_timer[443] = 200
        global.reset_timer[450] = 100
        global.reset_timer[455] = 200
        global.reset_timer[777] = 200
        global.reset_timer[453] = 200
        global.reset_timer[452] = 100
        global.reset_timer[451] = 200
        global.reset_timer[219] = 100
        global.reset_timer[432] = 60
        global.reset_timer[433] = 60
        global.reset_timer[408] = 60
        global.reset_timer[222] = 10
        global.reset_timer[470] = 100
        global.reset_timer[805] = 100
        global.reset_timer[281] = 100
    }
    hsp = 0
    if place_meeting(x, (y + 1), obj_railh)
        hsp = -5
    else if place_meeting(x, (y + 1), obj_railh2)
        hsp = 5
    if (floor(image_index) == (image_number - 1))
    {
        state = (134 << 0)
        sprite_index = walkspr
    }
    if (bombreset <= 0 && floor(image_index) == global.throw_frame[object_index])
    {
        bombreset = global.reset_timer[object_index]
        sprite_index = global.throw_sprite[object_index]
        if point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), (camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
            scr_soundeffect(sfx_enemyprojectile)
        switch object_index
        {
            case obj_pizzagoblin:
                with (instance_create(x, y, obj_pizzagoblinbomb))
                {
                    defused = 1
                    movespeed = 5
                    image_xscale = other.image_xscale
                    vsp = -10
                    countdown = 80
                }
                break
            case 446:
                with (instance_create(x, y, obj_canongoblinbomb))
                    image_xscale = other.image_xscale
                break
            case 445:
                with (instance_create(x, y, obj_noisegoblin_arrow))
                {
                }
                break
            case 440:
                with (instance_create(x, y, obj_cheeseblob))
                {
                    sprite_index = spr_cheeserobot_goop
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 8)
                    vsp = 0
                    grav = 0
                }
                break
            case 460:
                if (spitcheesespr == spr_spitcheese_spit)
                {
                    with (instance_create((x + (image_xscale * 6)), (y - 6), obj_spitcheesespike))
                    {
                        image_xscale = other.image_xscale
                        hsp = (other.image_xscale * 5)
                        vsp = -6
                    }
                }
                else
                {
                    with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                    {
                        image_xscale = other.image_xscale
                        hsp = (other.image_xscale * 5)
                        vsp = -6
                    }
                }
                break
            case 30:
            case 462:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_cheeseball))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                    vsp = -4
                }
                break
            case 442:
                with (instance_create((x + (image_xscale * 4)), y, obj_robotknife))
                {
                    grav = 0
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case 443:
                with (instance_create(x, y, obj_kentukykenny_projectile))
                    image_xscale = other.image_xscale
                break
            case 450:
                with (instance_create(x, y, obj_pizzard_bolt))
                    image_xscale = other.image_xscale
                break
            case 453:
                if elite
                {
                    with (instance_create(x, y, obj_evilbanana))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_slipnslide))
                    {
                        baddieID = other.id
                        image_xscale = other.image_xscale
                        hsp = ((-other.image_xscale) * 4)
                        vsp = -5
                    }
                }
                with (obj_slipnslide)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                with (obj_evilbanana)
                {
                    if (baddieID == other.id)
                        banana += 1
                }
                break
            case 455:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case 777:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id
                    image_xscale = other.image_xscale
                }
                break
            case 451:
                attacking = 0
                with (instance_create(x, y, obj_forkhitbox))
                {
                    ID = other.id
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
                break
            case 219:
                with (instance_create((x + (image_xscale * 6)), (y - 6), obj_canongoblinbomb))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case 432:
            case 408:
                with (instance_create((x + (8 * image_xscale)), y, obj_robotknife))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 5)
                }
                break
            case 452:
                with (instance_create((x + (image_xscale * 6)), (y + 26), obj_rancher_bullet))
                    image_xscale = other.image_xscale
                break
            case 222:
                substate = choose((134 << 0), (126 << 0), (126 << 0))
                if (substate == (134 << 0))
                    image_xscale = choose(-1, 1, (-image_xscale))
                substate_buffer = substate_max
                with (instance_create((x + (50 * image_xscale)), (y + 20), obj_smokingprojectile))
                    image_xscale = other.image_xscale
                break
            case 433:
                with (instance_create((x + (8 * image_xscale)), y, obj_junkenemy))
                {
                    image_xscale = other.image_xscale
                    hsp = (other.image_xscale * 7)
                    vsp = -8
                }
                break
            case 470:
                instance_create(x, y, obj_warplaser)
                break
            case 281:
                with (instance_create((x + (8 * image_xscale)), y, obj_enemybullet))
                {
                    sprite_index = spr_ufogrounded_bullet
                    image_xscale = other.image_xscale
                }
                break
            case 805:
                instance_create(x, (y + 70), obj_kentukybomb)
                break
            case 195:
                var xx = (x + (72 * image_xscale))
                instance_create(xx, y, obj_bazooka)
                create_particle(xx, y, (6 << 0))
                break
        }

    }
    if ((!grounded) && hsp < 0)
        hsp += 0.1
    else if ((!grounded) && hsp > 0)
        hsp -= 0.1
}

