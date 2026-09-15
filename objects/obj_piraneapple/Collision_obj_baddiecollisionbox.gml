ADD_OBJECT_EVENT_GML_HOOK;
with (other)
{
	if (instance_exists(baddieID) && baddieID.thrown == true)
		instance_destroy(other)
}
