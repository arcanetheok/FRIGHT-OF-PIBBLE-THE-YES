pal_swap_init_system(2)
global.roommessage = "PIZZA TOWER OF THE WEST"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_badland_mart2_Create_254_gml_Room_badland_mart2_Create
    {
        touchedtriggers = 0
    }
, function() //anon_gml_Room_badland_mart2_Create_298_gml_Room_badland_mart2_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_badland_mart2_Create_423_gml_Room_badland_mart2_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_badland_mart2_Create_513_gml_Room_badland_mart2_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
