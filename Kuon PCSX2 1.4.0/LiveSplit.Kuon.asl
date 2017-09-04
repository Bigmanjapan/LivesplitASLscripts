// Supported version of the game: SLES-53411, SLUS-21007, SLPS-25329.
// PCSx2 1.4.0

state("pcsx2")
{
	byte gameVersion : 0x8251E8; // CRC code
}

startup
{
	vars.timerModel = new TimerModel { CurrentState = timer };
}

init
{
	vars.time = 0;
	var savemenuActive = 0;
	vars.CGIcutsceneActive = 0;
}

update
{
	vars.CGIcutsceneActive = memory.ReadValue<byte>((IntPtr)0x20018AF8); // Address is the same for all versions of the game

	switch ((byte)current.gameVersion) {
		case 239:
			vars.time = memory.ReadValue<int>((IntPtr)0x203AC890); // SLES-53411
			break;
		case 46:
			vars.time = memory.ReadValue<int>((IntPtr)0x203A6410); // SLUS-21007
			break;
		case 214:
			vars.time = memory.ReadValue<int>((IntPtr)0x203A2C10); // SLPS-25329
			break;
	}
	
	switch ((byte)current.gameVersion) {
		case 239:
			current.savemenuActive = memory.ReadValue<int>((IntPtr)0x2032BA70); // SLES-53411
			break;
		case 46:
			current.savemenuActive = memory.ReadValue<int>((IntPtr)0x203255F0); // SLUS-21007
			break;
		case 214:
			current.savemenuActive = memory.ReadValue<int>((IntPtr)0x20321DF0); // SLPS-25329
			break;
	}
	
	if (old.savemenuActive == 1036831949 && current.savemenuActive != 1036831949 && vars.time == 0) {
		vars.timerModel.Reset();
	}    	
}

start
{
	return vars.time > 0;
}

split
{
	if (vars.CGIcutsceneActive == 1 && vars.time != 0) {
		return true; 
	}    
}

isLoading
{
	return true;
}

gameTime
{ 
	return TimeSpan.FromMilliseconds(vars.time*16.666);
}
