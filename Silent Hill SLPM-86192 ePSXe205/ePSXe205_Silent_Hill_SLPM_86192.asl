state("ePSXe")
{
	uint Timer: "ePSXe.exe", 0xB411D4;
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
