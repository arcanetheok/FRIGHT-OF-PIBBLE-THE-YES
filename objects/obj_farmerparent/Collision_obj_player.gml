instance_destroy()
global.hasfarmer[pos] = 1
other.farmerpos = pos
switch object_index
{
    case obj_farmerpeasanto:
        instance_create_unique(x, y, 196)
        break
    case 50:
        instance_create_unique(x, y, 132)
        break
    case 711:
        instance_create_unique(x, y, 185)
        break
}

