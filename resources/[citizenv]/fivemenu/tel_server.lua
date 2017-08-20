-- PART OF THE CODE IS IN LOGIN.LUA. BECAUSE TELIST ARRAY IS IN THERE.
-- RegisterServerEvent("tel:sendingMsg")
-- SIMPLIER TO PUT THE CODE THERE.
-- PLEASE DON'T BE MAD ABOUT PROGRAMMING CONCEPT. AT LEAST THERE IS A COMMENT HERE.

RegisterServerEvent("tel:addingTel")
AddEventHandler("tel:addingTel", function(addTel)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
		if (user) then
            local identifier = user.identifier

			MySQL.Async.fetchAll("SELECT * FROM users WHERE telephone = @telnum", {['@telnum'] = addTel}, function(result)
				if(result[1] ~= nil) then
					MySQL.Async.execute("INSERT INTO phonebook (`pidentifier`, `phonenumber`) VALUES (@username, @telnum)", {['@username'] = identifier, ['@telnum'] = addTel})
					TriggerEvent("es:getPhonebook", playerSource)
					TriggerClientEvent("itinerance:notif", playerSource, "~g~Contact ajouté" .. " " .. result[1].prenom .. " " .. result[1].nom)
				else
					TriggerClientEvent("itinerance:notif", playerSource, "~r~Personne ne possède ce numéro !")
				end
			end)
		else
			TriggerEvent("es:desyncMsg", "tel:addingTel")
		end
	end)
end)


-- tel:sendingMsg
-- tel:addingTel
