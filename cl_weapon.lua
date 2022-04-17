ESX = nil
menuOpen = false

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

local blips = {
 {title="Ammu-Nation", colour=81, id=110, x = -662.180, y = -934.961,   z = 20.829},
 {title="Ammu-Nation", colour=81, id=110, x = 810.25,   y = -2157.60,   z = 28.62 },
 {title="Ammu-Nation", colour=81, id=110, x = 1693.44,  y = 3760.16,    z = 33.71 },
 {title="Ammu-Nation", colour=81, id=110, x = -330.24,  y = 6083.88,    z = 30.45 },
 {title="Ammu-Nation", colour=81, id=110, x = 252.63,   y = -50.00,     z = 68.94 },
 {title="Ammu-Nation", colour=81, id=110, x = 22.09,    y = -1107.28,   z = 28.80 },
 {title="Ammu-Nation", colour=81, id=110, x = 2567.69,  y = 294.38,     z = 107.73},
 {title="Ammu-Nation", colour=81, id=110, x = -1117.58, y = 2698.61,    z = 17.55 },
 {title="Ammu-Nation", colour=81, id=110, x = 842.44,   y = -1033.42,   z = 27.19 }

}

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 0.7)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)

local Ppa = {
    Base = { Title = "Ammu-Nation" },
    Data = { currentMenu = "Menu Interaction" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
            if btn.name == "Permis de Port d'arme" then
                ESX.TriggerServerCallback('KrX-Ammunation:buyLicense', function(bought)
                    PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
                    if bought then
                        ESX.ShowNotification('Vous avez acheté votre ~b~Permis de port d\'arme')
                        self:CloseMenu(true)
                    end
                end)
            end
        end,
    },

    Menu = {
        ["Menu Interaction"] = {
            b = {
                {name = "Permis de Port d'arme", ask = "~g~45000$", askX = true},
            }
        },

    }
}

local ammunation = {
    Base = {Title = "Ammu-Nation" },
    Data = { currentMenu = "Menu Interaction" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
            if btn.name == "Pétoire" then
                TriggerServerEvent('KrX-Ammunation:buyweapon', 1750, "WEAPON_SNSPISTOL", "Pétoire", function(bought)
                end)
            elseif btn.name == "Pistolet" then
                TriggerServerEvent('KrX-Ammunation:buyweapon', 14500, "WEAPON_PISTOL", "Pistolet")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Tazer" then
                TriggerServerEvent('KrX-Ammunation:buyweapon', 7500, "WEAPON_STUNGUN", "Tazer")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Couteau" then
                TriggerServerEvent('KrX-Ammunation:buyweapon', 1250, "WEAPON_KNIFE", "Couteau")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Batte" then
                TriggerServerEvent('KrX-Ammunation:buyweapon', 1450, "WEAPON_BAT", "Batte")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Machette" then
                TriggerServerEvent('KrX-Ammunation:buyweapon', 2150, "WEAPON_MACHETE", "Machette")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Marteau" then
                TriggerServerEvent('KrX-Ammunation:buyweapon', 1750, "WEAPON_HAMMER", "Marteau")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Bouteille Cassé" then
                TriggerServerEvent('KrX-Ammunation:buyweapon', 750, "WEAPON_BOTTLE", "Bouteille")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Poing Américain" then
                TriggerServerEvent('KrX-Ammunation:buyweapon', 1350, "WEAPON_KNUCKLE", "Poing Américain")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Pied de Biche" then
                TriggerServerEvent('KrX-Ammunation:buyweapon', 1450, "WEAPON_CROWBAR", "Pied de Biche")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Chargeur de Munitions" then
                TriggerServerEvent('KrXSuperette:buy', 350, "clip", "Chargeur de Munitions")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Skin de Luxe" then
                TriggerServerEvent('KrXSuperette:buy', 1050, "yusuf", "Skin de Luxe")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Torche" then
                TriggerServerEvent('KrXSuperette:buy', 950, "flashlight", "Lampe Torche")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Poignée" then
                TriggerServerEvent('KrXSuperette:buy', 700, "grip", "Poignée")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
            elseif btn.name == "Silencieux" then
                TriggerServerEvent('KrXSuperette:buy', 650, "silencieux", "Silencieux")
                            PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)





            end
        end,
    },

    Menu = {
        ["Menu Interaction"] = {
            b = {
                {name = "Catégorie 1", ask = "→", askX = true},
                {name = "Catégorie 2", ask = "→", askX = true},
                {name = "---------------------------------------", ask = "", askX = true},
                {name = "Accessoires", ask = "→", askX = true},
            }
        },

        ["catégorie 1"] = {
            b = {
                {name = "Pétoire", ask = "~g~145000$", askX = true},
                {name = "Pistolet", ask = "~g~175000$", askX = true},
                {name = "Tazer", ask = "~g~45000$", askX = true},
            }
        },

        ["catégorie 2"] = {
            b = {
                {name = "Couteau", ask = "~g~2250$", askX = true},
                {name = "Batte", ask = "~g~2450$", askX = true},
                {name = "Machette", ask = "~g~4150$", askX = true},
                {name = "Marteau", ask = "~g~1450$", askX = true},
                {name = "Bouteille Cassé", ask = "~g~750$", askX = true},
                {name = "Poing Américain", ask = "~g~1350$", askX = true},
                {name = "Pied de Biche", ask = "~g~1450$", askX = true},
            }
        },

        ["accessoires"] = {
            b = {
                {name = "Chargeur de Munitions", ask = "~g~350$", askX = true},
                {name = "Skin de Luxe", ask = "~g~1150$", askX = true},
                {name = "Lampe Torche", ask = "~g~950$", askX = false},
                {name = "Poignée", ask = "~g~700$", askX = false},
                {name = "Silencieux", ask = "~g~650$", askX = false},
            }
        },
    }
}


Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_y_ammucity_01")
    
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(60)
    end

    ped = CreatePed("PED_TYPE_CIVMALE", "s_m_y_ammucity_01", 810.148, -2159.279, 28.61, 358, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)

local Ammu = {
 {x = -662.180, y = -934.961, z = 20.829 },
 {x = 810.25,   y = -2157.60, z = 28.62 },
 {x = 1693.44,  y = 3760.16,  z = 33.71 },
 {x = -330.24,  y = 6083.88,  z = 30.45 },
 {x = 252.63,   y = -50.00,   z = 68.94 },
 {x = 22.09,    y = -1107.28, z = 28.80 },
 {x = 2567.69,  y = 294.38,   z = 107.73 },
 {x = -1117.58, y = 2698.61,  z = 17.55 },
 {x = 842.44,   y = -1033.42, z = 27.19 }
}



 Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(Ammu) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
           local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Ammu[k].x, Ammu[k].y, Ammu[k].z)

            if dist <= 2.0 then
                  ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour parler à ~b~Franck')
                  if IsControlJustPressed(1,51) then 
                    if Config.ActiverLicense then
                        ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
                            if hasWeaponLicense then
                                CreateMenu(ammunation)
                            else
                                CreateMenu(Ppa)
                            end
                        end, GetPlayerServerId(PlayerId()), 'weapon')
                    else
                        CreateMenu(ammunation)
                    end
              else
                end
            end
        end
    end
end)
