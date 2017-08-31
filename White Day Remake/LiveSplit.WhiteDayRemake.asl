state("WhiteDay")
{
	float time : "mono.dll", 0x00262110, 0x650, 0x18, 0x48, 0x18, 0x108;
}

start
{
	return current.time < old.time;
}

reset
{
	return current.time < old.time;
}

isLoading
{
	return true;
}

gameTime
{
	return TimeSpan.FromSeconds(current.time);
}
