RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
    local playerSource = source
    local salary = math.random(25, 80) --Aide de l'État random (ici entre 100 et 250) RP: A changer au bon vouloir du président

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            -- Ajout de l'argent à l'utilisateur
            local user_id = user.identifier
            -- Requête qui permet de verifier le métier de l'utilisateur
            MySQL.Async.fetchScalar("SELECT users.job FROM users WHERE identifier = @username", { ['@username'] = user_id }, function(isPoliceMan)
                if user.enService == 1 then
                    -- Requête qui permet de récuperer le salaire de l'utilisateur
                    MySQL.Async.fetchScalar("SELECT salary FROM users INNER JOIN police ON users.police = police.police_id WHERE identifier = @username", { ['@username'] = user_id }, function(salary_job)
                        if salary_job > 0 then
                            LaLife.Player.Manager.AddPlayerMoney(user, salary + salary_job)
                            TriggerClientEvent("citizenv:notify", playerSource, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Aide de L'État :  + " .. salary .. "~g~$~s~~n~Salaire reçu : + " .. salary_job .. " ~g~$")
                        end
                    end)
                else
                    MySQL.Async.fetchScalar("SELECT salary FROM users INNER JOIN jobs ON users.job = jobs.job_id WHERE identifier = @username", { ['@username'] = user_id }, function(salary_job)
                        if salary_job > 0 then
                            LaLife.Player.Manager.AddPlayerMoney(user, salary + salary_job)
                            TriggerClientEvent("citizenv:notify", playerSource, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Aide de L'État :  + " .. salary .. "~g~$~s~~n~Salaire reçu : + " .. salary_job .. " ~g~$")
                        end
                    end)
                end
            end)
        else
            TriggerEvent("es:desyncMsg", 'paycheck:salary')
        end
    end)
end)
