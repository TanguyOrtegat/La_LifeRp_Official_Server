function nameJob(id)
    return MySQL.Sync.fetchScalar("SELECT job_name FROM jobs WHERE job_id = @namejob", {['@namejob'] = id})
end

function updatejob(player, id)
    local job = id
    MySQL.Async.execute("UPDATE users SET `job`=@value WHERE identifier = @identifier", {['@value'] = job, ['@identifier'] = player})
end

function quitLastJob(source, job)
    if job == 1 then

    elseif job == 2 then
        TriggerClientEvent("jobslegal:poolEnding", source)
    elseif job == 3 then
        TriggerClientEvent("jobslegal:binEnding", source)
    elseif job == 4 then
        TriggerClientEvent("jobslegal:mineEnding", source)
    elseif job == 5 then

    elseif job == 6 then
        TriggerClientEvent("transporter:endingDay", source)
    elseif job == 7 then
        TriggerClientEvent("transporter:endingDay", source)
    elseif job == 8 then
        TriggerClientEvent("transporter:endingDay", source)
    elseif job == 9 then
        TriggerClientEvent("transporter:endingDay", source)
    elseif job == 10 then

    elseif job == 11 then
        TriggerClientEvent("jobslegal:orgEnding", source)
    elseif job == 12 then
        TriggerClientEvent("jobslegal:morgEnding", source)
    elseif job == 13 then
        TriggerEvent('es_em:endingService', source, 0)
    end
end

RegisterServerEvent('poleemploi:jobs')
AddEventHandler('poleemploi:jobs', function(id)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier

            ------ Quit Last job
            local job = user.job
            quitLastJob(playerSource, job)
            ------ Get New Job
            local nameJob = nameJob(id)
            updatejob(player, id)

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                job = id,
            }, function ()
                TriggerEvent('poleemploi:getjobss', playerSource)
                TriggerClientEvent("citizenv:notify", playerSource, "CHAR_AMANDA", 1, "Mairie", false, "Votre métier est maintenant : ".. nameJob)
            end)
        else
            TriggerEvent("es:desyncMsg", 'poleemploi:jobs')
        end
    end)
end)

RegisterServerEvent('poleemploi:getjobs')
AddEventHandler('poleemploi:getjobs', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            TriggerClientEvent("jobslegal:getJobs", playerSource, user.job)
        else
            TriggerEvent("es:desyncMsg", 'poleemploi:getjobs')
        end
    end)
end)

RegisterServerEvent('poleemploi:getjobss')
AddEventHandler('poleemploi:getjobss', function(playerSource)
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            TriggerClientEvent("jobslegal:getJobs", playerSource, user.job)
        else
            TriggerEvent("es:desyncMsg", 'poleemploi:getjobss')
        end
    end)
end)
