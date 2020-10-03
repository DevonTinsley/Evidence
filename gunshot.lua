local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
TriggerEvent('es:addCommand', 'collectcasings', function(source, args, user) end)

local HasShotRecently = false




function HasShot()
   --S ESX.ShowNotification(_U('You Shot!'))
    TriggerEvent('mythic_notify:client:SendErrorAlert', {text = 'You drop some bullet casings.'})
    local text = "Some bullet casings left by"
    local location = GetEntityCoords(GetPlayerPed(-1))
    TriggerServerEvent("server:newNote",text,location["x"],location["y"],location["z"])

    HasShotRecently = true
    Citizen.Wait(50000)
    HasShotRecently = false
    
end

Citizen.CreateThread(function()

    while true do
        ped = PlayerPedId()
        Citizen.Wait(0)

        if IsPedShooting(ped) then
            if (HasShotRecently == false) then
                HasShot()
            end

            
        end
    end
end)
