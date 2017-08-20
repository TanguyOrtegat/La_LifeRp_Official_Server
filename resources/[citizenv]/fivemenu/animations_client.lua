AddEventHandler("menuanim:AnimOG", function(target)
    VMenu.animations = true
    VMenu.ResetMenu(98, "", "default")
    Wait(100)
    VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "~r~Retour")
    VMenu.AddFunc(98, "Général", "anim:global", {}, "Valider")
    VMenu.AddFunc(98, "Humeur", "anim:humeur", {}, "Valider")
    VMenu.AddFunc(98, "Salutations", "anim:salutations", {}, "Valider")
    VMenu.AddFunc(98, "Social", "anim:social", {}, "Valider")
    VMenu.AddFunc(98, "Sport", "anim:sport", {}, "Valider")
end)

AddEventHandler("anim:global", function(target)
    VMenu.ResetMenu(98, "", "default")
    Wait(100)
    VMenu.AddFunc(98, "~r~Retour", "menuanim:AnimOG", {}, "~r~Retour")
    VMenu.AddFunc(98, "Attendre", "anim:play", {1}, "Valider")
    VMenu.AddFunc(98, "Chilling", "anim:play", {4}, "Valider")
    VMenu.AddFunc(98, "Statue", "anim:play", {5}, "Valider")
    VMenu.AddFunc(98, "S'asseoir (par terre)", "anim:play", {14}, "Valider")
    VMenu.AddFunc(98, "S'asseoir (sur un banc/chaise)", "anim:play", {15}, "Valider")
    VMenu.AddFunc(98, "Se gratter les parties", "anim:play", {16}, "Valider")
    VMenu.AddFunc(98, "Position de fouille", "anim:play", {17}, "Valider")
end)

AddEventHandler("anim:salutations", function(target)
    VMenu.ResetMenu(98, "", "default")
    Wait(100)
    VMenu.AddFunc(98, "~r~Retour", "menuanim:AnimOG", {}, "~r~Retour")
    VMenu.AddFunc(98, "Saluer", "anim:play", {18}, "Valider")
    VMenu.AddFunc(98, "Salut militaire", "anim:play", {19}, "Valider")
    VMenu.AddFunc(98, "Serrer la main", "anim:play", {20}, "Valider")
    VMenu.AddFunc(98, "High five", "anim:play", {21}, "Valider")
end)

AddEventHandler("anim:humeur", function(target)
    VMenu.ResetMenu(98, "", "default")
    Wait(100)
    VMenu.AddFunc(98, "~r~Retour", "menuanim:AnimOG", {}, "~r~Retour")
    VMenu.AddFunc(98, "Applaudir", "anim:play", {2}, "Valider")
    VMenu.AddFunc(98, "Avoir peur", "anim:play", {34}, "Valider")
    VMenu.AddFunc(98, "Balle dans la tete", "anim:play", {32}, "Valider")
    VMenu.AddFunc(98, "Branlette", "anim:play", {30}, "Valider")
    VMenu.AddFunc(98, "Calme toi", "anim:play", {27}, "Valider")
    VMenu.AddFunc(98, "C'est pas possible", "anim:play", {31}, "Valider")
    VMenu.AddFunc(98, "Doigts d'honneur", "anim:play", {33}, "Valider")
    VMenu.AddFunc(98, "Enlacer", "anim:play", {35}, "Valider")
    VMenu.AddFunc(98, "Super", "anim:play", {26}, "Valider")
end)


AddEventHandler("anim:social", function(target)
    VMenu.ResetMenu(98, "", "default")
    Wait(100)
    VMenu.AddFunc(98, "~r~Retour", "menuanim:AnimOG", {}, "~r~Retour")
    VMenu.AddFunc(98, "Air Guitar", "anim:play", {29}, "Valider")
    VMenu.AddFunc(98, "Danser", "anim:play", {28}, "Valider")
    VMenu.AddFunc(98, "Filmer", "anim:play", {3}, "Valider")
    VMenu.AddFunc(98, "Jouer de la musique", "anim:play", {8}, "Valider")
    VMenu.AddFunc(98, "Paparazzi", "anim:play", {9}, "Valider")
    VMenu.AddFunc(98, "Regarder sa carte", "anim:play", {12}, "Valider")
end)

AddEventHandler("anim:sport", function(target)
    VMenu.ResetMenu(98, "", "default")
    Wait(100)
    VMenu.AddFunc(98, "~r~Retour", "menuanim:AnimOG", {}, "~r~Retour")
    VMenu.AddFunc(98, "Courrir sur place", "anim:play", {6}, "Valider")
    VMenu.AddFunc(98, "Faire des abdos", "anim:play", {11}, "Valider")
    VMenu.AddFunc(98, "Faire des pompes", "anim:play", {10}, "Valider")
    VMenu.AddFunc(98, "Faire du yoga", "anim:play", {13}, "Valider")
    VMenu.AddFunc(98, "Montrer les muscles", "anim:play", {7}, "Valider")

end)


