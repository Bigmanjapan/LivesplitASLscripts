state("EmuHawk")
{
	uint Timer: "octoshock.dll", 0x1DCA64;
}

isLoading
{
	return true;
}

start
{
	return true;
}

reset
{
	return false;
}

split
{

}

gameTime
{
	return TimeSpan.FromSeconds(current.Timer/4096f);
}
