pal_swap_init_system(2)
global.roommessage = "ERM JELLO"
if (!obj_secretmanager.init)
{
    trace("secret init")
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_entrance_1_Create_280_gml_Room_entrance_1_Create
    {
        touchedtriggers = 0
    }
, function() //anon_gml_Room_entrance_1_Create_324_gml_Room_entrance_1_Create
    {
        if (touchedtriggers >= 4)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_entrance_1_Create_451_gml_Room_entrance_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_entrance_1_Create_551_gml_Room_entrance_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
