local Kobuleti = AIRBASE:FindByName(AIRBASE.Caucasus.Kobuleti)
Kobuleti:SetRadioSilentMode(true)
local kutaisi = AIRBASE:FindByName(AIRBASE.Caucasus.Kutaisi)
kutaisi:SetRadioSilentMode(true)
local senaki = AIRBASE:FindByName(AIRBASE.Caucasus.Senaki_Kolkhi)
senaki:SetRadioSilentMode(true)
local vaziani = AIRBASE:FindByName(AIRBASE.Caucasus.Vaziani)
vaziani:SetRadioSilentMode(true)


ATC_KOBULETI = FLIGHTCONTROL:New(AIRBASE.Caucasus.Kobuleti,133.000,0,"E:\\DCS-SimpleRadio-Standalone",5010)
ATC_KOBULETI:SetSpeedLimitTaxi(30)
ATC_KOBULETI:SetLimitTaxi(3,false,1)
ATC_KOBULETI:SetLimitLanding(2,0)
ATC_KOBULETI:SetSRSTower("female","en-US",MSRS.Voices.Microsoft.Zira,1,"Kobuleti")
ATC_KOBULETI:SetSRSPilot("male","en-US",MSRS.Voices.Microsoft.David,1,"Pilot")
ATC_KOBULETI:AddHoldingPattern(Z_KOBDEF,00,15,5,15)
ATC_KOBULETI:Start()


ATC_KUTAISI = FLIGHTCONTROL:New(AIRBASE.Caucasus.Kutaisi,134.00,0,"E:\\DCS-SimpleRadio-Standalone",5010)
ATC_KUTAISI:SetSpeedLimitTaxi(30)
ATC_KUTAISI:SetLimitTaxi(3,false,1)
ATC_KUTAISI:SetLimitLanding(2,0)
ATC_KUTAISI:SetSRSTower("female","en-US",MSRS.Voices.Microsoft.Zira,1,"Kutaisi")
ATC_KUTAISI:SetSRSPilot("male","en-US",MSRS.Voices.Microsoft.David,1,"Pilot")
ATC_KUTAISI:AddHoldingPattern(Z_KOBDEF,00,15,5,15)
ATC_KUTAISI:Start()


ATC_SENAKI = FLIGHTCONTROL:New(AIRBASE.Caucasus.Senaki_Kolkhi,132.00,0,"E:\\DCS-SimpleRadio-Standalone",5010)
ATC_SENAKI:SetSpeedLimitTaxi(30)
ATC_SENAKI:SetLimitTaxi(3,false,1)
ATC_SENAKI:SetLimitLanding(2,0)
ATC_SENAKI:SetSRSTower("female","en-US",MSRS.Voices.Microsoft.Zira,1,"")
ATC_SENAKI:SetSRSPilot("male","en-US",MSRS.Voices.Microsoft.David,1,"Pilot")
ATC_SENAKI:AddHoldingPattern(Z_KOBDEF,00,15,5,15)
ATC_SENAKI:Start()
