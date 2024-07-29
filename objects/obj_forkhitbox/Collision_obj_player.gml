if (instance_exists(ID) && ID.object_index == obj_badrat && other.state == (5 << 0))
{
}
if (other.hurted == 0)
    instance_create(round(((x + other.x) / 2)), round(((y + other.y) / 2)), obj_parryeffect)
scr_hurtplayer(other)
