// Tested on Windows 7 64 with Russian release Sublustrum.exe MD5: 0947C3CB4A3E8F9CAE06B37F26D25866

state("Sublustrum")
{

}

startup
{

}

init
{
    vars.BaseAddress = memory.ReadValue<int>((IntPtr)0x005F3D3C);
    vars.FinalAddress = vars.BaseAddress + 5996;
}

update
{
    vars.TimerValue = memory.ReadValue<float>((IntPtr)vars.FinalAddress);
}

start
{
    return current.TimerValue > 0;
}

reset
{
    return current.TimerValue < 0;
}

split
{

}

isLoading
{
    return  true;
}

gameTime
{ 
    return TimeSpan.FromMilliseconds(vars.TimerValue);
}
