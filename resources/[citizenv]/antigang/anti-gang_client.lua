local relationshipTypes = {
"PLAYER",
--"CIVMALE",
--"CIVFEMALE",
"COP",
"SECURITY_GUARD",
"PRIVATE_SECURITY",
"FIREMAN",
"GANG_1",
"GANG_2",
"GANG_9",
"GANG_10",
"AMBIENT_GANG_LOST",
"AMBIENT_GANG_MEXICAN",
"AMBIENT_GANG_FAMILY",
"AMBIENT_GANG_BALLAS",
"AMBIENT_GANG_MARABUNTE",
"AMBIENT_GANG_CULT",
"AMBIENT_GANG_SALVA",
"AMBIENT_GANG_WEICHENG",
"AMBIENT_GANG_HILLBILLY",
"DEALER",
"HATES_PLAYER",
"HEN",
--"WILD_ANIMAL",
--"SHARK",
--"COUGAR",
"NO_RELATIONSHIP",
"SPECIAL",
"MISSION2",
"MISSION3",
"MISSION4",
"MISSION5",
"MISSION6",
"MISSION7",
"MISSION8",
"ARMY",
"GUARD_DOG",
"AGGRESSIVE_INVESTIGATE",
"MEDIC",
"CAT",
}

local RELATIONSHIP_HATE = 1

Citizen.CreateThread(function()
    while true do
        Wait(50)

        for _, group in ipairs(relationshipTypes) do
            -- not sure about argument order, players don't have AI so only one of these should be needed
            SetRelationshipBetweenGroups(RELATIONSHIP_HATE, GetHashKey('PLAYER'), GetHashKey(group))
            SetRelationshipBetweenGroups(RELATIONSHIP_HATE, GetHashKey(group), GetHashKey('PLAYER'))
        end
    end
end)