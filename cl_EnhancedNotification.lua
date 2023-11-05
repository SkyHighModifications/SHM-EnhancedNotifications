local DefaultValues = {
    player = PlayerPedId()
    message = "01010011 01101011 01111001 01001000 01101001 01100111 01101000 00100000 01001101 01101100 01100111 Enhanced Notifications",
    duration = 5000, -- 5 seconds
    type = "success",
}

local Types = {
    ["success"] = { icon = "fas fa-check", color = "#4CAF50" },
    ["info"] = { icon = "fas fa-info-circle", color = "#2196F3" },
    ["warning"] = { icon = "fas fa-exclamation-triangle", color = "#FFC107" },
    ["error"] = { icon = "fas fa-times", color = "#F44336" },
}

function GetNotificationSettings(params)
    local player = PlayerPedId()
    local message = params.message or DefaultValues.message
    local duration = params.duration or DefaultValues.duration
    local type = params.type or DefaultValues.type

    -- Ensure the type is valid; otherwise, default to "success"
    type = Types[type] and type or DefaultValues.type

    return player, message, duration, type
end

function EnhancedNotifications(params)
    local player, message, duration, type = GetNotificationSettings(params)

    SendNUIMessage({
        type = "notification",
        message = message,
        duration = duration,
        icon = Types[type].icon,
        color = Types[type].color,
    })
end

exports('EnhancedNotifications', EnhancedNotifications)

