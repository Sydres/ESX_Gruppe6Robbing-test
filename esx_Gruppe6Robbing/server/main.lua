--[[Original script [Gruppe6Robbing] by NENE(mikou)]]--
---https://forum.fivem.net/t/release-vrp-gruppe6robbing-gruppe6-armored-truck-robbing/290234
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local mapZones = {AIRP = "Los Santos International Airport",ALAMO = "Alamo Sea",ALTA = "Alta",ARMYB = "Fort Zancudo",BANHAMC = "Banham Canyon Dr",BANNING = "Banning",BEACH = "Vespucci Beach",BHAMCA = "Banham Canyon",BRADP = "Braddock Pass",BRADT = "Braddock Tunnel",BURTON = "Burton",CALAFB = "Calafia Bridge",CANNY = "Raton Canyon",CCREAK = "Cassidy Creek",CHAMH = "Chamberlain Hills",CHIL = "Vinewood Hills",CHU = "Chumash",CMSW = "Chiliad Mountain State Wilderness",CYPRE = "Cypress Flats",DAVIS = "Davis",DELBE = "Del Perro Beach",DELPE = "Del Perro",DELSOL = "La Puerta",DESRT = "Grand Senora Desert",DOWNT = "Downtown",DTVINE = "Downtown Vinewood",EAST_V = "East Vinewood",EBURO = "El Burro Heights",ELGORL = "El Gordo Lighthouse",ELYSIAN = "Elysian Island",GALFISH = "Galilee",GOLF = "GWC and Golfing Society",GRAPES = "Grapeseed",GREATC = "Great Chaparral",HARMO = "Harmony",HAWICK = "Hawick",HORS = "Vinewood Racetrack",HUMLAB = "Humane Labs and Research",JAIL = "Bolingbroke Penitentiary",KOREAT = "Little Seoul",LACT = "Land Act Reservoir",LAGO = "Lago Zancudo",LDAM = "Land Act Dam",LEGSQU = "Legion Square",LMESA = "La Mesa",LOSPUER = "La Puerta",MIRR = "Mirror Park",MORN = "Morningwood",MOVIE = "Richards Majestic",MTCHIL = "Mount Chiliad",MTGORDO = "Mount Gordo",MTJOSE = "Mount Josiah",MURRI = "Murrieta Heights",NCHU = "North Chumash",NOOSE = "N.O.O.S.E",OCEANA = "Pacific Ocean",PALCOV = "Paleto Cove",PALETO = "Paleto Bay" ,PALFOR = "Paleto Forest",PALHIGH = "Palomino Highlands",PALMPOW = "Palmer-Taylor Power Station",PBLUFF = "Pacific Bluffs",PBOX = "Pillbox Hill"  ,PROCOB = "Procopio Beach",RANCHO = "Rancho"  ,RGLEN = "Richman Glen",RICHM = "Richman" ,ROCKF = "Rockford Hills",RTRAK = "Redwood Lights Track",SANAND = "San Andreas" ,SANCHIA = "San Chianski Mountain Range",SANDY = "Sandy Shores" ,SKID = "Mission Row" ,SLAB = "Stab City"  ,STAD = "Maze Bank Arena",STRAW = "Strawberry" ,TATAMO = "Tataviam Mountains",TERMINA = "Terminal",TEXTI = "Textile City",TONGVAH = "Tongva Hills",TONGVAV = "Tongva Valley",VCANA = "Vespucci Canals" ,VESP = "Vespucci"  ,VINE = "Vinewood",WINDF = "Ron Alternates Wind Farm",WVINE = "West Vinewood"  ,ZANCUDO = "Zancudo River" ,ZP_ORT = "Port of South Los Santos",ZQ_UAR = "Davis Quartz"}

RegisterServerEvent('give_ok:give')
AddEventHandler('give_ok:give', function()
local _source = source
local robber = ESX.GetPlayerFromId(_source)

local reward = math.random(22000,50000)

robber.addMoney(reward)

end)

RegisterServerEvent('truckID')
AddEventHandler('truckID', function(TruckID)
T_ID = TruckID
TriggerClientEvent('sharedID',-1, T_ID)
end)

RegisterServerEvent('objID')
AddEventHandler('objID', function(ObjID)
O_ID = ObjID
TriggerClientEvent('sharedObj',-1, O_ID)
end)


RegisterServerEvent('check:Pos')
AddEventHandler('check:Pos', function()
nearMoney = true
TriggerClientEvent('sharedPos',-1, nearMoney)
end)


RegisterServerEvent('Cops')
AddEventHandler('Cops', function(x,y,z,zone)
local RPcops = ESX.GetPlayers()
local robZone = mapZones[zone]

for i=1, #RPcops, 1 do
    RPcop = ESX.GetPlayerFromId(RPcops[i])
    if RPcop.job.name == 'police' then
       TriggerClientEvent("robbing:notif", -1, robZone)
    end
end
end)
