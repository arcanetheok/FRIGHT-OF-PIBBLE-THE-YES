with (instance_create(x, y, obj_explosioneffect))
{
    sprite_index = spr_bombexplosion
    image_speed = 0.35
}
if bbox_in_camera(view_camera[0], 78)
{
    scr_soundeffect(sfx_explosion)
}
