pal_swap_init_system(2)
global.roommessage = "PIZZA TOWER IN SPACE"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_space_lap_Create_255_gml_Room_space_lap_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_space_lap_Create_352_gml_Room_space_lap_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_space_lap_Create_482_gml_Room_space_lap_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
