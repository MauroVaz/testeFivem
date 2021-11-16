AntiCheat = true
AntiCheatStatus = "~g~Ativo"
PedStatus = 0

CarsBL = {
"vigilante",
"hydra",
"cuban800",
"buzzard",
"deluxo",
"seasparrow",
"avenger",
"boing",
"akula",
"apc",
"barrage",
"caracara",
"chernobog",
"hunter",
"insurgent",
"starling",
"bus",
"lazer",
"bombushka",
"savage",
"rhino",
"blazer5",
"marshall",
"rhino2",
"limo2",
"duster",
"dodo",
"riot",
"riot2",
"khanjali",
"jet",
"khanjali",
"yacht",
"cargobob",
"riot",
"scarab",
"scarab2",
"scarab3",
"apc",
"riot2",
"kuruma",
"adder",
"oppressor",
"oppressor2",
"kuruma2",
"halftrack",
"stromberg",
"baller",
"baller2",
"baller3",
"baller4",
"baller5",
"baller6",
"swift",
"swift2",
"trailersmall2",
"dump",
"cutter",
"bulldozer",
"tug",
--"polmav",
"cargobob",
"cargobob2",
"cargobob3",
"cargobob4",
"akula",
"annihilator",
"skylift",
"buzzard",
"savage",
"valkyrie",
"valkyrie2",
"frogger",
"frogger2",
"volatol",
"vestra",
"molotov",
"tula",
"titan",
"alphaz1",
"blimp",
"blimp2",
"blimp3",
"bombushka",
"avenger",
"avenger2",
"zr380",
"zr3802",
"zr3803",
"technical",
"technical2",
"technical3",
"insurgent",
"insurgent2",
"insurgent3",
"bruiser",
"bruiser2",
"bruiser3",
"handler",
"phantom2",
"cargoplane",
"phantom",
"phantom3",
"cerberus2",
"cerberus3",
"cerberus",
"chernobog",
"barrage",
"minitank",
"thruster",
"besra",
"lazer",
"jet",
"cargoplane",
"nimbus",
"rcbandito",
"baller",
"baller2",
"baller3",
"baller4",
"tampa3",
"monster",
"monster2",
"monster3",
"monster4",
"monster5",
"supervolito",
"volatus",
"scramjet",
"ruiner2",
"ruiner",
"strikeforce",
"tug",
"submersible2",
"subermesible",
"cerberus",
"cerberus2",
"cerberus3",
"hauler2",
"mule4",
"phantom2",
"pounder2",
"terbyte",
"issi4",
"issi5",
"issi6",
"menacer",
"akula",
"buzzard",
"cargobob",
"cargobob2",
"cargobob3",
"cargobob4",
"annihilator",
"savage",
"hunter",
"havok",
"valkyrie",
"valkyrie2",
"bulldozer",
"dump",
"cutter",
"handler",
"scarab",
"scarab2",
"scarab3",
"thruster",
"trailersmall2",
"halftrack",
"chernobog",
"barrage",
"apc",
"rhino",
"khanjali",
"opressor2",
"opressor",
"ruiner2",
"tampa3",
"bruiser2",
"bruiser3",
"bruiser",
"dune4",
"dune5",
"dune3",
"insurgent",
"insurgent2",
"insurgent3",
"rcbandito",
"nightshark",
"technical",
"technical2",
"technical3",
"alphaz1",
"avenger",
"avenger2",
"besra",
"blimp",
"blimp2",
"blimp3",
"bombushka",
"cargoplane",
"howard",
"hydra",
"jet",
"lazer",
"luxor",
"luxor2",
"miljet",
"mogul",
"molotok",
"nimbus",
"nokota",
"pyro",
"rogue",
"seabreeze",
"shamal",
"starling",
"strikeforce",
"stunt",
"titan",
"tula",
"velum",
"velum2",
"vestra",
"volato1",
"brickade",
"airbus",
"bus",
"coach",
"rallytruck",
"rentalbus",
"trash",
"trash2",
"wastelander",
"kuruma2",
"vigilante",
"armytanker",
"armytrailer",
"armytrailer2",
"baletrailer",
"boattrailer",
"cablecar",
"docktrailer",
"freighttrailer",
"graintrailer",
"proptrailer",
"raketrailer",
"tr2",
"tr3",
"tr4",
"trflat",
"tvtrailer",
"tanker",
"tanker2",
"trailerlogs",
"trailerlarge",
"trailersmall",
"trailers",
"trailers2",
"trailers3",
"trailers4",
"freight",
"freightcar",
"freightcont2",
"freightcont1",
"freightgrain",
"metrotrain",
"tankercar",
"zentorno",
"maverick",
"speedo4",
"swift1",
"swift",
"frogger",
"frogger2",
"annihilator",
"buzzard",
"buzzard2",
"savage",
"supervolito",
"supervolito2",
"valkyrie",
"valkyrie2",
"volatus",
"skylift",
"havok",
"akula",
"voltic2",
"boxville5"
} 



Citizen.CreateThread(function()
    while true do
        Wait(500)
      if (AntiCheat == true)then
        if IsPedInAnyVehicle(GetPlayerPed(-1)) then
        v = GetVehiclePedIsIn(playerPed, false)
        end
        playerPed = GetPlayerPed(-1)
        if whitelisted == nil and playerPed and v then
        if GetPedInVehicleSeat(v, -1) == playerPed then
            checkCar(GetVehiclePedIsIn(playerPed, false))
            end
        end
       end
    end
end)

