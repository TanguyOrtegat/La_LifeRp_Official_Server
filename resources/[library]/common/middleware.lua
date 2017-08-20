
---
-- Add user event handler (automatically assigning user and scoping source)
--
-- @param eventName Name of the event to register and where to add the callback handler
-- @param callback  Callback to call, 2 params will be given, first the source of the user, then the user from essential mode
--
function AddRegisteredUserEventHandler(eventName, callback)
    RegisterServerEvent(eventName)
    AddUnregisteredUserEventHandler(eventName, callback)
end

function AddUnregisteredUserEventHandler(eventName, callback)
    AddEventHandler(eventName, function()
        local scopedSource = source

        -- @TODO Should be a function call in the future, TriggeringEvent is not optimized
        TriggerEvent('es:getPlayerFromId', scopedSource, function(user)
            callback(scopedSource, user)
        end)
    end)
end

local function TableToString(value)
    return json.encode(value)
end

LaLife.Middleware = {}


local EventRegistry = {}
---
-- Handler that automatically register
-- @param eventName
-- @param next
--
function LaLife.Middleware.Register(eventName, next)
    local hasEvent = false

    for _, event in ipairs(EventRegistry) do
        if eventName == event then
            hasEvent = true
        end
    end

    if not hasEvent then
        EventRegistry[#EventRegistry] = eventName
        RegisterServerEvent(eventName)
    end

    return next;
end

function LaLife.Middleware.Logger(eventName, next)
    return function (...)
        if LaLife.Debug then
            print('Begin calling event "' .. eventName .. "' with " .. TableToString({...}))
        end

        next(...)

        if LaLife.Debug then
            print('End calling event "' .. eventName .. '"')
        end
    end
end

function LaLife.Middleware.Sourcer(eventName, next)
    return function (context, ...)
        context.source = source

        next(context, ...)
    end
end

--- Need to have the source as the first argument of the next
function LaLife.Middleware.Identifier(eventName, next)
    return function (context, ...)
        if context.source then
            context.identifier = GetPlayerIdentifiers(context.source)[1]
        end

        next(context, ...)
    end
end

function LaLife.Middleware.User(eventName, next)
    return function (context, ...)
        local args = {...}

        if context.source and context.identifier then
            LaLife.Player.Manager.GetPlayer(context.source, context.identifier, function (user)
                if user == nil then
                    -- @TODO Log ?
                end

                context.user = user

                next(context, args)
            end)

            return
        end

        next(context, args)
    end
end

function LaLife.Middleware.Builder(...)
    local middlewareList = {...}

    return function (eventName, callback)
        local callbackChain = function(...)
            local context = {}

            callback(context, ...)
        end

        for _, middleware in ipairs(middlewareList) do
            callbackChain = middleware(eventName, callbackChain)
        end

        AddEventHandler(eventName, callbackChain)
    end
end
