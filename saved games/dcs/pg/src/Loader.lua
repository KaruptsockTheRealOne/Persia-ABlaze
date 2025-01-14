-- Globals are important.
version = "1.110.0"
Servername = "Persia ABlaze"
lastupdate = "21/10/2022"
password = "lalalala"
ADMINPASSWORD2 = "lala"
PATHTODROPBOX = "C:\\%Users%\\Persia_ABlaze_Core_Code\\dcs\\" -- path to were the files are this needs to go in the right folder
usedropbox = false
PGPATH = lfs.writedir()
if usedropbox == true then
	PGPATH = PATHTODROPBOX
end
-- end globals.
env.info("Persia ABlaze Loader")
env.info("Mission by Karuptsock")
env.info("Mission Script Loader Active")
dofile(PGPATH .."pg\\scripts\\Main.lua")
