wmic os get Caption > "Os_version.txt"
wmic os get Version >> "Os_version.txt"
wmic computersystem get totalphysicalmemory > "Os_memory.txt"
wmic os get freephysicalmemory >> "Os_memory.txt"
wmic diskdrive get model,serialNumber,size,mediaType > "Os_disks.txt"
