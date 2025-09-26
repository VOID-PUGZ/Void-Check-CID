fx_version 'cerulean'
game 'gta5'

name 'Void-CheckCID'
author 'Void-Scripts'
description 'Simple /checkcid command using ox_lib notifications to show and copy Citizen ID.'
version '1.0.0'

lua54 'yes'

shared_script '@ox_lib/init.lua'

client_scripts {
    'client/main.lua'
}

dependencies {
    'ox_lib',
    'qb-core'
}