-- ///////////////////////////////////////////////// ANIMATIONS POUR LES METIERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- Machine à café : WORLD_HUMAN_AA_COFFEE
-- Cigarette : WORLD_HUMAN_SMOKING
-- Verifier papier véhicule : WORLD_HUMAN_CLIPBOARD
-- Consommer la weed : WORLD_HUMAN_DRUG_DEALER
-- Coup de marteau : WORLD_HUMAN_HAMMERING
-- Souffler l'herbe, jardinage : WORLD_HUMAN_GARDENER_LEAF_BLOWER
-- Déterer les fleurs, jardinage : WORLD_HUMAN_GARDENER_PLANT
-- Attendre avec un balais : WORLD_HUMAN_JANITOR
-- Nettoyer avec un chiffon : WORLD_HUMAN_MAID_CLEAN
-- Pêcher : WORLD_HUMAN_STAND_FISHING
-- Crocheter un véhicule : WORLD_HUMAN_WELDING
-- ///////////////////////////////////////////////// ANIMATIONS POUR LES METIERS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

AddEventHandler("anim:play", function(target, anim)
    if anim == 1 then
        PlayScenario("WORLD_HUMAN_GUARD_STAND","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Attendre
    elseif anim == 2 then
        PlayScenario("WORLD_HUMAN_CHEERING","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Applaudir
    elseif anim == 3 then
        PlayScenario("WORLD_HUMAN_MOBILE_FILM_SHOCKING","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Filmer
    elseif anim == 4 then
        PlayScenario("WORLD_HUMAN_HANG_OUT_STREET","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Chilling
    elseif anim == 5 then
        PlayScenario("WORLD_HUMAN_HUMAN_STATUE","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Statue
    elseif anim == 6 then
        PlayScenario("WORLD_HUMAN_JOG_STANDING","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Courrir sur place
    elseif anim == 7 then
        PlayScenario("WORLD_HUMAN_MUSCLE_FLEX","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Montrer les muscles
    elseif anim == 8 then
        PlayScenario("WORLD_HUMAN_MUSICIAN","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Faire de la musique
    elseif anim == 9 then
        PlayScenario("WORLD_HUMAN_PAPARAZZI","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Paparazzi
    elseif anim == 10 then
        PlayScenario("WORLD_HUMAN_PUSH_UPS","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Pompes
    elseif anim == 11 then
        PlayScenario("WORLD_HUMAN_SIT_UPS","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Faire des abdos
    elseif anim == 12 then
        PlayScenario("WORLD_HUMAN_TOURIST_MAP","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Regarder la map
    elseif anim == 13 then
        PlayScenario("WORLD_HUMAN_YOGA","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- Yoga
    elseif anim == 14 then
        PlayScenario("WORLD_HUMAN_PICNIC","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE") -- S'asseoir (par terre)
    elseif anim == 15 then
        animsAction({ lib = "anim@heists@prison_heistunfinished_biztarget_idle", anim = "target_idle" }) -- S'asseoir (sur un banc/chaise)
    elseif anim == 16 then
        animsAction({ lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch" }) -- Se gratter les parties
    elseif anim == 17 then
        animsAction({ lib = "mini@prostitutes@sexlow_veh", anim = "low_car_bj_to_prop_female" }) -- Position de fouille
    elseif anim == 18 then
        animsAction({ lib = "gestures@m@standing@casual", anim = "gesture_hello" }) -- Saluer
    elseif anim == 19 then
        animsAction({ lib = "mp_player_int_uppersalute", anim = "mp_player_int_salute" }) -- Salut militaire
    elseif anim == 20 then
        animsAction({ lib = "mp_common", anim = "givetake1_a" })  -- Serrer la main
    elseif anim == 21 then
        animsAction({ lib = "mp_ped_interaction", anim = "highfive_guy_a" }) -- High five
    elseif anim == 26 then
        animsAction({ lib = "anim@mp_player_intcelebrationmale@thumbs_up", anim = "thumbs_up" }) -- Super
    elseif anim == 27 then
        animsAction({ lib = "gestures@m@standing@casual", anim = "gesture_easy_now" }) --  Calme toi
    elseif anim == 28 then
        animsAction({ lib = "amb@world_human_partying@female@partying_beer@base", anim = "base" }) -- Danser
    elseif anim == 29 then
        animsAction({ lib = "anim@mp_player_intcelebrationfemale@air_guitar", anim = "air_guitar" }) -- Air Guitar
    elseif anim == 30 then
        animsAction({ lib = "mp_player_int_upperwank", anim = "mp_player_int_wank_01" }) -- Branlette
    elseif anim == 31 then
        animsAction({ lib = "gestures@m@standing@casual", anim = "gesture_damn" }) -- C'est pas possible
    elseif anim == 32 then
        animsAction({ lib = "mp_suicide", anim = "pistol" }) -- Balle dans la tête
    elseif anim == 33 then
        animsAction({ lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter" }) -- Doigts d'honneur
    elseif anim == 34 then
        animsAction({ lib = "amb@code_human_cower_stand@female@idle_a", anim = "idle_c" }) -- Avoir peur
    elseif anim == 35 then
        animsAction({ lib = "mp_ped_interaction", anim = "kisses_guy_a" }) -- Enlacer
    end
end)

function PlayScenario(param1, param2, param3)
    Citizen.CreateThread(function()
        TaskStartScenarioInPlace(GetPlayerPed(-1), param1, 0, 1)
        PlayAmbientSpeech1(GetPlayerPed(-1), param2, param3)
        Citizen.Wait(20000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end)
end

function animsAction(animObj)
    RequestAnimDict( animObj.lib )
    while not HasAnimDictLoaded( animObj.lib ) do
        Citizen.Wait(0)
    end
    if HasAnimDictLoaded( animObj.lib ) then
        TaskPlayAnim( GetPlayerPed(-1), animObj.lib , animObj.anim ,8.0, -8.0, -1, 0, 0, false, false, false )
    end
end
