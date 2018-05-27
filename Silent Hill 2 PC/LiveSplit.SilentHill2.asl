state("sh2pc", "PAL")
{
  float GameTimer: 0x19BEB94;
}

state("sh2pc", "NTSC")
{
  float GameTimer: 0x19BBF94;
}

state("sh2pc", "Faulty NTSC")
{
  float GameTimer: 0x19BFB94;
}

state("sh2pc", "WSF or cracked NTSC")
{
  float GameTimer: 0x19BBF94;
}

init
{
  int moduleSize = modules.First().ModuleMemorySize;
  switch (moduleSize) {
    case 34910208:
      version = "PAL";
      break;
    case 34959360:
      version = "NTSC";
      break;
    case 34263040:
      version = "Faulty NTSC";
      break;
    default:
      version = "WSF or cracked NTSC";
      break;
  }
  print(modules.First().ModuleMemorySize.ToString());
}

start
{
  return current.GameTimer > 0;
}
 
reset
{

}
 
split
{

}
 
isLoading
{
  return true;
}
 
gameTime
{	
  return TimeSpan.FromSeconds(current.GameTimer);
} 
