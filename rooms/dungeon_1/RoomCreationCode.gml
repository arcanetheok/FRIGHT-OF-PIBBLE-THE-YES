pal_swap_init_system(2)
global.roommessage = "PIZZA TOWER OF HELL!"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_dungeon_1_Create_277_gml_Room_dungeon_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_dungeon_1_Create_368_gml_Room_dungeon_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_dungeon_1_Create_461_gml_Room_dungeon_1_Create
    {
        secret_open_portal(2)
    }
)
}
