if (!global.option_vibration)
    return;
with (obj_player)
{
    var _pindex = (object_index == obj_player1 ? obj_hardmode : obj_grindrailslope)
    var _dvc = other.player_input_device[_pindex]
    if (state != other.prevstate[_pindex])
    {
        {
        }

        other.prevstate[_pindex] = state
    }
}
for (var p = 0; p < array_length(vibration); p++)
{
    _dvc = player_input_device[p]
    vibration[p][0] *= vibration[p][2]
    vibration[p][1] *= vibration[p][2]
    if (vibration[p][0] < 0)
        vibration[p][0] = 0
    if (vibration[p][1] < 0)
        vibration[p][1] = 0
    gamepad_set_vibration(_dvc, vibration[p][0], vibration[p][1])
}
