if (player == 0 && place_meeting(x, y, obj_player))
{
	var num = instance_place_list(x, y, obj_player, global.instancelist, false)
	for(var i = 0; i < num; i++)
	{
		var _player = ds_list_find_value(global.instancelist, i)
		with (_player)
		{
			{
				treasure_x = x
				treasure_y = y
				treasure_room = room
				global.combotime = 60
				if grounded
				{
					ds_list_add(global.saveroom, other.id)
					global.treasure = 1
					hsp = 0
					vsp = 0
					if (!other.got)
					{
						other.alarm[0] = 150
						scr_player_gottreasure()
						scr_soundeffect(sfx_secretfound)
					}
					other.got = 1
					other.x = (x - 18)
					other.y = (y - 35)
					other.effectid = instance_create((other.x + 18), other.y, obj_treasureeffect)
					other.vsp = 0
					obj_tv.showtext = 1
					obj_tv.message = "TREASURE!!! I CANT BELIEVE ITS NOT LOY BUILD!"
					obj_tv.alarm[0] = 200
					other.player = (object_index == obj_player1 ? 1 : 2)
				}
			}
		}
	}
	ds_list_clear(global.instancelist)
}
