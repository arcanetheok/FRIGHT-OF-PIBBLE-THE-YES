if (obj_player.isgustavo == 0)
{
    instance_create(x, y, obj_genericpoofeffect)
    instance_destroy()
}
if (!trapped)
{
    if (obj_player1.sprite_index == spr_lonegustavo_hurt || obj_player1.state == (259 << 0) || obj_player1.state == (197 << 0) || obj_player1.state == (202 << 0) || obj_player1.state == (261 << 0) || obj_player1.state == (260 << 0))
    {
        wait = 1
        sprite_index = spr_lonebrick_wait
        alarm[0] = 30
        depth = 0
        comeback = 0
    }
    if (comeback == 1)
    {
        depth = -99
        x = Approach(x, obj_player1.x, cbspeed)
        y = Approach(y, obj_player1.y, cbspeed)
        cbspeed = Approach(cbspeed, 20, 1)
    }
    else if (wait == 0)
    {
        x += hsp
        y += vsp
        if (vsp < 20)
            vsp += 0.5
    }
    if comeback
        sprite_index = spr_lonebrick_comeback
}
else if (baddieID == noone)
{
    vsp = -10
    if ((y + vsp) < 80 || scr_solid(x, (y - 78)))
        vsp = 0
    y += vsp
}
else if (!instance_exists(baddieID))
    trapped = 0
