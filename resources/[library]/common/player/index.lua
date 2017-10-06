LaLife.Player = {}

LaLife.Player.New = function(source, permission_level, money, identifier, group, dirtymoney, job, police, nom, prenom, telephone, pos, gender,subjob)
    return {
        source = source,
        permission_level = permission_level,
        money = money,
        dirtymoney = dirtymoney,
        identifier = identifier,
        group = group,
        coords = {x = pos.x, y = pos.y, z = pos.z},
        session = {},
        job = job,
        police = police,
        enService = 0,
        nom = nom,
        prenom = prenom,
        telephone = telephone,
        vehicle = 0,
        jobVehicle = 0,
        status = "alive",
        gender = gender,
        subjob = subjob,
    }
end
