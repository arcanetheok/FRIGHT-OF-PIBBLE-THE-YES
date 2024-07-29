var _sound = sfx_cheesejump
if place_meeting(x, y, obj_player)
{
    with (obj_hiddenobject)
    {
        if ((!activated) && trigger == other.trigger)
        {
            _sound = mu_war
            event_user(0)
        }
    }
}
if _sound
    scr_soundeffect(sfx_collectgiantpizza)
