scoreboard objectives remove timeCounter
scoreboard objectives remove 20
scoreboard objectives remove 1
scoreboard objectives remove fzversion
scoreboard objectives remove leaveGame
function fz:carpet/uninstall
function fz:health/uninstall
function fz:sleep/uninstall
function fz:cleaner/uninstall
function fz:logintips/uninstall
function fz:score/uninstall
function fz:logintips/uninstall
function fz:config/uninstall
scoreboard objectives remove installed
tellraw @a {"text":"FZ'sDataPack卸载成功！","color":"dark_green"}