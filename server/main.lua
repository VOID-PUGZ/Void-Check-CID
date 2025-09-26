local QBCore = exports['qb-core']:GetCoreObject()


lib.callback.register('void-checkcid:getPlayerCID', function(source, targetId)
    local src = source

    local xPlayer = QBCore.Functions.GetPlayer(src)
    if not xPlayer then
        return { ok = false, error = 'Player not found.' }
    end

    local jobName = xPlayer.PlayerData and xPlayer.PlayerData.job and xPlayer.PlayerData.job.name or nil
    local authorized = false
    if jobName == 'staff' then authorized = true end
    if QBCore.Functions.HasPermission(src, 'admin') or QBCore.Functions.HasPermission(src, 'god') then
        authorized = true
    end
    if not authorized then
        print(('^3[void-checkcid]^7 Denied callback for src %s (job=%s)'):format(src, tostring(jobName)))
        return { ok = false, error = 'You are not authorized to use this command.' }
    end

    local tid = tonumber(targetId)
    if not tid then
        return { ok = false, error = 'Invalid target ID.' }
    end

    local target = QBCore.Functions.GetPlayer(tid)
    if not target then
        return { ok = false, error = 'Target not online.' }
    end

    local cid = target.PlayerData and target.PlayerData.citizenid or nil
    if not cid then
        return { ok = false, error = 'Target CID not found.' }
    end

    local charinfo = target.PlayerData and target.PlayerData.charinfo or {}
    local fullname = nil
    if charinfo and charinfo.firstname and charinfo.lastname then
        fullname = (charinfo.firstname .. ' ' .. charinfo.lastname)
    end

    return { ok = true, cid = cid, name = fullname }
end)

AddEventHandler('onResourceStart', function(res)
    if res ~= GetCurrentResourceName() then return end
    print('^2[void-checkcid]^7 Server started. Callback "void-checkcid:getPlayerCID" registered.')
end)
