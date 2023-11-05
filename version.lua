    -- Function to log update status
    local function LogUpdateStatus(_type, message)
        -- Define color codes for success and error messages
        local color = _type == 'success' and '^2' or '^1'
        local resourceName = GetCurrentResourceName()
        local formattedMessage = string.format("[%sUPDATE^7] ^3%s^7: %s%s^7", color, resourceName, color, message)
        print(formattedMessage)
    end

    -- Trigger update check on resource start
    AddEventHandler('onResourceStart', function(resource)
        -- Check if the current resource is the one being started
        if GetCurrentResourceName() == resource then
            -- Make an HTTP request to check for updates
            PerformHttpRequest('https://raw.githubusercontent.com/SkyHighModifications/SHM-EnhancedNotifications/master/version.txt', function(err, text, headers)
                local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
                if not text then
                    LogUpdateStatus('error', 'Failed to check for updates.')
                    return
                end
                LogUpdateStatus('success', string.format('Your Version: %s', currentVersion))
                LogUpdateStatus('success', string.format('Latest Version: %s', text))

                -- Compare versions and notify the user
                if text:gsub("%s+", "") == currentVersion:gsub("%s+", "") then
                    LogUpdateStatus('success', 'You are running the latest version.')
                else
                    LogUpdateStatus('error', string.format('You are currently running an outdated version. Please update to version %s.', text))
                end
            end)
        end
    end)