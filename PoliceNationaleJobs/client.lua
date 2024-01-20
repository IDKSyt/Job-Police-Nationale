ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

local PlayerData = {}
local service = false
local bouclier = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    Citizen.Wait(5000)
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

        ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2
end)

Citizen.CreateThread(function()
    local policemap = AddBlipForCoord(Config.pos.blips.position.x, Config.pos.blips.position.y,
        Config.pos.blips.position.z)
    SetBlipSprite(policemap, 383)
    SetBlipColour(policemap, 0)
    SetBlipScale(policemap, 0.9)
    SetBlipAsShortRange(policemap, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("Ciat | Police Nationale")
    EndTextCommandSetBlipName(policemap)
end)

function Menuf6police()
    local rpolicef5 = RageUI.CreateMenu("Police", "Interactions")
    local rpolicef5Renfort = RageUI.CreateSubMenu(rpolicef5, "Police", "Renfort")
    local rpolicef5Soutien = RageUI.CreateSubMenu(rpolicef5, "Police", "Soutien")
    RageUI.Visible(rpolicef5, not RageUI.Visible(rpolicef5))
    while rpolicef5 do
        Citizen.Wait(0)
        RageUI.IsVisible(rpolicef5, true, true, true, function()

            RageUI.Checkbox("Prendre/Quitter son service", nil, service, {}, function(Hovered, Ative, Selected, Checked)
                if Selected then

                    service = Checked

                    if Checked then
                        etatservice = true
                        RageUI.Popup({
                            message = "Vous avez pris votre service !"
                        })
                        TriggerServerEvent('rpolice:prisedeservice')
                    else
                        etatservice = false
                        RageUI.Popup({
                            message = "Vous avez quitter votre service !"
                        })
                        TriggerServerEvent('rpolice:quitteleservice')
                    end
                end
            end)

            if etatservice then

                RageUI.Separator("~r~" .. ESX.PlayerData.job.grade_label .. " - " .. GetPlayerName(PlayerId()))

                 RageUI.ButtonWithStyle("Tablette de Recherche", nil, {
                    RightLabel = "→"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('mdw')
                        RageUI.CloseAll()
                    end
                end)
                    
                   RageUI.ButtonWithStyle("Contraventions", nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('contraventions')
                        RageUI.CloseAll()
                    end
                end)

                RageUI.ButtonWithStyle("Interagir avec le citoyen", nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerEvent('fellow:MenuFouille')
                        RageUI.CloseAll()
                    end
                end)
                    
                RageUI.ButtonWithStyle("Menotter", nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('cuff')
                    end
                end)
                    
                RageUI.ButtonWithStyle("Attraper", nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('grab')
                    end
                end)    

                RageUI.Separator('~r~? Int�ractions routiers ?')

                RageUI.ButtonWithStyle("Poser/Prendre Radar", nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        RageUI.CloseAll()
                        TriggerEvent('police:police_radar')
                    end
                end)

                RageUI.Separator('~r~? Autres ?')

                RageUI.Checkbox("Bouclier - Police", nil, bouclier, {}, function(Hovered, Ative, Selected, Checked)
                    if Selected then

                        bouclier = Checked

                        if Checked then
                            ExecuteCommand('police')

                        else
                            ExecuteCommand('police')
                        end
                    end
                end)
                    
                RageUI.Checkbox("Bouclier - Entra�nement", nil, bouclier, {}, function(Hovered, Ative, Selected, Checked)
                    if Selected then

                        bouclier = Checked

                        if Checked then
                            ExecuteCommand('ent')

                        else
                            ExecuteCommand('ent')
                        end
                    end
                end)    
                    
                RageUI.ButtonWithStyle("Gestion Traffic", nil, {
                    RightLabel = "→"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('traffic')
                        RageUI.CloseAll()        
                    end
                end)  

                RageUI.ButtonWithStyle("Menu Props", nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ExecuteCommand('scenemenu')
                        RageUI.CloseAll()
                    end
                end)

                RageUI.ButtonWithStyle("Demande de renfort", nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                end, rpolicef5Renfort)

                -- RageUI.ButtonWithStyle("Soutien police", nil,  {RightLabel = "?"}, true, function(Hovered, Active, Selected)
                -- end, rpolicef5Soutien)
            end

        end, function()
        end)

        RageUI.IsVisible(rpolicef5Renfort, true, true, true, function()

            RageUI.ButtonWithStyle("Demande d'Assistance", nil, {
                RightLabel = nil
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    local raison = 'ass'
                    local elements = {}
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    local name = GetPlayerName(PlayerId())
                    TriggerServerEvent('renfort', coords, raison)
                end
            end)

            RageUI.ButtonWithStyle("~r~SOS", nil, {
                RightLabel = nil
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    local raison = 'SOS'
                    local elements = {}
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    local name = GetPlayerName(PlayerId())
                    TriggerServerEvent('renfort', coords, raison)
                end
            end)

        end, function()
        end)

        RageUI.IsVisible(rpolicef5Soutien, true, true, true, function()

            RageUI.ButtonWithStyle("�meute de s�curit�", nil, {
                RightLabel = "?"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    SpawnVehicle1()
                end
            end)

            RageUI.ButtonWithStyle("Moto de s�curit�", nil, {
                RightLabel = "?"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    SpawnVehicle2()
                end
            end)
            RageUI.ButtonWithStyle("Camion de s�curit�", nil, {
                RightLabel = "?"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    SpawnVehicle3()
                end
            end)
            RageUI.ButtonWithStyle("V�lo de s�curit�", nil, {
                RightLabel = "?"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    SpawnVehicle4()
                end
            end)

            RageUI.ButtonWithStyle("S�curit� H�lico", nil, {
                RightLabel = "?"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    SpawnVehicle5()
                end
            end)

            RageUI.ButtonWithStyle("Donne des armes", nil, {
                RightLabel = "?"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    GiveWeaponToPed(chasePed, Config.weapon1, 250, false, true)
                    GiveWeaponToPed(chasePed2, Config.weapon2, 250, false, true)
                    GiveWeaponToPed(chasePed3, Config.weapon3, 250, false, true)
                    GiveWeaponToPed(chasePed4, Config.weapon4, 250, false, true)
                end
            end)

            RageUI.ButtonWithStyle("Attaque le joueur le plus proche", nil, {
                RightLabel = "?"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    closestPlayer = ESX.Game.GetClosestPlayer()
                    target = GetPlayerPed(closestPlayer)
                    TaskShootAtEntity(chasePed, target, 60, 0xD6FF6D61);
                    TaskCombatPed(chasePed, target, 0, 16)
                    SetEntityAsMissionEntity(chasePed, true, true)
                    SetPedHearingRange(chasePed, 15.0)
                    SetPedSeeingRange(chasePed, 15.0)
                    SetPedAlertness(chasePed, 15.0)
                    SetPedFleeAttributes(chasePed, 0, 0)
                    SetPedCombatAttributes(chasePed, 46, true)
                    SetPedFleeAttributes(chasePed, 0, 0)
                    TaskShootAtEntity(chasePed2, target, 60, 0xD6FF6D61);
                    TaskCombatPed(chasePed2, target, 0, 16)
                    SetEntityAsMissionEntity(chasePed2, true, true)
                    SetPedHearingRange(chasePed2, 15.0)
                    SetPedSeeingRange(chasePed2, 15.0)
                    SetPedAlertness(chasePed2, 15.0)
                    SetPedFleeAttributes(chasePed2, 0, 0)
                    SetPedCombatAttributes(chasePed2, 46, true)
                    SetPedFleeAttributes(chasePed2, 0, 0)
                    TaskShootAtEntity(chasePed3, target, 60, 0xD6FF6D61);
                    TaskCombatPed(chasePed3, target, 0, 16)
                    SetEntityAsMissionEntity(chasePed3, true, true)
                    SetPedHearingRange(chasePed3, 15.0)
                    SetPedSeeingRange(chasePed3, 15.0)
                    SetPedAlertness(chasePed3, 15.0)
                    SetPedFleeAttributes(chasePed3, 0, 0)
                    SetPedCombatAttributes(chasePed3, 46, true)
                    SetPedFleeAttributes(chasePed3, 0, 0)
                    TaskShootAtEntity(chasePed4, target, 60, 0xD6FF6D61);
                    TaskCombatPed(chasePed4, target, 0, 16)
                    SetEntityAsMissionEntity(chasePed4, true, true)
                    SetPedHearingRange(chasePed4, 15.0)
                    SetPedSeeingRange(chasePed4, 15.0)
                    SetPedAlertness(chasePed4, 15.0)
                    SetPedFleeAttributes(chasePed4, 0, 0)
                    SetPedCombatAttributes(chasePed4, 46, true)
                    SetPedFleeAttributes(chasePed4, 0, 0)
                end
            end)

            RageUI.ButtonWithStyle("Suivez-moi", nil, {
                RightLabel = "?"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    local playerPed = PlayerPedId()
                    TaskVehicleFollow(chasePed, chaseVehicle, playerPed, 50.0, 1, 5)
                    TaskVehicleFollow(chasePed2, chaseVehicle2, playerPed, 50.0, 1, 5)
                    TaskVehicleFollow(chasePed3, chaseVehicle3, playerPed, 50.0, 1, 5)
                    TaskVehicleFollow(chasePed4, chaseVehicle4, playerPed, 50.0, 1, 5)
                    TaskVehicleFollow(chasePed5, chaseVehicle5, playerPed, 50.0, 1, 5)
                    PlayAmbientSpeech1(chasePed, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
                    PlayAmbientSpeech1(chasePed2, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
                    PlayAmbientSpeech1(chasePed3, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
                    PlayAmbientSpeech1(chasePed4, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
                    PlayAmbientSpeech1(chasePed5, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
                end
            end)

            RageUI.ButtonWithStyle("Supprimer", nil, {
                RightLabel = "?"
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    local playerPed = PlayerPedId()
                    DeleteVehicle(chaseVehicle)
                    DeletePed(chasePed)
                    DeleteVehicle(chaseVehicle2)
                    DeletePed(chasePed2)
                    DeleteVehicle(chaseVehicle3)
                    DeletePed(chasePed3)
                    DeleteVehicle(chaseVehicle4)
                    DeletePed(chasePed4)
                    DeleteVehicle(chaseVehicle5)
                    DeletePed(chasePed5)
                end
            end)

        end, function()
        end)
        if not RageUI.Visible(rpolicef5) and not RageUI.Visible(rpolicef5Renfort) and
            not RageUI.Visible(rpolicef5Soutien) then
            rpolicef5 = RMenu:DeleteType("police", true)
        end
    end
end

Keys.Register('F6', 'police', 'Ouvrir le menu police', function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
        Menuf6police()
    end
end)

function Rechercherplaquevoiture(plaquerechercher)
    local PlaqueMenu = RageUI.CreateMenu("plaque d'immatriculation", "Informations")
    ESX.TriggerServerCallback('rpolice:getVehicleInfos', function(retrivedInfo)
        RageUI.Visible(PlaqueMenu, not RageUI.Visible(PlaqueMenu))
        while PlaqueMenu do
            Citizen.Wait(0)
            RageUI.IsVisible(PlaqueMenu, true, true, true, function()
                local hashvoiture = retrivedInfo.vehicle.model
                local nomvoituremodele = GetDisplayNameFromVehicleModel(hashvoiture)
                local nomvoituretexte = GetLabelText(nomvoituremodele)
                RageUI.ButtonWithStyle("Num�ro de plaque : ", nil, {
                    RightLabel = retrivedInfo.plate
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                    end
                end)

                if not retrivedInfo.owner then
                    RageUI.ButtonWithStyle("Propri�taire : ", nil, {
                        RightLabel = "Inconnu"
                    }, true, function(Hovered, Active, Selected)
                        if Selected then
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Propri�taire : ", nil, {
                        RightLabel = retrivedInfo.owner
                    }, true, function(Hovered, Active, Selected)
                        if Selected then
                        end
                    end)

                    RageUI.ButtonWithStyle("Mod�le du v�hicule : ", nil, {
                        RightLabel = nomvoituretexte
                    }, true, function(Hovered, Active, Selected)
                        if Selected then
                        end
                    end)
                end
            end, function()
            end)
            if not RageUI.Visible(PlaqueMenu) then
                PlaqueMenu = RMenu:DeleteType("plaque d'immatriculation", true)
            end
        end
    end, plaquerechercher)
end

--- vestiaire

function vestiairepolice()
    local Vpolice = RageUI.CreateMenu("Vestiaire", "Police Nationale")
    RageUI.Visible(Vpolice, not RageUI.Visible(Vpolice))
    while Vpolice do
        Citizen.Wait(0)
        RageUI.IsVisible(Vpolice, true, true, true, function()
            RageUI.Separator("~y~↓ Votre Tenue ↓")
            if ESX.PlayerData.job.grade_name == 'ads' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)        
                    if Selected then        
                        tenuePoliceSecoursads()         
                        RageUI.CloseAll()        
                    end
                end)      
            end
            if  ESX.PlayerData.job.grade_name == 'eg' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourseg()        
                        RageUI.CloseAll() 
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlps' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursgdlps()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursgdlp()        
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbrc()         
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmaj()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscpts()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourcpts()        
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscpt()         
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscommandant()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscdp()         
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("Tenue Polo Blanc", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursboss()         
                        RageUI.CloseAll()
                    end
                end)
            end 
                
-- FIN TENUE DP CHAUD
                
                if ESX.PlayerData.job.grade_name == 'ads' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)        
                    if Selected then        
                        tenuePoliceSecoursbleuads()         
                        RageUI.CloseAll()        
                    end
                end)      
            end
            if  ESX.PlayerData.job.grade_name == 'eg' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleueg()        
                        RageUI.CloseAll() 
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlps' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleugdlps()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleugdlp()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleubrc()         
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleumaj()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleucpts()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleultn()        
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleucpt()         
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleucommandant()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleucdp()         
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("Tenue Polo Bleu", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursbleuboss()         
                        RageUI.CloseAll()
                    end
                end)
            end 
                
-- FIN TENUE DP CHAUD BLEU
                
                        if ESX.PlayerData.job.grade_name == 'ads' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidads()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'eg' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroideg()       
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlps' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidgdlps()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidgdlp()     
                        RageUI.CloseAll()
                    end
                end)
            end
   
            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbrc()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidmaj()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidcpts()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidltn()        
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidcpt()        
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidcommandant()        
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidcdp()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("Tenue BST", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidboss()        
                        RageUI.CloseAll()
                    end
                end)
            end   

            if ESX.PlayerData.job.grade_name == 'ads' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrsads()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'eg' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrseg()       
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlps' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrsgdlps()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrsgdlp()     
                        RageUI.CloseAll()
                    end
                end)
            end   
            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrsbrc()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrsmaj()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrcpts()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrcpts()        
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrscpt()        
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrscommandant()        
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrscdp()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("Tenue CRS", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourscrsboss()        
                        RageUI.CloseAll()
                    end
                end)
            end   

-- FIN TENUE DP FROID 
                
                if ESX.PlayerData.job.grade_name == 'ads' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleuads()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'eg' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleueg()       
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlps' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleugdlps()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleugdlp()     
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleubrc()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleumaj()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleucpts()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleultn()        
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleucpt()        
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleucommandant()        
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleucdp()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("Tenue CI", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursfroidbleuboss()        
                        RageUI.CloseAll()
                    end
                end)
            end   
                
-- FIN TENUE DP FROID BLEU
                
                if ESX.PlayerData.job.grade_name == 'ads' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremonieads()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'eg' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremonieeg()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlps' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremoniegdlps()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremoniegdlp()
                        RageUI.CloseAll()
                    end
                end)
            end

            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremoniebrc()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremoniemaj()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremoniecpts()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremonieltn()
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremoniecpt()
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremoniecommandant()
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremoniecdp()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("Tenue Hiver", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursceremonieboss()
                        RageUI.CloseAll()
                    end
                end)
            end   
                
-- FIN TENUE DP C�R�MONIE
                
                -- FIN TENUE DP FROID BLEU
                
                if ESX.PlayerData.job.grade_name == 'ads' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullads()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'eg' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspulleg()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlps' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullgdlps()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullgdlp()
                        RageUI.CloseAll()
                    end
                end)
            end
  
            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullbrc()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullmaj()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullcpts()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullltn()
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullcpt()
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullcommandant()
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullcdp()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("Tenue Pull", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecourspullboss()
                        RageUI.CloseAll()
                    end
                end)
            end   
                
-- FIN TENUE PULL
                
                -- FIN Motocycliste
                  
            if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("Tenue Motocycliste", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotogdlp()
                        RageUI.CloseAll()
                    end
                end)
            end
 
            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("Tenue Motocycliste", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotobrc()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("Tenue Motocycliste", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotomaj()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("Tenue Motocycliste", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocpts()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("Tenue Motocycliste", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotoltn()
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("Tenue Motocycliste", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocpt()
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("Tenue Motocycliste", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocommandant()
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("Tenue Motocycliste", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocdp()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("Tenue Motocycliste", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotoboss()
                        RageUI.CloseAll()
                    end
                end)
            end   
                
-- FIN TENUE MOTO
                
                if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("Tenue Motocycliste Repos", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocombigdlp()
                        RageUI.CloseAll()
                    end
                end)
            end

            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("Tenue Motocycliste Repos", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocombibrc()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("Tenue Motocycliste Repos", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocombimaj()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("Tenue Motocycliste Repos", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocombicpts()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("Tenue Motocycliste Repos", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocombiltn()
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("Tenue Motocycliste Repos", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocombicpt()
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("Tenue Motocycliste Repos", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocombicommandant()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("Tenue Motocycliste Repos", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocombicdp()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("Tenue Motocycliste Repos", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenuePoliceSecoursmotocombiboss()
                        RageUI.CloseAll()
                    end
                end)
            end   
                
-- FIN TENUE MOTO

			RageUI.Separator("~r~↓ Votre Tenue Civil ↓")
            RageUI.ButtonWithStyle("Remettre sa tenue", nil, {
                RightLabel = ""
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    vcivil()
                    RageUI.CloseAll()
                    SetPedArmour(GetPlayerPed(-1), 0)        
                end
            end)
        end, function()
        end)
        if not RageUI.Visible(Vpolice) then
            Vpolice = RMenu:DeleteType("Vestiaire", true)
        end
    end
end

function vestiairepolice4()
    local Vpolice4 = RageUI.CreateMenu("Vestiaire", "Police Nationale")
    RageUI.Visible(Vpolice4, not RageUI.Visible(Vpolice4))
    while Vpolice4 do
        Citizen.Wait(0)
        RageUI.IsVisible(Vpolice4, true, true, true, function()
            RageUI.Separator("~y~? Votre Tenue ?")       
                if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("Tenue RAID", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenueraidgdlp()
                        RageUI.CloseAll()
                    end
                end)
            end
  
            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("Tenue RAID", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenueraidbrc()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("Tenue RAID", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenueraidmaj()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("Tenue RAID", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenueraidcpts()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("Tenue RAID", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenueraidltn()
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("Tenue RAID", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenueraidcpt()
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("Tenue RAID", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenueraidcommandant()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("Tenue RAID", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenueraidcdp()
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("Tenue RAID", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        tenueraidboss()
                        RageUI.CloseAll()
                    end
                end)
            end   
                
-- FIN TENUE MOTO

			RageUI.Separator("~r~? Votre Tenue Civil ?")
            RageUI.ButtonWithStyle("Remettre sa tenue", nil, {
                RightLabel = ""
            }, true, function(Hovered, Active, Selected)
                if Selected then
                    vcivil()
                    RageUI.CloseAll()
                    SetPedArmour(GetPlayerPed(-1), 0)        
                end
            end)
        end, function()
        end)
        if not RageUI.Visible(Vpolice4) then
            Vpolice4 = RMenu:DeleteType("Vestiaire", true)
        end
    end
end

function vestiairepoliceceinturon()
    local Vpolice2 = RageUI.CreateMenu("Vestiaire", "Police Nationale")
    RageUI.Visible(Vpolice2, not RageUI.Visible(Vpolice2))
    while Vpolice2 do
        Citizen.Wait(0)
        RageUI.IsVisible(Vpolice2, true, true, true, function()
-- DEBUT TENUE SPE         
                RageUI.Separator("~r~↓ Vos équipements ↓")
                RageUI.Separator("~y~↓ Ceinturons ↓")
            if  ESX.PlayerData.job.grade_name == 'ads' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturonads()        
                        RageUI.CloseAll()
                    end
                end)
            end    
            if  ESX.PlayerData.job.grade_name == 'eg' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturoneg()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlps' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturongdlps()       
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturongdlp()       
                        RageUI.CloseAll()
                    end
                end)
            end
  
            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturonbrc()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturonmaj()       
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturoncpts()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturonltn()       
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturoncpt()       
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturoncmd()       
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturoncdp()       
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("CEINTURON", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        ceinturonboss()       
                        RageUI.CloseAll()
                    end
                end)
            end         
                
-- FIN TENUE CEINTURON
                    
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("CEINTURON | Chef De Bord ", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturoncdbgdlp()       
            RageUI.CloseAll()
        end
    end)
end

if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("CEINTURON | Chef De Bord ", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturoncdbbrc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("CEINTURON | Chef De Bord ", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturoncdbmaj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("CEINTURON | Chef De Bord ", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturoncdbcpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("CEINTURON | Chef De Bord ", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturoncdbltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("CEINTURON | Chef De Bord ", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturoncdbcpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("CEINTURON | Chef De Bord ", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturoncdbcmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("CEINTURON | Chef De Bord ", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturoncdbcdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("CEINTURON | Chef De Bord ", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturoncdbboss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE CEINTURON | Chef De Bord 
                
if  ESX.PlayerData.job.grade_name == 'ads' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdads()        
            RageUI.CloseAll()
        end
    end)
end    
if  ESX.PlayerData.job.grade_name == 'eg' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdeg()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'gdlps' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdgdlps()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdgdlp()       
            RageUI.CloseAll()
        end
    end)
end
   
if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdbrc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdmaj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdcpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdcpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdcmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdcdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("CEINTURON | BTD", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            ceinturonbtdboss()       
            RageUI.CloseAll()
        end
    end)
end

-- FIN TENUE HOLSTER

RageUI.Separator("~y~↓ Holsters ↓")

if  ESX.PlayerData.job.grade_name == 'ads' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1ads()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'eg' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1eg()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'gdlps' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1gdlps()       
            RageUI.CloseAll()
        end
    end)
end                  
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1gdlp()       
            RageUI.CloseAll()
        end
    end)
end

if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1brc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1maj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1cpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1ltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1cpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1cmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1cdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("HOLSTER", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster1boss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE HOLSTERS 1

if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("HOLSTER | Cuisse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster2gdlp()       
            RageUI.CloseAll()
        end
    end)
end   
if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("HOLSTER | Cuisse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster2brc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("HOLSTER | Cuisse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster2maj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("HOLSTER | Cuisse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster2cpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("HOLSTER | Cuisse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster2ltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("HOLSTER | Cuisse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster2cpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("HOLSTER | Cuisse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster2cmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("HOLSTER | Cuisse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster2cdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("HOLSTER | Cuisse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster2boss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE HOLSTERS 2
                  
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("HOLSTER | Menotte", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster3gdlp()       
            RageUI.CloseAll()
        end
    end)
end

if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("HOLSTER | Menotte", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster3brc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("HOLSTER | Menotte", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster3maj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("HOLSTER | Menotte", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster3cpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("HOLSTER | Menotte", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster3ltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("HOLSTER | Menotte", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster3cpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("HOLSTER | Menotte", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster3cmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("HOLSTER | Menotte", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster3cdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("HOLSTER | Menotte", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster3boss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE HOLSTERS 3
                  
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("HOLSTER | PIE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster4gdlp()       
            RageUI.CloseAll()
        end
    end)
end

if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("HOLSTER | PIE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster4brc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("HOLSTER | PIE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster4maj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("HOLSTER | PIE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster4cpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("HOLSTER | PIE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster4ltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("HOLSTER | PIE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster4cpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("HOLSTER | PIE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster4cmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("HOLSTER | PIE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster4cdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("HOLSTER | PIE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            holster4boss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE HOLSTERS 4

        end, function()
        end)
        if not RageUI.Visible(Vpolice2) then
            Vpolice2 = RMenu:DeleteType("Vestiaire", true)
        end
    end
end

function vestiairepolicegpb()
    local Vpolice3 = RageUI.CreateMenu("Vestiaire", "Police Nationale")
    RageUI.Visible(Vpolice3, not RageUI.Visible(Vpolice3))
    while Vpolice3 do
        Citizen.Wait(0)
        RageUI.IsVisible(Vpolice3, true, true, true, function()
-- DEBUT TENUE SPE         
                RageUI.Separator("~r~↓ Vos équipements ↓")
                RageUI.Separator("~y~↓ Gilet Par Balles ↓")
            if  ESX.PlayerData.job.grade_name == 'ads' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1ads()        
                        RageUI.CloseAll()
                    end
                end)
            end    
            if  ESX.PlayerData.job.grade_name == 'eg' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1eg()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlps' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1gdlps()       
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'gdlp' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1gdlp()       
                        RageUI.CloseAll()
                    end
                end)
            end

            if  ESX.PlayerData.job.grade_name == 'brc' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1brc()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'maj' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1maj()       
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpts' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1cpts()        
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'cpt' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1ltn()       
                        RageUI.CloseAll()
                    end
                end)
            end  
            if  ESX.PlayerData.job.grade_name == 'cptp' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1cpt()       
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cmd' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1cmd()       
                        RageUI.CloseAll()
                    end
                end)
            end 
            if  ESX.PlayerData.job.grade_name == 'cdp' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1cdp()       
                        RageUI.CloseAll()
                    end
                end)
            end
            if  ESX.PlayerData.job.grade_name == 'boss' then
                RageUI.ButtonWithStyle("GPB Léger", nil, {
                    RightLabel = ""
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                        gilet1boss()       
                        RageUI.CloseAll()
                    end
                end)
            end         
                
-- FIN TENUE GILET 1
                
if  ESX.PlayerData.job.grade_name == 'ads' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4ads()        
            RageUI.CloseAll()
        end
    end)
end    
if  ESX.PlayerData.job.grade_name == 'eg' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4eg()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'gdlps' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4gdlps()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4gdlp()       
            RageUI.CloseAll()
        end
    end)
end
   
if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4brc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4maj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4cpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4ltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4cpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4cmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4cdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("Gilet CRS | Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet4boss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE GILET 4       
  
if  ESX.PlayerData.job.grade_name == 'ads' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2ads()       
            RageUI.CloseAll()
        end
    end)
end                
if  ESX.PlayerData.job.grade_name == 'eg' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2eg()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'gdlps' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2gdlps()       
            RageUI.CloseAll()
        end
    end)
end                
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2gdlp()       
            RageUI.CloseAll()
        end
    end)
end

if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2brc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2maj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2cpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2ltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2cpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2cmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2cdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("Gilet Gazeuse", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet2boss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE GILET 3    
                
if  ESX.PlayerData.job.grade_name == 'ads' then
    RageUI.ButtonWithStyle("", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5ads()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'eg' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5eg()       
            RageUI.CloseAll()
        end
    end)
end                
if  ESX.PlayerData.job.grade_name == 'gdlps' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5gdlps()       
            RageUI.CloseAll()
        end
    end)
end                
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5gdlp()       
            RageUI.CloseAll()
        end
    end)
end

if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5brc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5maj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5cpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5ltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5cpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5cmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5cdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("Gilet Tazer", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet5boss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE GILET 5                
                
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("Gilet BST", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet6gdlp()       
            RageUI.CloseAll()
        end
    end)
end
 
if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("Gilet BST", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet6brc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("Gilet BST", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet6maj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("Gilet BST", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet6cpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("Gilet BST", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet6ltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("Gilet BST", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet6cpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("Gilet BST", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet6cmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("Gilet BST", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet6cdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("Gilet BST", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet6boss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE GILET 6 
                
-- FIN TENUE GILET 2                
                
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("Gilet CI", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet3gdlp()       
            RageUI.CloseAll()
        end
    end)
end

if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("Gilet CI", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet3brc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("Gilet CI", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet3maj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("Gilet CI", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet3cpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("Gilet CI", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet3ltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("Gilet CI", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet3cpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("Gilet CI", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet3cmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("Gilet CI", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet3cdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("Gilet CI", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            gilet3boss()       
            RageUI.CloseAll()
        end
    end)
end               
                             
RageUI.Separator("~y~↓ Couvre-Chef ↓")

if  ESX.PlayerData.job.grade_name == 'ads' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotads()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'eg' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            caloteg()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'gdlps' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotgdlps()       
            RageUI.CloseAll()
        end
    end)
end                  
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotgdlp()       
            RageUI.CloseAll()
        end
    end)
end

if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotbrc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotmaj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotcpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotcpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotcmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotcdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("CALOT", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            calotboss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE CALOT

if  ESX.PlayerData.job.grade_name == 'ads' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetads()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'eg' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonneteg()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'gdlps' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetgdlps()       
            RageUI.CloseAll()
        end
    end)
end                  
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetgdlp()       
            RageUI.CloseAll()
        end
    end)
end
   
if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetbrc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetmaj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetcpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetcpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetcmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetcdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("BONNET", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            bonnetboss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE BONNET

if  ESX.PlayerData.job.grade_name == 'ads' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquetteads()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'eg' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquetteeg()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'gdlps' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquettegdlps()       
            RageUI.CloseAll()
        end
    end)
end                  
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquettegdlp()       
            RageUI.CloseAll()
        end
    end)
end

if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquettebrc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquettemaj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquettecpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquetteltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquettecpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquettecmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquettecdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("CASQUETTE", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquetteboss()       
            RageUI.CloseAll()
        end
    end)
end
                
-- FIN TENUE CASQUETTE

if  ESX.PlayerData.job.grade_name == 'ads' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casqueads()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'eg' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casqueeg()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'gdlps' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquegdlps()       
            RageUI.CloseAll()
        end
    end)
end                  
if  ESX.PlayerData.job.grade_name == 'gdlp' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquegdlp()       
            RageUI.CloseAll()
        end
    end)
end

if  ESX.PlayerData.job.grade_name == 'brc' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquebrc()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'maj' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquemaj()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpts' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquecpts()        
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'cpt' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casqueltn()       
            RageUI.CloseAll()
        end
    end)
end  
if  ESX.PlayerData.job.grade_name == 'cptp' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquecpt()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cmd' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquecmd()       
            RageUI.CloseAll()
        end
    end)
end 
if  ESX.PlayerData.job.grade_name == 'cdp' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casquecdp()       
            RageUI.CloseAll()
        end
    end)
end
if  ESX.PlayerData.job.grade_name == 'boss' then
    RageUI.ButtonWithStyle("CASQUE CRS", nil, {
        RightLabel = ""
    }, true, function(Hovered, Active, Selected)
        if Selected then
            casqueboss()       
            RageUI.CloseAll()
        end
    end)
end

        end, function()
        end)
        if not RageUI.Visible(Vpolice3) then
            Vpolice3 = RMenu:DeleteType("Vestiaire", true)
        end
    end
end

function tenuePoliceSecoursads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.ads.male
        else
            uniformObject = Config.PS.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourseg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.eg.male
        else
            uniformObject = Config.PS.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursgdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.gdlps.male
        else
            uniformObject = Config.PS.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursgdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.gdlp.male
        else
            uniformObject = Config.PS.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.brc.male
        else
            uniformObject = Config.PS.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.maj.male
        else
            uniformObject = Config.PS.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.cpts.male
        else
            uniformObject = Config.PS.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourcpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.cpt.male
        else
            uniformObject = Config.PS.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.cptp.male
        else
            uniformObject = Config.PS.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscommandant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.cmd.male
        else
            uniformObject = Config.PS.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.cdp.male
        else
            uniformObject = Config.PS.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PS.boss.male
        else
            uniformObject = Config.PS.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- Chaud
-- 
-- Chaud Bleu

function tenuePoliceSecoursbleuads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.ads.male
        else
            uniformObject = Config.PSBLEU.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleueg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.eg.male
        else
            uniformObject = Config.PSBLEU.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleugdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.gdlps.male
        else
            uniformObject = Config.PSBLEU.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleugdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.gdlp.male
        else
            uniformObject = Config.PSBLEU.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleubrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.brc.male
        else
            uniformObject = Config.PSBLEU.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleumaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.maj.male
        else
            uniformObject = Config.PSBLEU.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleucpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.cpts.male
        else
            uniformObject = Config.PSBLEU.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleultn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.cpt.male
        else
            uniformObject = Config.PSBLEU.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleucpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.cptp.male
        else
            uniformObject = Config.PSBLEU.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleucommandant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.cmd.male
        else
            uniformObject = Config.PSBLEU.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleucdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.cdp.male
        else
            uniformObject = Config.PSBLEU.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursbleuboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSBLEU.boss.male
        else
            uniformObject = Config.PSBLEU.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- Chaud Bleu
-- 
-- Froid

function tenuePoliceSecoursfroidads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.ads.male
        else
            uniformObject = Config.PSFroid.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroideg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.eg.male
        else
            uniformObject = Config.PSFroid.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidgdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.gdlps.male
        else
            uniformObject = Config.PSFroid.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidgdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.gdlp.male
        else
            uniformObject = Config.PSFroid.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.brc.male
        else
            uniformObject = Config.PSFroid.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidmaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.maj.male
        else
            uniformObject = Config.PSFroid.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidcpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.cpts.male
        else
            uniformObject = Config.PSFroid.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.cpt.male
        else
            uniformObject = Config.PSFroid.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidcpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.cptp.male
        else
            uniformObject = Config.PSFroid.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidcommandant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.cmd.male
        else
            uniformObject = Config.PSFroid.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidcdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.cdp.male
        else
            uniformObject = Config.PSFroid.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroid.boss.male
        else
            uniformObject = Config.PSFroid.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- Froid
-- 
-- Froid Bleu

function tenuePoliceSecoursfroidbleuads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.ads.male
        else
            uniformObject = Config.PSFroidBLEU.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleueg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.eg.male
        else
            uniformObject = Config.PSFroidBLEU.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleugdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.gdlps.male
        else
            uniformObject = Config.PSFroidBLEU.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleugdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.gdlp.male
        else
            uniformObject = Config.PSFroidBLEU.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleubrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.brc.male
        else
            uniformObject = Config.PSFroidBLEU.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleumaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.maj.male
        else
            uniformObject = Config.PSFroidBLEU.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleucpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.cpts.male
        else
            uniformObject = Config.PSFroidBLEU.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleultn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.cpt.male
        else
            uniformObject = Config.PSFroidBLEU.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleucpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.cptp.male
        else
            uniformObject = Config.PSFroidBLEU.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleucommandant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.cmd.male
        else
            uniformObject = Config.PSFroidBLEU.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleucdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.cdp.male
        else
            uniformObject = Config.PSFroidBLEU.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursfroidbleuboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PSFroidBLEU.boss.male
        else
            uniformObject = Config.PSFroidBLEU.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- Froid Bleu
-- 
-- C�r�monie

function tenuePoliceSecoursceremonieads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.ads.male
        else
            uniformObject = Config.CR.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremonieeg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.eg.male
        else
            uniformObject = Config.CR.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremoniegdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.gdlps.male
        else
            uniformObject = Config.CR.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremoniegdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.gdlp.male
        else
            uniformObject = Config.CR.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremoniebrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.brc.male
        else
            uniformObject = Config.CR.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremoniemaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.maj.male
        else
            uniformObject = Config.CR.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremoniecpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.cpts.male
        else
            uniformObject = Config.CR.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremonieltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.cpt.male
        else
            uniformObject = Config.CR.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremoniecpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.cptp.male
        else
            uniformObject = Config.CR.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremoniecommandant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.cmd.male
        else
            uniformObject = Config.CR.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremoniecdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.cdp.male
        else
            uniformObject = Config.CR.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursceremonieboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CR.boss.male
        else
            uniformObject = Config.CR.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- Froid Bleu
--
-- CRS

function tenuePoliceSecourscrsads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.ads.male
        else
            uniformObject = Config.CRS.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrseg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.eg.male
        else
            uniformObject = Config.CRS.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrsgdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.gdlps.male
        else
            uniformObject = Config.CRS.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrsgdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.gdlp.male
        else
            uniformObject = Config.CRS.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrsbrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.brc.male
        else
            uniformObject = Config.CRS.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrsmaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.maj.male
        else
            uniformObject = Config.CRS.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrscpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.cpts.male
        else
            uniformObject = Config.CRS.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrcpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.cpt.male
        else
            uniformObject = Config.CRS.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrscpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.cptp.male
        else
            uniformObject = Config.CRS.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrscommandant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.cmd.male
        else
            uniformObject = Config.CRS.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrscdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.cdp.male
        else
            uniformObject = Config.CRS.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourscrsboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CRS.boss.male
        else
            uniformObject = Config.CRS.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- CRS
-- 
-- C�r�monie

function tenuePoliceSecourspullads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.ads.male
        else
            uniformObject = Config.PULL.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspulleg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.eg.male
        else
            uniformObject = Config.PULL.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspullgdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.gdlps.male
        else
            uniformObject = Config.PULL.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspullgdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.gdlp.male
        else
            uniformObject = Config.PULL.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspullbrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.brc.male
        else
            uniformObject = Config.PULL.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspullmaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.maj.male
        else
            uniformObject = Config.PULL.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspullcpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.cpts.male
        else
            uniformObject = Config.PULL.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspullltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.cpt.male
        else
            uniformObject = Config.PULL.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspullcpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.cptp.male
        else
            uniformObject = Config.PULL.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspullcommandant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.cmd.male
        else
            uniformObject = Config.PULL.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspullcdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.cdp.male
        else
            uniformObject = Config.PULL.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecourspullboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.PULL.boss.male
        else
            uniformObject = Config.PULL.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- PULL
-- 
-- RAID

function tenueraidgdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.RAID.gdlp.male
        else
            uniformObject = Config.RAID.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenueraidbrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.RAID.brc.male
        else
            uniformObject = Config.RAID.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenueraidmaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.RAID.maj.male
        else
            uniformObject = Config.RAID.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenueraidcpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.RAID.cpts.male
        else
            uniformObject = Config.RAID.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenueraidltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.RAID.cpt.male
        else
            uniformObject = Config.RAID.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenueraidcpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.RAID.cptp.male
        else
            uniformObject = Config.RAID.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenueraidcommandant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.RAID.cmd.male
        else
            uniformObject = Config.RAID.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenueraidcdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.RAID.cdp.male
        else
            uniformObject = Config.RAID.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenueraidboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.RAID.boss.male
        else
            uniformObject = Config.RAID.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- RAID
--
-- Moto

function tenuePoliceSecoursmotogdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTO.gdlp.male
        else
            uniformObject = Config.MOTO.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end


function tenuePoliceSecoursmotobrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTO.brc.male
        else
            uniformObject = Config.MOTO.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotomaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTO.maj.male
        else
            uniformObject = Config.MOTO.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTO.cpts.male
        else
            uniformObject = Config.MOTO.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotoltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTO.cpt.male
        else
            uniformObject = Config.MOTO.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTO.cptp.male
        else
            uniformObject = Config.MOTO.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocommandant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTO.cmd.male
        else
            uniformObject = Config.MOTO.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTO.cdp.male
        else
            uniformObject = Config.MOTO.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotoboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTO.boss.male
        else
            uniformObject = Config.MOTO.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- Pull
-- 
-- Moto

function tenuePoliceSecoursmotocombigdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTOCOMBI.gdlp.male
        else
            uniformObject = Config.MOTOCOMBI.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocombibrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTOCOMBI.brc.male
        else
            uniformObject = Config.MOTOCOMBI.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocombimaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTOCOMBI.maj.male
        else
            uniformObject = Config.MOTOCOMBI.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocombicpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTOCOMBI.cpts.male
        else
            uniformObject = Config.MOTOCOMBI.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocombiltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTOCOMBI.cpt.male
        else
            uniformObject = Config.MOTOCOMBI.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocombicpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTOCOMBI.cptp.male
        else
            uniformObject = Config.MOTOCOMBI.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocombicommandant()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTOCOMBI.cmd.male
        else
            uniformObject = Config.MOTOCOMBI.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocombicdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTOCOMBI.cdp.male
        else
            uniformObject = Config.MOTOCOMBI.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function tenuePoliceSecoursmotocombiboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.MOTOCOMBI.boss.male
        else
            uniformObject = Config.MOTOCOMBI.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- Moto Combi
-- 
-- CEINTURON

function ceinturonads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.ads.male
        else
            uniformObject = Config.CEINTURON.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoneg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.eg.male
        else
            uniformObject = Config.CEINTURON.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturongdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.gdlps.male
        else
            uniformObject = Config.CEINTURON.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturongdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.gdlp.male
        else
            uniformObject = Config.CEINTURON.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end


function ceinturonbrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.brc.male
        else
            uniformObject = Config.CEINTURON.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonadsmaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.maj.male
        else
            uniformObject = Config.CEINTURON.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.cpts.male
        else
            uniformObject = Config.CEINTURON.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.cpt.male
        else
            uniformObject = Config.CEINTURON.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.cptp.male
        else
            uniformObject = Config.CEINTURON.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.cmd.male
        else
            uniformObject = Config.CEINTURON.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.cdp.male
        else
            uniformObject = Config.CEINTURON.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURON.boss.male
        else
            uniformObject = Config.CEINTURON.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- CEINTURON
-- 
-- CEINTURON Chef De Bord

function ceinturoncdbgdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONCDB.gdlp.male
        else
            uniformObject = Config.CEINTURONCDB.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncdbbrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONCDB.brc.male
        else
            uniformObject = Config.CEINTURONCDB.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncdbmaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONCDB.maj.male
        else
            uniformObject = Config.CEINTURONCDB.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncdbcpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONCDB.cpts.male
        else
            uniformObject = Config.CEINTURONCDB.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncdbltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONCDB.cpt.male
        else
            uniformObject = Config.CEINTURONCDB.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncdbcpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONCDB.cptp.male
        else
            uniformObject = Config.CEINTURONCDB.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncdbcmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONCDB.cmd.male
        else
            uniformObject = Config.CEINTURONCDB.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncdbcdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONCDB.cdp.male
        else
            uniformObject = Config.CEINTURONCDB.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturoncdbboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONCDB.boss.male
        else
            uniformObject = Config.CEINTURONCDB.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- CEINTURON Chef De Bord
-- 
-- CEINTURON BTD

function ceinturonbtdads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.ads.male
        else
            uniformObject = Config.CEINTURONBTD.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdeg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.eg.male
        else
            uniformObject = Config.CEINTURONBTD.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdgdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.gdlps.male
        else
            uniformObject = Config.CEINTURONBTD.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdgdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.gdlp.male
        else
            uniformObject = Config.CEINTURONBTD.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdbrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.brc.male
        else
            uniformObject = Config.CEINTURONBTD.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdmaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.maj.male
        else
            uniformObject = Config.CEINTURONBTD.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdcpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.cpts.male
        else
            uniformObject = Config.CEINTURONBTD.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.cpt.male
        else
            uniformObject = Config.CEINTURONBTD.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdcpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.cptp.male
        else
            uniformObject = Config.CEINTURONBTD.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdcmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.cmd.male
        else
            uniformObject = Config.CEINTURONBTD.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdcdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.cdp.male
        else
            uniformObject = Config.CEINTURONBTD.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function ceinturonbtdboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CEINTURONBTD.boss.male
        else
            uniformObject = Config.CEINTURONBTD.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- CEINTURON BTD
-- 
-- HOLSTER1

function holster1ads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.ads.male
        else
            uniformObject = Config.HOLSTER1.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1eg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.eg.male
        else
            uniformObject = Config.HOLSTER1.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1gdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.gdlps.male
        else
            uniformObject = Config.HOLSTER1.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1gdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.gdlp.male
        else
            uniformObject = Config.HOLSTER1.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1brc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.brc.male
        else
            uniformObject = Config.HOLSTER1.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1maj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.maj.male
        else
            uniformObject = Config.HOLSTER1.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1cpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.cpts.male
        else
            uniformObject = Config.HOLSTER1.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1ltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.cpt.male
        else
            uniformObject = Config.HOLSTER1.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1cpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.cptp.male
        else
            uniformObject = Config.HOLSTER1.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1cmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.cmd.male
        else
            uniformObject = Config.HOLSTER1.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1cdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.cdp.male
        else
            uniformObject = Config.HOLSTER1.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster1boss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER1.boss.male
        else
            uniformObject = Config.HOLSTER1.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- HOLSTER 1
-- 
-- HOLSTER 2

function holster2ads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.ads.male
        else
            uniformObject = Config.HOLSTER2.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster2eg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.eg.male
        else
            uniformObject = Config.HOLSTER2.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster2gdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.gdlps.male
        else
            uniformObject = Config.HOLSTER2.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster2gdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.gdlp.male
        else
            uniformObject = Config.HOLSTER2.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end


function holster2brc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.brc.male
        else
            uniformObject = Config.HOLSTER2.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster2maj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.maj.male
        else
            uniformObject = Config.HOLSTER2.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster2cpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.cpts.male
        else
            uniformObject = Config.HOLSTER2.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster2ltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.cpt.male
        else
            uniformObject = Config.HOLSTER2.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster2cpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.cptp.male
        else
            uniformObject = Config.HOLSTER2.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster2cmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.cmd.male
        else
            uniformObject = Config.HOLSTER2.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster2cdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.cdp.male
        else
            uniformObject = Config.HOLSTER2.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster2boss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER2.boss.male
        else
            uniformObject = Config.HOLSTER2.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- HOLSTER 2
-- 
-- HOLSTER 3

function holster3ads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.ads.male
        else
            uniformObject = Config.HOLSTER3.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3eg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.eg.male
        else
            uniformObject = Config.HOLSTER3.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3gdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.gdlps.male
        else
            uniformObject = Config.HOLSTER3.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3gdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.gdlp.male
        else
            uniformObject = Config.HOLSTER3.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3brc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.brc.male
        else
            uniformObject = Config.HOLSTER3.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3maj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.maj.male
        else
            uniformObject = Config.HOLSTER3.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3cpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.cpts.male
        else
            uniformObject = Config.HOLSTER3.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3ltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.cpt.male
        else
            uniformObject = Config.HOLSTER3.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3cpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.cptp.male
        else
            uniformObject = Config.HOLSTER3.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3cmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.cmd.male
        else
            uniformObject = Config.HOLSTER3.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3cdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.cdp.male
        else
            uniformObject = Config.HOLSTER3.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster3boss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER3.boss.male
        else
            uniformObject = Config.HOLSTER3.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- HOLSTER 3
-- 
-- HOLSTER 4

function holster4ads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.ads.male
        else
            uniformObject = Config.HOLSTER4.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4eg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.eg.male
        else
            uniformObject = Config.HOLSTER4.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4gdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.gdlps.male
        else
            uniformObject = Config.HOLSTER4.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4gdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.gdlp.male
        else
            uniformObject = Config.HOLSTER4.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4brc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.brc.male
        else
            uniformObject = Config.HOLSTER4.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4maj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.maj.male
        else
            uniformObject = Config.HOLSTER4.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4cpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.cpts.male
        else
            uniformObject = Config.HOLSTER4.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4ltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.cpt.male
        else
            uniformObject = Config.HOLSTER4.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4cpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.cptp.male
        else
            uniformObject = Config.HOLSTER4.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4cmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.cmd.male
        else
            uniformObject = Config.HOLSTER4.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4cdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.cdp.male
        else
            uniformObject = Config.HOLSTER4.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function holster4boss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.HOLSTER4.boss.male
        else
            uniformObject = Config.HOLSTER4.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- HOLSTER 4
-- 
-- CALOT

function calotads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.ads.male
        else
            uniformObject = Config.CALOT.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function caloteg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.eg.male
        else
            uniformObject = Config.CALOT.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function calotgdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.gdlps.male
        else
            uniformObject = Config.CALOT.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function calotgdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.gdlp.male
        else
            uniformObject = Config.CALOT.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function calotbrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.brc.male
        else
            uniformObject = Config.CALOT.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function calotmaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.maj.male
        else
            uniformObject = Config.CALOT.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function calotcpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.cpts.male
        else
            uniformObject = Config.CALOT.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function calotltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.cpt.male
        else
            uniformObject = Config.CALOT.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function calotcpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.cptp.male
        else
            uniformObject = Config.CALOT.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function calotcmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.cmd.male
        else
            uniformObject = Config.CALOT.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function calotcdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.cdp.male
        else
            uniformObject = Config.CALOT.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function calotboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CALOT.boss.male
        else
            uniformObject = Config.CALOT.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- CALOT
-- 
-- BONNET

function bonnetads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.ads.male
        else
            uniformObject = Config.BONNET.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonneteg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.eg.male
        else
            uniformObject = Config.BONNET.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonnetgdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.gdlps.male
        else
            uniformObject = Config.BONNET.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonnetgdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.gdlp.male
        else
            uniformObject = Config.BONNET.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonnetbrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.brc.male
        else
            uniformObject = Config.BONNET.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonnetmaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.maj.male
        else
            uniformObject = Config.BONNET.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonnetcpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.cpts.male
        else
            uniformObject = Config.BONNET.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonnetltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.cpt.male
        else
            uniformObject = Config.BONNET.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonnetcpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.cptp.male
        else
            uniformObject = Config.BONNET.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonnetcmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.cmd.male
        else
            uniformObject = Config.BONNET.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonnetcdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.cdp.male
        else
            uniformObject = Config.BONNET.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function bonnetboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.BONNET.boss.male
        else
            uniformObject = Config.BONNET.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- BONNET
-- 
-- CASQUETTE

function casquetteads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.ads.male
        else
            uniformObject = Config.CASQUETTE.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquetteeg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.eg.male
        else
            uniformObject = Config.CASQUETTE.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquettegdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.gdlps.male
        else
            uniformObject = Config.CASQUETTE.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquettegdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.gdlp.male
        else
            uniformObject = Config.CASQUETTE.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquettebrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.brc.male
        else
            uniformObject = Config.CASQUETTE.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquettemaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.maj.male
        else
            uniformObject = Config.CASQUETTE.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquettecpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.cpts.male
        else
            uniformObject = Config.CASQUETTE.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquetteltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.cpt.male
        else
            uniformObject = Config.CASQUETTE.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquettecpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.cptp.male
        else
            uniformObject = Config.CASQUETTE.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquettecmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.cmd.male
        else
            uniformObject = Config.CASQUETTE.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquettecdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.cdp.male
        else
            uniformObject = Config.CASQUETTE.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquetteboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUETTE.boss.male
        else
            uniformObject = Config.CASQUETTE.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- CASQUETTE
--
-- CASQUECRS

function casqueads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.ads.male
        else
            uniformObject = Config.CASQUETTE.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casqueeg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.eg.male
        else
            uniformObject = Config.CASQUECRS.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquegdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.gdlps.male
        else
            uniformObject = Config.CASQUECRS.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquegdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.gdlp.male
        else
            uniformObject = Config.CASQUECRS.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end


function casquebrc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.brc.male
        else
            uniformObject = Config.CASQUECRS.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquemaj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.maj.male
        else
            uniformObject = Config.CASQUECRS.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquecpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.cpts.male
        else
            uniformObject = Config.CASQUECRS.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casqueltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.cpt.male
        else
            uniformObject = Config.CASQUECRS.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquecpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.cptp.male
        else
            uniformObject = Config.CASQUECRS.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquecmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.cmd.male
        else
            uniformObject = Config.CASQUECRS.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casquecdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.cdp.male
        else
            uniformObject = Config.CASQUECRS.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function casqueboss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.CASQUECRS.boss.male
        else
            uniformObject = Config.CASQUECRS.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- CASQUECRS
-- 
-- GILET1

function gilet1ads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.ads.male
        else
            uniformObject = Config.GILET1.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1eg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.eg.male
        else
            uniformObject = Config.GILET1.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1gdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.gdlps.male
        else
            uniformObject = Config.GILET1.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1gdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.gdlp.male
        else
            uniformObject = Config.GILET1.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1brc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.brc.male
        else
            uniformObject = Config.GILET1.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1maj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.maj.male
        else
            uniformObject = Config.GILET1.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1cpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.cpts.male
        else
            uniformObject = Config.GILET1.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1ltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.cpt.male
        else
            uniformObject = Config.GILET1.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1cpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.cptp.male
        else
            uniformObject = Config.GILET1.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1cmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.cmd.male
        else
            uniformObject = Config.GILET1.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1cdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.cdp.male
        else
            uniformObject = Config.GILET1.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet1boss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET1.boss.male
        else
            uniformObject = Config.GILET1.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- GILET 1
-- 
-- GILET 2

function gilet2ads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.ads.male
        else
            uniformObject = Config.GILET2.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2eg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.eg.male
        else
            uniformObject = Config.GILET2.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2gdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.gdlps.male
        else
            uniformObject = Config.GILET2.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2gdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.gdlp.male
        else
            uniformObject = Config.GILET2.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2brc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.brc.male
        else
            uniformObject = Config.GILET2.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2maj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.maj.male
        else
            uniformObject = Config.GILET2.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2cpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.cpts.male
        else
            uniformObject = Config.GILET2.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2ltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.cpt.male
        else
            uniformObject = Config.GILET2.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2cpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.cptp.male
        else
            uniformObject = Config.GILET2.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2cmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.cmd.male
        else
            uniformObject = Config.GILET2.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2cdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.cdp.male
        else
            uniformObject = Config.GILET2.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet2boss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET2.boss.male
        else
            uniformObject = Config.GILET2.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- GILET 2
-- 
-- GILET 3

function gilet3gdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET3.gdlp.male
        else
            uniformObject = Config.GILET3.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet3brc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET3.brc.male
        else
            uniformObject = Config.GILET3.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet3maj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET3.maj.male
        else
            uniformObject = Config.GILET3.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet3cpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET3.cpts.male
        else
            uniformObject = Config.GILET3.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet3ltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET3.cpt.male
        else
            uniformObject = Config.GILET3.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet3cpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET3.cptp.male
        else
            uniformObject = Config.GILET3.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet3cmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET3.cmd.male
        else
            uniformObject = Config.GILET3.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet3cdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET3.cdp.male
        else
            uniformObject = Config.GILET3.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet3boss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET3.boss.male
        else
            uniformObject = Config.GILET3.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- GILET 3
-- 
-- GILET 4

function gilet4ads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.ads.male
        else
            uniformObject = Config.GILET4.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4eg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.eg.male
        else
            uniformObject = Config.GILET4.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4gdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.gdlps.male
        else
            uniformObject = Config.GILET4.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4gdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.gdlp.male
        else
            uniformObject = Config.GILET4.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4brc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.brc.male
        else
            uniformObject = Config.GILET4.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4maj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.maj.male
        else
            uniformObject = Config.GILET4.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4cpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.cpts.male
        else
            uniformObject = Config.GILET4.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4ltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.cpt.male
        else
            uniformObject = Config.GILET4.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4cpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.cptp.male
        else
            uniformObject = Config.GILET4.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4cmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.cmd.male
        else
            uniformObject = Config.GILET4.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4cdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.cdp.male
        else
            uniformObject = Config.GILET4.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet4boss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET4.boss.male
        else
            uniformObject = Config.GILET4.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- GILET 4
-- 
-- GILET 5

function gilet5ads()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.ads.male
        else
            uniformObject = Config.GILET5.ads.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end
function gilet5eg()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.eg.male
        else
            uniformObject = Config.GILET5.eg.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end
function gilet5gdlps()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.gdlps.male
        else
            uniformObject = Config.GILET5.gdlps.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end
function gilet5gdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.gdlp.male
        else
            uniformObject = Config.GILET5.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet5brc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.brc.male
        else
            uniformObject = Config.GILET5.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet5maj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.maj.male
        else
            uniformObject = Config.GILET5.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet5cpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.cpts.male
        else
            uniformObject = Config.GILET5.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet5ltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.cpt.male
        else
            uniformObject = Config.GILET5.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet5cpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.cptp.male
        else
            uniformObject = Config.GILET5.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet5cmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.cmd.male
        else
            uniformObject = Config.GILET5.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet5cdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.cdp.male
        else
            uniformObject = Config.GILET5.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet5boss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET5.boss.male
        else
            uniformObject = Config.GILET5.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- GILET 5
-- 
-- GILET 6

function gilet6gdlp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET6.gdlp.male
        else
            uniformObject = Config.GILET6.gdlp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end
function gilet6brc()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET6.brc.male
        else
            uniformObject = Config.GILET6.brc.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet6maj()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET6.maj.male
        else
            uniformObject = Config.GILET6.maj.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet6cpts()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET6.cpts.male
        else
            uniformObject = Config.GILET6.cpts.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet6ltn()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET6.cpt.male
        else
            uniformObject = Config.GILET6.cpt.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet6cpt()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET6.cptp.male
        else
            uniformObject = Config.GILET6.cptp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet6cmd()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET6.cmd.male
        else
            uniformObject = Config.GILET6.cmd.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet6cdp()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET6.cdp.male
        else
            uniformObject = Config.GILET6.cdp.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

function gilet6boss()
    TriggerEvent('skinchanger:getSkin', function(skin)
        local uniformObject
        if skin.sex == 0 then
            uniformObject = Config.GILET6.boss.male
        else
            uniformObject = Config.GILET6.boss.female
        end
        if uniformObject then
            TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
        end
    end)
end

-- Autre



function vcivil()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
end
                
Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Config.pos.vestiaire.position.x,
                Config.pos.vestiaire.position.y, Config.pos.vestiaire.position.z)
            if jobdist <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.vestiaire.position.x, Config.pos.vestiaire.position.y,
                    Config.pos.vestiaire.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1,
                    2, 0, nil, nil, 0)
            end
            if jobdist <= 1.0 then
                Timer = 0
                RageUI.Text({
                    message = "Appuyez sur ~b~[E]~s~ pour accéder au vestiaire",
                    time_display = 1
                })
                if IsControlJustPressed(1, 51) then
                    vestiairepolice()
                end
            end
        end
        Citizen.Wait(Timer)
    end
end)  

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Config.pos.vestiaire.position.x,
                Config.pos.vestiaire.position.y, Config.pos.vestiaire.position.z)
            if jobdist <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.vestiaire.position.x, Config.pos.vestiaire.position.y,
                    Config.pos.vestiaire.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1,
                    2, 0, nil, nil, 0)
            end
            if jobdist <= 1.0 then
                Timer = 0
                RageUI.Text({
                    message = "Appuyez sur ~b~[E]~s~ pour accéder au vestiaire",
                    time_display = 1
                })
                if IsControlJustPressed(1, 51) then
                    vestiairepolice()
                end
            end
        end
        Citizen.Wait(Timer)
    end
end)

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Config.pos.vestiaire2.position.x,
                Config.pos.vestiaire2.position.y, Config.pos.vestiaire2.position.z)
            if jobdist <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.vestiaire2.position.x, Config.pos.vestiaire2.position.y,
                    Config.pos.vestiaire2.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1,
                    2, 0, nil, nil, 0)
            end
            if jobdist <= 1.0 then
                Timer = 0
                RageUI.Text({
                    message = "Appuyez sur ~b~[E]~s~ pour accéder au vestiaire",
                    time_display = 1
                })
                if IsControlJustPressed(1, 51) then
                    vestiairepoliceceinturon()
                end
            end
        end
        Citizen.Wait(Timer)
    end
end)

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Config.pos.vestiaire3.position.x,
                Config.pos.vestiaire3.position.y, Config.pos.vestiaire3.position.z)
            if jobdist <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.vestiaire3.position.x, Config.pos.vestiaire3.position.y,
                    Config.pos.vestiaire3.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1,
                    2, 0, nil, nil, 0)
            end
            if jobdist <= 1.0 then
                Timer = 0
                RageUI.Text({
                    message = "Appuyez sur ~b~[E]~s~ pour accéder au vestiaire",
                    time_display = 1
                })
                if IsControlJustPressed(1, 51) then
                    vestiairepolicegpb()
                end
            end
        end
        Citizen.Wait(Timer)
    end
end)

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, Config.pos.vestiaire4.position.x,
                Config.pos.vestiaire4.position.y, Config.pos.vestiaire4.position.z)
            if jobdist <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.vestiaire4.position.x, Config.pos.vestiaire4.position.y,
                    Config.pos.vestiaire4.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1,
                    2, 0, nil, nil, 0)
            end
            if jobdist <= 1.0 then
                Timer = 0
                RageUI.Text({
                    message = "Appuyez sur ~b~[E]~s~ pour accéder au vestiaire",
                    time_display = 1
                })
                if IsControlJustPressed(1, 51) then
                    vestiairepolice4()
                end
            end
        end
        Citizen.Wait(Timer)
    end
end)

--- fin

-- Garage

function Garagepolice()
    local Gpolice = RageUI.CreateMenu("Garage", "Police Nationale")
    RageUI.Visible(Gpolice, not RageUI.Visible(Gpolice))
    while Gpolice do
        Citizen.Wait(0)
        RageUI.IsVisible(Gpolice, true, true, true, function()
            RageUI.ButtonWithStyle("~r~Ranger la voiture", nil, {
                RightLabel = "?"
            }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local veh, dist4 = ESX.Game.GetClosestVehicle(playerCoords)
                    if dist4 < 4 then
                        DeleteEntity(veh)
                    end
                end
            end)
                RageUI.Separator("~y~↓ Véhicules Police Secours ↓")
            for k, v in pairs(Gpolicevoiture) do
                RageUI.ButtonWithStyle(v.nom, nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        Citizen.Wait(1)
                        spawnuniCarpolice(v.modele)
                        RageUI.CloseAll()
                    end
                end)
            end
                RageUI.Separator("~y~↓ Véhicules Banalisé ↓")
            for k, v in pairs(Gpolicevoiturebana) do
                RageUI.ButtonWithStyle(v.nom, nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        Citizen.Wait(1)
                        spawnuniCarpolice(v.modele)
                        RageUI.CloseAll()
                    end
                end)
            end
            RageUI.Separator("~y~↓ Véhicules BRI ↓")
            for k, v in pairs(Gpolicevoiturebri) do
                RageUI.ButtonWithStyle(v.nom, nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        Citizen.Wait(1)
                        spawnuniCarpolice(v.modele)
                        RageUI.CloseAll()
                    end
                end)
            end
            RageUI.Separator("~y~↓ Véhicules Motocycliste ↓")
            for k, v in pairs(Gpolicemoto) do
                RageUI.ButtonWithStyle(v.nom, nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        Citizen.Wait(1)
                        spawnuniCarpolice(v.modele)
                        RageUI.CloseAll()
                    end
                end)
            end 
            RageUI.Separator("~y~↓ Véhicules Mobile ↓")
            for k, v in pairs(Gpolicevoiturecrs) do
                RageUI.ButtonWithStyle(v.nom, nil, {
                    RightLabel = "?"
                }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        Citizen.Wait(1)
                        spawnuniCarpolice(v.modele)
                        RageUI.CloseAll()
                    end
                end)
            end    
        end, function()
        end)
        if not RageUI.Visible(Gpolice) then
            Gpolice = RMenu:DeleteType("Garage", true)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.pos.garage.position.x,
                Config.pos.garage.position.y, Config.pos.garage.position.z)
            if dist3 <= 10.0 and Config.jeveuxmarker then
                Timer = 0
                DrawMarker(20, Config.pos.garage.position.x, Config.pos.garage.position.y, Config.pos.garage.position.z,
                    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist3 <= 3.0 then
                Timer = 0
                RageUI.Text({
                    message = "Appuyez sur ~b~[E]~s~ pour accéder au garage",
                    time_display = 1
                })
                if IsControlJustPressed(1, 51) then
                    Garagepolice()
                end
            end
        end
        Citizen.Wait(Timer)
    end
end)

function spawnuniCarpolice(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, Config.pos.spawnvoiture.position.x, Config.pos.spawnvoiture.position.y,
        Config.pos.spawnvoiture.position.z, Config.pos.spawnvoiture.position.h, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "AZPTQ" .. math.random(1, 9)
    SetVehicleNumberPlateText(vehicle, plaque)
    SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
end

RegisterNetEvent('renfort:setBlip')
AddEventHandler('renfort:setBlip', function(coords, raison)
    if raison == 'ass' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        ESX.ShowAdvancedNotification('Police Nationale', '~b~GPS Patrouille',
            "Demande d'assitance demand�.\n~w~Importance: ~g~L�g�re.", 'CHAR_MP_MERRYWEATHER', 8)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        color = 2
    elseif raison == 'SOS' then
        PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
        PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
        ESX.ShowAdvancedNotification('Police Nationale', '~b~GPS Patrouille',
            "Appel d'Urgence !\n~r~ACTION PRIORITAIRE !",
            'CHAR_MP_MERRYWEATHER', 8)
        Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
        color = 1
    end
    local blipId = AddBlipForCoord(coords)
    SetBlipSprite(blipId, 161)
    SetBlipScale(blipId, 1.2)
    SetBlipColour(blipId, color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Demande renfort")
    EndTextCommandSetBlipName(blipId)
    Wait(80 * 1000)
    RemoveBlip(blipId)
end)

local shieldActive = false
local shieldEntity = nil

-- ANIM
local animDict = "combat@gestures@gang@pistol_1h@beckon"
local animName = "0"

local prop = "prop_ballistic_shield"

function EnableShield()
    shieldActive = true
    local ped = GetPlayerPed(-1)
    local pedPos = GetEntityCoords(ped, false)

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(250)
    end

    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)

    RequestModel(GetHashKey(prop))
    while not HasModelLoaded(GetHashKey(prop)) do
        Citizen.Wait(250)
    end

    local shield = CreateObject(GetHashKey(prop), pedPos.x, pedPos.y, pedPos.z, 1, 1, 1)
    shieldEntity = shield
    AttachEntityToEntity(shieldEntity, ped, GetEntityBoneIndexByName(ped, "IK_L_Hand"), 0.0, -0.05, -0.10, -30.0, 180.0,
        40.0, 0, 0, 1, 0, 0, 1)
    SetWeaponAnimationOverride(ped, GetHashKey("Gang1H"))
    SetEnableHandcuffs(ped, true)
end

function DisableShield()
    local ped = GetPlayerPed(-1)
    DeleteEntity(shieldEntity)
    ClearPedTasksImmediately(ped)
    SetWeaponAnimationOverride(ped, GetHashKey("Default"))
    SetEnableHandcuffs(ped, false)
    shieldActive = false
end

Citizen.CreateThread(function()
    while true do
        if shieldActive then
            local ped = GetPlayerPed(-1)
            if not IsEntityPlayingAnim(ped, animDict, animName, 1) then
                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    Citizen.Wait(100)
                end

                TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)
            end
        end
        Citizen.Wait(500)
    end
end)

----- Soutien police

function SpawnVehicle1()
    local playerPed = PlayerPedId()
    local PedPosition = GetEntityCoords(playerPed)
    hashKey = GetHashKey(Config.ped1)
    pedType = GetPedType(hashKey)
    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(100)
    end
    chasePed = CreatePed(pedType, hashKey, PedPosition.x + 2, PedPosition.y, PedPosition.z, 250.00, 1, 1)
    ESX.Game.SpawnVehicle(Config.vehicle1, {
        x = PedPosition.x + 10,
        y = PedPosition.y,
        z = PedPosition.z
    }, 120, function(callback_vehicle)
        chaseVehicle = callback_vehicle
        local vehicle = GetVehiclePedIsIn(PlayerPed, true)
        SetVehicleUndriveable(chaseVehicle, false)
        SetVehicleEngineOn(chaseVehicle, true, true)
        while not chasePed do
            Citizen.Wait(100)
        end
        PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
        TaskWarpPedIntoVehicle(chasePed, chaseVehicle, -1)
        TaskVehicleFollow(chasePed, chaseVehicle, playerPed, 50.0, 1, 5)
        SetDriveTaskDrivingStyle(chasePed, 786468)
        SetVehicleSiren(chaseVehicle, true)
    end)
end

function SpawnVehicle2()
    local playerPed = PlayerPedId()
    local PedPosition = GetEntityCoords(playerPed)
    hashKey2 = GetHashKey(Config.ped2)
    pedType2 = GetPedType(hashKey)
    RequestModel(hashKey2)
    while not HasModelLoaded(hashKey2) do
        RequestModel(hashKey2)
        Citizen.Wait(100)
    end
    chasePed2 = CreatePed(pedType2, hashKey2, PedPosition.x + 4, PedPosition.y, PedPosition.z, 250.00, 1, 1)
    ESX.Game.SpawnVehicle(Config.vehicle2, {
        x = PedPosition.x + 15,
        y = PedPosition.y,
        z = PedPosition.z
    }, 120, function(callback_vehicle2)
        chaseVehicle2 = callback_vehicle2
        local vehicle = GetVehiclePedIsIn(PlayerPed, true)
        SetVehicleUndriveable(chaseVehicle2, false)
        SetVehicleEngineOn(chaseVehicle2, true, true)
        while not chasePed2 do
            Citizen.Wait(100)
        end
        while not chaseVehicle2 do
            Citizen.Wait(100)
        end
        PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
        TaskWarpPedIntoVehicle(chasePed2, chaseVehicle2, -1)
        TaskVehicleFollow(chasePed2, chaseVehicle2, playerPed, 50.0, 1, 5)
        SetDriveTaskDrivingStyle(chasePed2, 786468)
        SetVehicleSiren(chaseVehicle2, true)
    end)
end

function SpawnVehicle3()
    local playerPed = PlayerPedId()
    local PedPosition = GetEntityCoords(playerPed)
    hashKey3 = GetHashKey(Config.ped3)
    pedType3 = GetPedType(hashKey)
    RequestModel(hashKey3)
    while not HasModelLoaded(hashKey3) do
        RequestModel(hashKey3)
        Citizen.Wait(100)
    end
    chasePed3 = CreatePed(pedType3, hashKey3, PedPosition.x + 2, PedPosition.y, PedPosition.z, 250.00, 1, 1)
    ESX.Game.SpawnVehicle(Config.vehicle3, {
        x = PedPosition.x + 10,
        y = PedPosition.y,
        z = PedPosition.z
    }, 120, function(callback_vehicle3)
        chaseVehicle3 = callback_vehicle3
        local vehicle = GetVehiclePedIsIn(PlayerPed, true)
        SetVehicleUndriveable(chaseVehicle3, false)
        SetVehicleEngineOn(chaseVehicle3, true, true)
        while not chasePed3 do
            Citizen.Wait(100)
        end
        while not chaseVehicle3 do
            Citizen.Wait(100)
        end
        PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
        TaskWarpPedIntoVehicle(chasePed3, chaseVehicle3, -1)
        TaskVehicleFollow(chasePed3, chaseVehicle3, playerPed, 50.0, 1, 5)
        SetDriveTaskDrivingStyle(chasePed3, 786468)
        SetVehicleSiren(chaseVehicle3, true)
    end)
end

function SpawnVehicle4()
    local playerPed = PlayerPedId()
    local PedPosition = GetEntityCoords(playerPed)
    hashKey4 = GetHashKey(Config.ped4)
    pedType4 = GetPedType(hashKey)
    RequestModel(hashKey4)
    while not HasModelLoaded(hashKey4) do
        RequestModel(hashKey4)
        Citizen.Wait(100)
    end
    chasePed4 = CreatePed(pedType4, hashKey4, PedPosition.x + 2, PedPosition.y, PedPosition.z, 250.00, 1, 1)
    ESX.Game.SpawnVehicle(Config.vehicle4, {
        x = PedPosition.x + 10,
        y = PedPosition.y,
        z = PedPosition.z
    }, 120, function(callback_vehicle4)
        chaseVehicle4 = callback_vehicle4
        local vehicle = GetVehiclePedIsIn(PlayerPed, true)
        SetVehicleUndriveable(chaseVehicle4, false)
        SetVehicleEngineOn(chaseVehicle4, true, true)
        while not chasePed4 do
            Citizen.Wait(100)
        end
        while not chaseVehicle4 do
            Citizen.Wait(100)
        end
        PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
        TaskWarpPedIntoVehicle(chasePed4, chaseVehicle4, -1)
        TaskVehicleFollow(chasePed4, chaseVehicle4, playerPed, 50.0, 1, 5)
        SetDriveTaskDrivingStyle(chasePed4, 786468)
        SetVehicleSiren(chaseVehicle4, true)
    end)
end

function SpawnVehicle5()
    local playerPed = PlayerPedId()
    local PedPosition = GetEntityCoords(playerPed)
    hashKey5 = GetHashKey(Config.ped5)
    pedType5 = GetPedType(hashKey)
    RequestModel(hashKey5)
    while not HasModelLoaded(hashKey5) do
        RequestModel(hashKey5)
        Citizen.Wait(100)
    end
    chasePed5 = CreatePed(pedType5, hashKey5, PedPosition.x + 2, PedPosition.y, PedPosition.z, 250.00, 1, 1)
    ESX.Game.SpawnVehicle(Config.vehicle5, {
        x = PedPosition.x + 10,
        y = PedPosition.y,
        z = PedPosition.z
    }, 120, function(callback_vehicle5)
        chaseVehicle5 = callback_vehicle5
        local vehicle = GetVehiclePedIsIn(PlayerPed, true)
        SetVehicleUndriveable(chaseVehicle5, false)
        SetVehicleEngineOn(chaseVehicle5, true, true)
        while not chasePed5 do
            Citizen.Wait(100)
        end
        while not chaseVehicle5 do
            Citizen.Wait(100)
        end
        PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
        TaskWarpPedIntoVehicle(chasePed5, chaseVehicle5, freeSeat)
        TaskVehicleFollow(chasePed5, chaseVehicle5, playerPed, 50.0, 1, 5)
        SetDriveTaskDrivingStyle(chasePed5, 786468)
        SetVehicleSiren(chaseVehicle5, false)
    end)
end

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
        RequestAnimDict(dict)
    end
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end