fx_version 'bodacious'
game 'gta5'
author 'SkyHigh Modifications'
description 'SHM Enhanced Notifications'
version '1.0.0'

ui_page "html/index.html"

client_script 'cl_EnhancedNotification.lua'  -- Change 'client.lua' to the actual name of your client-side script
server_script 'version.lua'

files {
    'html/**.**'
}

export 'EnhancedNotifications'

