state("Bayonetta")
{
	int time : 0x5650424;
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
	return TimeSpan.FromMilliseconds(current.time*16.666);
}
