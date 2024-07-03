pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()
	mode="title"
	-- mode="notes"
	-- mode="debug"

	--physics
	x=56
	y=108
	acc=0
	friction=0.05
	vel=0
	max_vel=5

	--notes
	lvl=14
	notes={
		'pththoink #3',
		'thank you for choosing me\nto be your favorite #3',
		'"you are so full of crap\nyour eyes are brown."',
		'"charles is gone!"',
		'"you are a fun sucker!"',
		'"it\'s time for\nshenanigans baby!"',
		'"yeah, but have you ever\nrolled toilet paper\noff perrine bridge??"',
		'"at least i don\'t have\ndad\'s sense of direction."',
		'"i think i want a new couch."',
		'"do you want to throw some\nfood out of the\nwindow by bella terra?"',
		'you are my snack pack. -j',
		'#1 mother in the world #4',
		'we love you so much.\nthanks for the late night\nshenanigans and\nall the laughs!\n\ncan\'t wait to make\nmore memories!\nlove westicles',
		'i like you! -j',
		'we have built quite a life\ntogether. -j',
		'i love your sense of humor #4',
		'#1 mommy #4',
		'thanks for the\nchick-fil-a runs #4',
		'you\'re the best mom ever!\nlove you! #2',
		'you are a great example of\nchristlike service!\n\nyou always try to be\neverything for everyone. #2',
		'thanks for planning us the\nbest wedding ever and\n\nfor not giving up on us.\ngo wtf! #2',
		'what\'s your favorite\ncolor again? -j',
		'why on earth did\nyou marry me??? -j',
		'"treat yourself!!"',
		'you are the most fun\nperson to be around. #2',
		'dear angel-in-law,\n\nhappy birthday!\n\n#5-in-law',
		'happy birthday #1',
		'how old are you now? #1'
	}
	note=nil

	--entities
	entities={}
end

