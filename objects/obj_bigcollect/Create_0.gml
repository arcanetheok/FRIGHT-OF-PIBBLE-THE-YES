if (obj_player1.character == "P" && obj_player1.spotlight == 1 && obj_player1.ispeppino)
    sprite_index = spr_pizzacollect1
if ((obj_player1.character == "N" || (!obj_player1.ispeppino)) && obj_player1.spotlight == 1)
    sprite_index = choose(spr_pizzacollect1halloween, spr_pizzacollect2halloween, spr_pizzacollect3halloween)
image_speed = 0.35
if (obj_player.character == "S")
    sprite_index = spr_snickcollectible2
depth = 11
