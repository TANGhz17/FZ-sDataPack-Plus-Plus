tellraw @s {"text":"记分板：","color":"dark_green","bold":true}
tellraw @s [{"text":"- 指令："},{"text":"/trigger scoreSwitch set -1为关/1-9为开","color":"green","clickEvent":{"action":"suggest_command","value":"/trigger scoreSwitch set "},"hoverEvent":{"action":"show_text","value":"点击以写入聊天栏"}}]
tellraw @s [{"text":"[✘]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set -1"}},{"text":"[轮播]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 1"}},{"text":"[击杀榜]","color":"red","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 2"}},{"text":"[挖掘榜]","color":"gray","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 3"}},{"text":"[死亡榜]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 4"}},{"text":"[交易榜]","color":"green","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 5"}},{"text":"[钓鱼榜]","color":"blue","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 6"}},{"text":"[奥里给！]","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 7"}},{"text":"[活跃度]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 8"}},{"text":"[统计总量]","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 9"}}]