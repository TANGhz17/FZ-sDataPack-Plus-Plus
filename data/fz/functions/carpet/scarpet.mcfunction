#带标签的假玩家#
script run __command() -> ( help() ); help() ->( print('使用帮助：'); print('/script invoke summon xxx生成玩家'); print('/script invoke kill xxx删除玩家'); print('/script invoke tp xxx x y z，传送假玩家，xyz可替换为\"s\"来代表你的位置'); print('/script invoke killall删除全部玩家'); print('tagplayer Version: 0.0.0-SNAPSHOT-20200106.2207'); '' ); __config() -> m( l('stay_loaded', true)); global_tag = 'carpetBot'; global_tag_no_bot = 'noCarpetBot'; __check_offline(player_name) ->( if (!(player (player_name)), exit('§4假人'+player_name+'未在线'); '' ); if (!query(player(player_name),'has_tag',global_tag), exit('§4'+player_name+'不是假人'); '' ); ); __check_online(player_name) ->( if (player(player_name), if (query(player(player_name),'has_tag',global_tag), exit('§4假人'+player_name+'已经在线了'); '' ); exit('§4玩家'+player_name+'已经在线了'); '' ); ); __check_pos(x) ->( x = number(x); if(x == null, exit('§4请输入正确的坐标'); '' ); return(x) ); __check_tick(tick) ->( tick = str('%d',number(tick+0.5)); if(tick == null, exit('§4请输入正确的游戏刻间隔'); '' ); if(tick < 2, exit(str('§4整数不能小于2，却发现了%d',tick)); '' ); return(tick) ); summon(player_name) ->( s_player = player(); player_name = replace(player_name, '\\s',''); __check_online(player_name); run(str('player %s spawn at %f %f %f', player_name, s_player~'x', s_player~'y', s_player~'z')); if (!(player(player_name)), exit('§4生成失败') ); if(query(player(player_name),'has_tag',global_tag_no_bot), modify(player(player_name),'clear_tag',global_tag_no_bot) ); modify(player(player_name), 'tag', global_tag); print('已为'+player_name+'添加标签 '); '' ); kill(player_name) ->( player_name = replace(player_name, '\\s',''); __check_offline(player_name); modify(player(player_name), 'tag', global_tag_no_bot); print('已将'+player(player_name)+'移交§6FZ\'sDataPack§f清除标签'); run(str('player %s kill', player_name)); game_tick(50); if(player(player_name), exit( modify(player(player_name), 'tag', global_tag); print('§4清除失败'); print('已重新添加'+player_name+'的标签'); '' ); ); print('已清除'+player_name); '' ); killall() ->( i = 0; player_list = player('all'); loop(2147483647,,, one_player = slice(player_list,i,i+1); one_player_str = join('',one_player); if(one_player_str=='', break() ); if(query(player(one_player_str),'has_tag',global_tag), do_fake_player = 1; modify(player(one_player_str), 'tag', global_tag_no_bot) );run(str('player %s kill', one_player_str)); i = i+1; ); if(do_fake_player != 1, exit('§4不存在假人'); '' ); print('已将全部假人移交§6FZ\'sDataPack§f清除标签'); game_tick(50); print('已清除全部假人'); '' ); tp(player_name,x,y,z) ->( __check_offline(player_name); s_player = player(); if(x == 's', x = s_player~'x' ); if(y == 's', y = s_player~'y' ); if(z == 's', z = s_player~'z' ); x = __check_pos(x); y = __check_pos(y); z = __check_pos(z); run(str('tp %s %f %f %f', player_name, x, y, z)); '' );