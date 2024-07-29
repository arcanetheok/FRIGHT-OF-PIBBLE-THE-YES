if (state == (224 << 0))
{
    if (floor(image_index) == (image_number - 1))
    {
        switch sprite_index
        {
            case spr_flush_pizzatransition:
                sprite_index = spr_flush_pizza
                break
            case 2365:
                sprite_index = spr_flush_rat
                break
            case 53:
                sprite_index = spr_flush_skull
                break
        }

    }
}