function checkCar(car)
    if car then
        carModel = GetEntityModel(car)
        carName = GetDisplayNameFromVehicleModel(carModel)
      if (AntiCheat == true)then
        if isCarBlacklisted(carModel) then
            _DeleteEntity(car)
            TriggerServerEvent("HG_AntiCheat:Cars", blacklistedCar )
        end
      end
    end
end

function isCarBlacklisted(model)
    for _, blacklistedCar in pairs(CarsBL) do
        if model == GetHashKey(blacklistedCar) then
            return true
        end
    end

    return false
end


function _DeleteEntity(entity)
    Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(500)
    for _,theWeapon in ipairs(WeaponBL) do
        Wait(1)
        if (AntiCheat == true)then
        if HasPedGotWeapon(PlayerPedId(),GetHashKey(theWeapon),false) == 1 then
        RemoveAllPedWeapons(PlayerPedId(),false)
        end
        end
    end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(500)
    local ped = PlayerPedId()
    local handle, object = FindFirstObject()
    local finished = false
    repeat
        Wait(1)
        if (AntiCheat == true)then
        if IsEntityAttached(object) and DoesEntityExist(object) then

        if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") then
            DeleteObjects(object, true)
        end
        end
        for i=1,#ObjectsBL do
        if GetEntityModel(object) == GetHashKey(ObjectsBL[i]) then
            DeleteObjects(object, false)

        end
        end
    end
        finished, object = FindNextObject(handle)

    until not finished
    EndFindObject(handle)
    end
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if (AntiCheat == true)then
        if IsPedJumping(PlayerPedId()) then
            local jumplength = 0
            repeat
                Wait(0)
                jumplength=jumplength+1
                local isStillJumping = IsPedJumping(PlayerPedId())
            until not isStillJumping
            if jumplength > 250 then
                TriggerServerEvent("HG_AntiCheat:Jump", jumplength )
            end
        end
    end
    end
end) ]]

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(1)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieFunctionParameterString(anticheatm)
    PopScaleformMovieFunctionVoid()
    return scaleform
end


Citizen.CreateThread(function()
while true do
    Citizen.Wait(1)
    if anticheatm then
        scaleform = Initialize("mp_big_message_freemode")
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
    end
end
end)

RegisterNetEvent("HG_AntiCheat:Toggle")
AddEventHandler("HG_AntiCheat:Toggle", function()
    if (AntiCheat == false) then
        AntiCheat = true
        AntiCheatStatus = "~g~Ativado"
        anticheatm = "~y~AntiCheat"
        Citizen.Wait(5000)
        anticheatm = false
        else
        AntiCheat = false
        AntiCheatStatus = "~r~Inativo"
        anticheatm = "~y~AntiCheat"
        PedStatus = "OFF"
        Citizen.Wait(5000)
        anticheatm = false
    end
end)

Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(500)
        KillAllPeds()
        DeleteEntity(ped)
    end
end)

local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end
      
        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)
      
        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
      
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
  
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
  
function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

local function RGBRainbow( frequency )
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
    result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
    result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
    
    return result
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3000)
        if (AntiCheat == true)then
            thePeds = EnumeratePeds()
            PedStatus = 0
            for ped in thePeds do
                PedStatus = PedStatus + 1
                if not (IsPedAPlayer(ped))then
                    DeleteEntity(ped)
                    RemoveAllPedWeapons(ped, true)
                end
            end
        end         
    end
end)

function ACstatus(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
Citizen.CreateThread( function()
    while true do
        Wait( 0 )
        rgb = RGBRainbow(2)
       -- ACstatus(0.19, 0.88, 1.0,1.0,0.4, "AntiCheat: "..AntiCheatStatus, rgb.r, rgb.g, rgb.b, 255, 200)
       -- ACstatus(0.19, 0.88 + 0.03, 1.0,1.0,0.35, "NPCs: ~r~"..PedStatus, 255, 255, 255, 200)
    end
end )

Citizen.CreateThread(function()
    while true do
        Wait(600000)
        TriggerEvent("chatMessage", "", {255, 255, 0}, "")
    end
end)

function KillAllPeds()
    local pedweapon
    local pedid
    for ped in EnumeratePeds() do 
        if DoesEntityExist(ped) then
            pedid = GetEntityModel(ped)
            pedweapon = GetSelectedPedWeapon(ped)
            if (AntiCheat == true)then
            if pedweapon == -1312131151 or not IsPedHuman(ped) then 
                ApplyDamageToPed(ped, 1000, false)
                DeleteEntity(ped)
            else
                switch = function (choice)
                    choice = choice and tonumber(choice) or choice
                  
                    case =
                    {
                        [451459928] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,
                  
                        [1684083350] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,

                        [451459928] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,
              
                        [1096929346] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,

                        [880829941] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,
          
                        [-1404353274] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,

                        [2109968527] = function ( )
                            ApplyDamageToPed(ped, 1000, false)
                            DeleteEntity(ped)
                        end,

                       default = function ( )
                       end,
                    }

                    if case[choice] then
                       case[choice]()
                    else
                       case["default"]()
                    end
                  
                  end
                  switch(pedid) 
            end
        end
        end
    end
end
