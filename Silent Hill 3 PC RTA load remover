state("sh3")
{
	byte fadeInState: "sh3.exe", 0x32D0D0;     // 3 = loading, 4 = black screen, 5 = gameplay, 9 = fade-in part of white transition betwwen Office building and Street
	byte sexyKills: "sh3.exe", 0x6CE66EE;      // Sexy Beam kills
	byte onscreenEvents: "sh3.exe", 0x7CC660;  // 1 = title screen, 2 = loading
	int cutsceneIndex: "sh3.exe", 0x32C8B4;	   // 1 = Heather in Amusement park, 4 = Heather's toilet escape
	int roomIndex: "sh3.exe", 0x32D2C0;        // 150 = Apartments
}

startup
{
	vars.timerModel = new TimerModel { CurrentState = timer };
}

init
{

}

update
{
	vars.isLoading = false;
	if (current.fadeInState != 5 && current.fadeInState < 12 && current.fadeInState != 9 || current.onscreenEvents == 2) {
		
		vars.isLoading = true;
	}
	
	if (current.onscreenEvents == 1) {
		
		vars.timerModel.Reset();
	}
}

start
{
	if (current.cutsceneIndex == 0 && old.cutsceneIndex == 1 || current.cutsceneIndex == 0 && old.cutsceneIndex == 4) {

		return true;
	}				
}

split
{
	if (current.cutsceneIndex == 77 || current.roomIndex == 150 && current.sexyKills >= 30) {

		return true;
	}	
}

reset
{

}

isLoading
{
	return vars.isLoading;
}
