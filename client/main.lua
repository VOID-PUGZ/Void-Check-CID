local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('checkcid', function()
    local playerData = QBCore.Functions.GetPlayerData()
    local cid = playerData and playerData.citizenid or nil

    if not cid then
        lib.notify({
            title = 'Citizen ID',
            description = 'Could not find your Citizen ID.',
            type = 'error',
            position = 'top',
        })
        return
    end

    local formatted = ('Citizen ID: %s'):format(cid)

    -- copy raw CID to clipboard
    if lib and lib.setClipboard then
        lib.setClipboard(cid)
    end

    lib.notify({
        title = 'Citizen ID',
        description = formatted .. '\nCopied to clipboard',
        type = 'success',
    })
end, false)


AddEventHandler('onClientResourceStart', function(res)
    if res ~= GetCurrentResourceName() then return end
    TriggerEvent('chat:addSuggestion', '/checkcid', 'Show your Citizen ID')
end)
