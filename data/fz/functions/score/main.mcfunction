#假人模块#
execute as @a[tag=carpetBot,team=!fakePlayer] run function fz:score/runaddprefix
execute as @a[team=fakePlayer,tag=!carpetBot] run function fz:score/runbotdead
####
#活跃度模块#
execute as @a[tag=!carpetBot] if score @s actCounter matches 72000.. run function fz:score/activationcarry
####
#记分板循环#
scoreboard players add scoreboard timeCounter 1
execute if score scoreboard timeCounter matches 600 run scoreboard objectives setdisplay sidebar.team.gold killCounter
execute if score scoreboard timeCounter matches 1200 run scoreboard objectives setdisplay sidebar.team.gold digCounter
execute if score scoreboard timeCounter matches 1800 run scoreboard objectives setdisplay sidebar.team.gold deathCounter
execute if score scoreboard timeCounter matches 2400 run scoreboard objectives setdisplay sidebar.team.gold tradingCounter
execute if score scoreboard timeCounter matches 3000 run scoreboard objectives setdisplay sidebar.team.gold fishingCounter
execute if score scoreboard timeCounter matches 3600 run scoreboard objectives setdisplay sidebar.team.gold damageTaken
execute if score scoreboard timeCounter matches 4200 run scoreboard objectives setdisplay sidebar.team.gold activation
execute if score scoreboard timeCounter matches 4800 run scoreboard objectives setdisplay sidebar.team.gold totalList
execute if score scoreboard timeCounter matches 4800.. run scoreboard players set scoreboard timeCounter 0
####
#记分板开关#
scoreboard players enable @a scoreSwitch
execute as @a[scores={scoreSwitch=..-1},team=!displayScoresOff] run function fz:score/teams/displayscoresoff
execute as @a[scores={scoreSwitch=1},team=!displayScoresOn] run function fz:score/teams/displayscoreson
execute as @a[scores={scoreSwitch=2},team=!killCounter] run function fz:score/teams/killcounter
execute as @a[scores={scoreSwitch=3},team=!digCounter] run function fz:score/teams/digcounter
execute as @a[scores={scoreSwitch=4},team=!deathCounter] run function fz:score/teams/deathcounter
execute as @a[scores={scoreSwitch=5},team=!tradingCounter] run function fz:score/teams/tradingcounter
execute as @a[scores={scoreSwitch=6},team=!fishingCounter] run function fz:score/teams/fishingcounter
execute as @a[scores={scoreSwitch=7},team=!damageTaken] run function fz:score/teams/damagetaken
execute as @a[scores={scoreSwitch=8},team=!activation] run function fz:score/teams/activation
execute as @a[scores={scoreSwitch=9},team=!totalList] run function fz:score/teams/totallist
execute as @a[scores={scoreSwitch=10..}] run tellraw @a[scores={scoreSwitch=10..}] [{"text":"不存在编号为10及以上的记分板","color":"dark_red"}]
scoreboard players set @a[scores={scoreSwitch=..-1}] scoreSwitch 0
scoreboard players set @a[scores={scoreSwitch=1..}] scoreSwitch 0
team join displayScoresOff @a[team=]
####
#添加工具计入挖掘量#
execute as @a[scores={diamond_axe=1..}] run function fz:score/tools/diamond_axe
execute as @a[scores={diamond_pickaxe=1..}] run function fz:score/tools/diamond_pickaxe
execute as @a[scores={diamond_shovel=1..}] run function fz:score/tools/diamond_shovel
execute as @a[scores={iron_axe=1..}] run function fz:score/tools/iron_axe
execute as @a[scores={iron_pickaxe=1..}] run function fz:score/tools/iron_pickaxe
execute as @a[scores={iron_shovel=1..}] run function fz:score/tools/iron_shovel
execute as @a[scores={stone_axe=1..}] run function fz:score/tools/stone_axe
execute as @a[scores={stone_pickaxe=1..}] run function fz:score/tools/stone_pickaxe
execute as @a[scores={stone_shovel=1..}] run function fz:score/tools/stone_shovel
####
#计算总量#
#两板分数不等时运行计算函数
execute as @a unless score @s tDigC = @s digCounter run function fz:score/totalcalculator/tdigc
execute as @a unless score @s tKillC = @s killCounter run function fz:score/totalcalculator/tkillc
execute as @a unless score @s tDeathC = @s deathCounter run function fz:score/totalcalculator/tdeathc
execute as @a unless score @s tTradeC = @s tradingCounter run function fz:score/totalcalculator/ttradec
execute as @a unless score @s tFishC = @s fishingCounter run function fz:score/totalcalculator/tfishc
execute as @a unless score @s tHurtC = @s damageTaken run function fz:score/totalcalculator/thurtc
execute as @a unless score @s tActC = @s activation run function fz:score/totalcalculator/tactc
#总榜在分榜中显示
scoreboard players operation 总挖掘数 digCounter = 总挖掘数 totalList
scoreboard players operation 总击杀数 killCounter = 总击杀数 totalList
scoreboard players operation 总死亡数 deathCounter = 总死亡数 totalList
scoreboard players operation 总交易数 tradingCounter = 总交易数 totalList
scoreboard players operation 总钓鱼数 fishingCounter = 总钓鱼数 totalList
scoreboard players operation 总受伤害量 damageTaken = 总受伤害量 totalList
scoreboard players operation 总活跃时间 activation = 总活跃时间 totalList
####
#1.16#
function fz:score/1.16/main
####