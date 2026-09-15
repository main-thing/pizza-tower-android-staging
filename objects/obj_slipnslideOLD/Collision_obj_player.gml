ADD_OBJECT_EVENT_GML_HOOK;
if (drop == 0) {
    with (obj_player) {
        other.drop = 1;
        state = states.slipnslide;
        movespeed = 12;
    }
}