function _update()
	if (mode=="title" or mode=="notes") then
		if (btnp(❎) and #notes > 0) then
			mode="running"
			lvl+=1
		end
	end

	if (mode=="running") then
		if(btn(⬅️) and x > 0)then
			acc=-1
		end
		if(btn(➡️) and x < 128)then
			acc=1
		end
		
		upd_physics()

		upd_love_shower()

		collision()

		if(lvl%14==0)then
			note=rnd(notes)
			del(notes, note)
			mode="notes"
		end
	end

	if (mode=="debug")then
		if(btnp(❎))then
			lvl+=1
		end
	end
end

function collision()
	for e in all(entities) do 
		ew = 8
		w = 15
		eh = 6
		h = 9

		if e.x < x + w + 1 and e.x + ew > x + 1 and e.y < y + h + 2 and e.y + eh > y + 2 then
			del(entities, e)
			lvl+=1
			if (lvl%14==0) then
				sfx(0)
			else	
				sfx(1)
			end
		end
	end
end

function upd_love_shower()
	if(flr(rnd(15))==0)then
		add(entities,{type=flr(rnd(8))+1, x=rnd(120), y=-8})
	end
	for e in all(entities) do
		e.y += 1
	end
end

function upd_physics()
	--deceleration
	acc=(acc*3)/4
	--bounded velocity
	vel=vel+acc
	vel=min(abs(vel), max_vel)*sgn(vel)
	vel-=friction*sgn(vel)
	--pos
	x+=vel
	x=max(min(112,x),-1)
end

function _draw()
	cls(1)
	if (mode=="title") then
		drw_title()
	end
	if (mode=="running") then
		drw_basket(lvl, x)
		for e in all(entities) do
			spr(e.type, e.x, e.y)
		end
	end

	if (mode=="notes" or mode=="debug") then
		if(#notes > 0) then
			print("press ❎", 48, 108-14, 14)
			print(note,8,20, 7)
		else
			print("thanks for playing!", 24-1, 60-1-14, 8)
			print("thanks for playing!", 24+1, 60+1-14, 8)
			print("thanks for playing!", 24+1, 60-1-14, 8)
			print("thanks for playing!", 24-1, 60+1-14, 8)
			print("thanks for playing!", 24-1, 60-14, 8)
			print("thanks for playing!", 24+1, 60-14, 8)
			print("thanks for playing!", 24, 60-1-14, 8)
			print("thanks for playing!", 24, 60+1-14, 8)
			print("thanks for playing!", 24, 60-14, 7)
		end
		print(#notes.." notes remaining", 28, 115-14, 13)
		drw_basket(13, x)
	end
end

function drw_title()
	nae_x=20
	nae_y=20
	spr(64,nae_x,nae_y,7,4) --notes
	spr(71,nae_x+30,nae_y+30,2,2) --for
	nae_x+=25
	nae_y+=45
	spr(73,nae_x,nae_y,5,4) --nae
	spr(73,nae_x+35,nae_y+1,5,4) --nae

	print("press ❎ to start", 32, 108)
end

function drw_basket(fill, x)
	spr(33 + ((flr(fill/2) % 7) * 2), x, y, 2, 2)
end
__gfx__
0000000008800880077007700cc00cc00aa00aa000aaaa0000008800000990000000a00000000000000000000000000000000000000000000000000000000000
000000008888888878877887ccccccccaaaaaaaa0aa0a0a00008888000099000000aaa0000000000000000000000000000000000000000000000000000000000
007007008888888878888887ccccccccaaaaaaaaaaa0a0aa00088880000990000003aaa000000000000000000000000000000000000000000000000000000000
000770008888888878888887ccccccccaaaaaaaaaaaaaaaa00038800000330000030aa0000000000000000000000000000000000000000000000000000000000
0007700008888880788888870cccccc00aaaaaa0a000000a00030000000030000030000000000000000000000000000000000000000000000000000000000000
00700700008888000788887000cccc0000aaaa00aa0000aa00033000000300000003000000000000000000000000000000000000000000000000000000000000
000000000008800000788700000cc000000aa0000aa00aa000030000000030000003000000000000000000000000000000000000000000000000000000000000
000000000000000000077000000000000000000000aaaa0000300000000030000003000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa000000ccc00000aa000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0080033aaa00088acc80033aaa00000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaa8883388a00088aaa8883388a000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000033300000000000aa33883888800038aa338838888000000000
0000000000000000000000000000000000000000000000000000000000000000000000000099933aa0c0c0000099933aa3cc83300399933aa3cc833000000000
000000000000000000000000000000000000000000000000000000000000080000000990009998aa0accc990009998aa0accc993039998aa0accc99300000000
00000000000000000000000000000000000000000aa30000000000000aa38880008039990aa388aaaa8c39990aa388aaaa8c39990aa388aaaa8c399900000000
0000000000000000000000000003000000000770aaa3330000000770aaa3388008883779aaa3388aa8883779aaa3388aa8883779aaa3388aa888377900000000
00000000000000000000000000883300000078870a88333cc0cc78870a88333cc88378870a88333cc88378870a88333cc88378870a88333cc883788700000000
00000000044d44d444d44d44044d44d444d44d44044d44d444d44d44044d44d444d44d44044d44d444d44d44044d44d444d44d44044d44d444d44d4400000000
000000000eed44d848d44dee0eed44d848d44dee0eed44d848d44dee0eed44d848d44dee0eed44d848d44dee0eed44d848d44dee0eed44d848d44dee00000000
00000000004eeee888eeee40004eeee888eeee40004eeee888eeee40004eeee888eeee40004eeee888eeee40004eeee888eeee40004eeee888eeee4000000000
000000000044d44d8d44d4400044d44d8d44d4400044d44d8d44d4400044d44d8d44d4400044d44d8d44d4400044d44d8d44d4400044d44d8d44d44000000000
0000000000044d4d4d4d440000044d4d4d4d440000044d4d4d4d440000044d4d4d4d440000044d4d4d4d440000044d4d4d4d440000044d4d4d4d440000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000007777700000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000007000000000000000077770000000000000000000000000000000000000000000000000
00000077000000000000000000000000000000000000000000000000007000000000000000078870007777000000000000000000000000000000000000000000
00000077000007700000000000000000000000000000000000000000007000000000000000778877007887000000000000000000000000000000000000000000
00000777700007700000000000000077000000000000000000000000777770000000000000788887077887000000000000000000000000000000000000000000
00000777700077700000000000000077000000000000000000000000007000777700777700788887778887000000000000000000000000000000000000000000
00000777770077700000000000000777000000000000000000000000007000700700700700788888778887000000000000000000000000000000000000000000
00000777770077700000000000000770000000000000000000000000007000700700700000788888778887000000000000000000000000000000000000000000
00000777777077700000000000000770000000000000000000000000007000700700700000788888878887000000000000000000000000000000000000000000
00000777777077700000000000777777777000000000000000000000007000777700700000788888878887000000000000000000000000000000000000000000
00000777777077700000000007777777770000000000000000000000000000000000000000788888878887000000000000000000000000000000000000000000
00000777777777700000000007777777000000000000000000000000000000000000000000788888888887000000000000000000000000000000000000000000
00000777777777700000000000007700000000000000000000000000000000000000000000788888888887000000000000000000000000000000000000000000
00000770777777700000000000007700000000000000000000000000000000000000000000788788888887000000000000000000000000000000000000000000
00000770777777000000000000077000000000000000000000000000000000000000000000788788888877000000000000000000000000000000000000000000
00000770077777000000000000077000000007777000007777000000000000000000000007788778888870000000000000777777000000000000000000000000
00007770077777000007770000077000000077007700077007000000000000000000000007888778888870077777770007788887700000000000000000000000
00007700007777000077777000070000000070000700077000000000000000000000000007887777888870778888877007887788700000000000000000000000
00007700007777000777007700070000700077777700007700000000000000000000000007887007888870788778887007877778700000000000000000000000
00007700007777000770000700077000700070000000000777000000000000000000000077887007888870787777887007888888700000000000000000000000
00077700000770000770000700077007700070000700000007700000000000000000000078887007788770787777887707877777700000000000000000000000
00077700000770000777007700077777000077007700077007700000000000000000000078887000788700788778888707877778700000000000000000000000
00077000000770000077777000007777000007777000007777000000000000000000000078877000788700778888788707887788700000000000000000000000
00000000000000000000000000000770000000000000000000000000000000000000000077770000777700077777777707788887700000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000777777000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000770000077000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007777000077000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007777000777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007777700777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007777700777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007777770777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007777770777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007777770777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007777777777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007777777777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007707777777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007707777770000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007700777770000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000077700777770000000000000077770000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000077000077770000777770000770077000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000077000077770007700777000700007000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000077000077770007000077000777777000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000777000007700007000077000700000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000777000007700007700777700700007000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000770000007700000777707700770077000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000077770000000000000000000000000000000000000000000000000000000000000000
__label__
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111771111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111771111177111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117777111177111111111111111771111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117777111777111111111111111771111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117777711777111111111111117771111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117777711777111111111111117711111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117777771777111111111111117711111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117777771777111111111117777777771111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117777771777111111111177777777711111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117777777777111111111177777771111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117777777777111111111111177111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117717777777111111111111177111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117717777771111111111111771111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111117711777771111111111111771111111177771111177771111111111111111111111111111111111111111111111111111111111
11111111111111111111111177711777771111177711111771111111771177111771171111111111111111111111111111111111111111111111111111111111
11111111111111111111111177111177771111777771111711111111711117111771111111111111111111111111111111111111111111111111111111111111
11111111111111111111111177111177771117771177111711117111777777111177111111111111111111111111111111111111111111111111111111111111
11111111111111111111111177111177771117711117111771117111711111111117771111111111111111111111111111111111111111111111111111111111
11111111111111111111111777111117711117711117111771177111711117111111177111111111111111111111111111111111111111111111111111111111
11111111111111111111111777111117711117771177111777771111771177111771177111111111111111111111111111111111111111111111111111111111
11111111111111111111111771111117711111777771111177771111177771111177771111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111117711111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111117777711111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111117111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111117111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111117111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111117111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111777771111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111117111777711777711111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111117111711711711711111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111117111711711711111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111117111711711711111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111117111777711711111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111177771111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111178871117777111111111111111111111111777711111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111778877117887111111111111111111111111788711177771111111111111111111111111111111111
11111111111111111111111111111111111111111111111788887177887111111111111111111111117788771178871111111111111111111111111111111111
11111111111111111111111111111111111111111111111788887778887111111111111111111111117888871778871111111111111111111111111111111111
11111111111111111111111111111111111111111111111788888778887111111111111111111111117888877788871111111111111111111111111111111111
11111111111111111111111111111111111111111111111788888778887111111111111111111111117888887788871111111111111111111111111111111111
11111111111111111111111111111111111111111111111788888878887111111111111111111111117888887788871111111111111111111111111111111111
11111111111111111111111111111111111111111111111788888878887111111111111111111111117888888788871111111111111111111111111111111111
11111111111111111111111111111111111111111111111788888878887111111111111111111111117888888788871111111111111111111111111111111111
11111111111111111111111111111111111111111111111788888888887111111111111111111111117888888788871111111111111111111111111111111111
11111111111111111111111111111111111111111111111788888888887111111111111111111111117888888888871111111111111111111111111111111111
11111111111111111111111111111111111111111111111788788888887111111111111111111111117888888888871111111111111111111111111111111111
11111111111111111111111111111111111111111111111788788888877111111111111111111111117887888888871111111111111111111111111111111111
11111111111111111111111111111111111111111111117788778888871111111111111777777111117887888888771111111111111111111111111111111111
11111111111111111111111111111111111111111111117888778888871177777771117788887711177887788888711111111111117777771111111111111111
11111111111111111111111111111111111111111111117887777888871778888877117887788711178887788888711777777711177888877111111111111111
11111111111111111111111111111111111111111111117887117888871788778887117877778711178877778888717788888771178877887111111111111111
11111111111111111111111111111111111111111111177887117888871787777887117888888711178871178888717887788871178777787111111111111111
11111111111111111111111111111111111111111111178887117788771787777887717877777711778871178888717877778871178888887111111111111111
11111111111111111111111111111111111111111111178887111788711788778888717877778711788871177887717877778877178777777111111111111111
11111111111111111111111111111111111111111111178877111788711778888788717887788711788871117887117887788887178777787111111111111111
11111111111111111111111111111111111111111111177771111777711177777777717788887711788771117887117788887887178877887111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111777777111777711117777111777777777177888877111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111117777771111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111666166616661166116611111166666111111666116611111166166616661666166611111111111111111111111111111
11111111111111111111111111111111616161616111611161111111661616611111161161611111611116116161616116111111111111111111111111111111
11111111111111111111111111111111666166116611666166611111666166611111161161611111666116116661661116111111111111111111111111111111
11111111111111111111111111111111611161616111116111611111661616611111161161611111116116116161616116111111111111111111111111111111
11111111111111111111111111111111611161616661661166111111166666111111161166111111661116116161616116111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

__sfx__
0003000000500007500c75024750387502575011750017502870028700247002d7502d7502d7002d7002d7502d7502d7502d7502d7502d7502d7502d7502d7502d7502d7502d7502d75030700000000000000000
00020000000000000000000067500c750137501c750247502c750357503a7503f7503f75000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 00424344
