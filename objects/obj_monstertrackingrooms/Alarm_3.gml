var hillbilly_pos = monster_pos[3]
if (self.room_place(hillbilly_pos.x, hillbilly_pos.y) != room_get_name(room))
{
    var _h = monster_dir[3].x
    if (_h == 0)
        _h = choose(-1, 1)
    if (sound_pos.x != -1 && sound_pos.y != -1 && sound_pos.y == hillbilly_pos.y && hillbilly_pos.x != sound_pos.x)
        _h = (sound_pos.x < hillbilly_pos.x ? -1 : 1)
    if self.grid_meeting((hillbilly_pos.x + _h), hillbilly_pos.y)
        hillbilly_pos.x += _h
    else
        _h *= -1
    monster_dir[3].x = _h
    if (self.room_place(hillbilly_pos.x, hillbilly_pos.y) == room_get_name(room))
        self.hillbilly_create(1, 0)
    if (sound_pos.x == hillbilly_pos.x && sound_pos.y == hillbilly_pos.y)
    {
        sound_buffer = sfx_cheesejump
        with (obj_hillbillymonster)
        {
            investigatestate = 0
            state = (221 << 0)
        }
    }
}
