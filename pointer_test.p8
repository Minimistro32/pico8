pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- INIT
function _init()
	point_x = 64
	point_y = 64
end

-->8
--UPDATE
function _update()
	if (btn(0)) then
		point_x-=1
	end
	if (btn(1)) then
		point_x+=1
	end
	if (btn(2)) then
		point_y-=1
	end
	if (btn(3)) then
		point_y+=1
	end
end

-->8
--DRAW

function _draw()
	cls(7)

	line(point_x-2,point_y,point_x+2,point_y,0)
	line(point_x,point_y+2,point_x,point_y-2,0)
	print(point_x, 1, 1)
	print(point_y, 1, 7)
	pset(point_x, point_y,12)
	
end


-->8
--HELPERS


-->8
--JUNK

__gfx__
eecccceeeecccceeeecccceeeecccceeeecceeeeeecccceeeecccceeeecccceeeecccceeeecccceeeecccceeeecccceeeecccceeeecccceeeeccccee00000000
eefccceeeefccceeeefccceeeefccceeecccceeeeefccceeeefccceeeefccceeeefccceeeefccceeeeccfceeeeccfceeeeccfceeeeccfceeeeccfcee00000000
eeffcceeeeffcceeeeffcceeeeffcceeeffccceeeeffcceeeeffcceeeeffcceeeeffcceeeeffcceeeecfffeeeecfffeeeecfffeeeecfffeeeecfffee00000000
eeffcceeeeffcceeeeffccee1effcceeefffcceeeeffcceeeeffcceeeeffcceeeeffcceeeeffcceeeecfffeeeecfffeeeecfffeeeecfffeeeecfffee00000000
eeefcceeeeefcceefeefccee1eefcceeeeefcceeeeefcceeeeefcceeeeefcceeeeefcceeeeefcceeeeccfeeeeeccfeeeeeccfeeeeeccfeeeeeccfeee00000000
eef1cceeeef1cceefef1ccee1ef1cceeeef1cceeeef1cceeeef1cceeeef1cceeeef1cceeeef1cceeeecc11eeeecc11eeeecc11eeeecc11eeeecc11ee00000000
eef1cceefef1cceeeff1cceeeff1cceeeef1c1eeeef1cceeeef1cceeeef1cceeeef1cceeeef1cceeeecc01eeeecc01eeeecc01eeeecc01eeeecc01ee00000000
eef1cfeeeff1cfeeee11cfeeeef1c1eeeef111eeeef1c1eeeef1c1eeeef1c1eeeef1c1eeeef1c1eeeefc1feeeefc1feeeefc1feeeefc1feeeefc1fee00000000
eeffffeeee111feeee111feeeef111eeeef111eeeef111eeeef111eeeef111eeeef111eeeef111eeeef11feeeef11feeeef11feeeef11feeeef11fee00000000
ee111feeee111feeee111feeeef111eeeef111eeeef111eeeef111eeeef111eeeef111eeeef111eeeef11feeeef11feeeef11feeeef11feeeef11fee00000000
ee111feeee111feeee111feeee1111eeeef111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111ee00000000
ee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111ee00000000
ee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee1111eeee111eeeee1111eeee1111eeee1111eeee1111eeee1111eeee1111ee00000000
eeeffeeeeeeffeeeeeeffeeeeeeffeeeeeeffeeeeeeffeeeeefefeeeeefefeeeeeeffeeeeefefeeeeeeffeeeeeefefeeeeefefeeeeeffeeeeeefefee00000000
eeeffeeeeeeffeeeeeeffeeeeeeffeeeeeeffeeeeeeffeeeee0efeeeeefefeeeeeef0eeeeefefeeeeeeffeeeeeefe0eeeeefefeeeee0feeeeeefefee00000000
eee00eeeeee00eeeeee00eeeeee00eeeeee00eeeeee00eeeeeee0eeeee0e0eeeeee0eeeeee0e0eeeeee00eeeeee0eeeeeee0e0eeeeee0eeeeee0e0ee00000000
88888888888888888888888888888888888888882222222222222222222222222222222222222222111111111111111111111111111111111111111100000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000eef111ee000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000eef111ee000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000ee1111ee000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000e11111ee000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000e11111ee000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000efeefeee000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000e0eefeee000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000eeee0eee0000000000000000000eeeeeeee000000000000000000000000000000000000000000000
aaccccccccccc59aaa9aacacaaaaaaeecc11111111111115d555d11111111111eeeeeeeeeeecc59aaa9eeeeeeeeeeeee66666666666666666666666666666666
cccccccccaaa9599999acccccaaaaaeecc111111111155d5dd44411111111111eeeeeeeecaaa9599999acceeeeeeeeee66666666666666666666666666666666
ccccccccc95b939b444aaccccaaaaaeecc111111111d554f4444455111111111eeeeeeccc95b939b444aaccceeeeeeee66666666666666666666666666666666
ccccccaa5545b9ff5bbaccaacccccaeecc11111155554554ff55511151111111eeeeecaa5545b9ff5bbaccaaceeeeeee00666700777776666666666666666666
ccccc5aaa9aa9ffff95c9caccccccaeecc000115515d55ef7ff4506051111111eeeec5aaa9aa9ffff95c9caccceeeeee66000077777776666662666626666666
ccccaaac595437ff399a9ccacccccaeecc001155515654fffffd45d011111111eeecaaac595437ff399a9ccaccceeeee60000007777777766662222222226666
cccc55ac5c99ffff99990b5aaccccceecc00005511514effffddd40551111111eeec55ac5c99ffff99990b5aacceeeee60707007777777766662feeeefff2666
cccc5accca9ff3f39999ccca5acccceecc00015510056fffff666d1001510000eecc5accca9ff3f39999ccca5acceeee6000000777777776662eeeeeeefff266
ccc55accac6f993939995acaaacccceecc00155510506fdd66665d5505510000eec55accac6f993939995acaaacceeee66000077777777766620ee0eeeeff266
ccaacaaac9639993999990caaacccceecc005111110466d4d66dddd015150000ecaacaaac9639993999990caaaccceee6677777777777776688888eeeeeef226
ca5aaaca0969999f699990caa5cccceecc015511150d6eddd66d4dd001150000ea5aaaca0969999f699990caa5ccceee6666777777777666684848eeeeeee262
aa55aac00666996f399990c5aa00cceecc1155551006666d6f6dddd00511000eaa55aac00666996f399990c5aa00ccee6666707070707666688888eefffee266
c5555a00566666ff66999ca5aca000eecc15555100566666ff66d6611444100ec5555a00566666ff66999ca5aca000ee6666606060606666662eeeefffffe266
aa555c0c56ff66ff69666a555aaccceecc1555510056ff66ff6666655555100eaa555c0c56ff66ff69666a555aacccee66666060606066666662222222222666
a9955c00c66ff639996695a5aaca0deecc55555100066ff6eedd66d55555010ea9955c00c66ff639996695a5aaca0dee66666060606066666666262666262666
99555c00c66ff66f69669a5a5acc00eecc5dd55100066ff66f6666d05555010e99555c00c66ff66f69669a5a5acc00ee66666666666666666666666666666666
99555acaa96666666666909ac5cc65eeccdd555515566666666666d0d515016e99555acaa96666666666909ac5cc65ee66666666666666666666666666666666
55955a5aaa6666996999905ad5ca66eecc55d55d515566666dee66d055d5156e55955a5aaa6666996999905ad5ca66ee66666666666666666666666666666666
555ac55a5a96666369990c595aaa66eecc555505555566666e22dd505d51516e555ac55a5a96666369990c595aaa66ee66666666666666666666666666666666
5ca5caa5c559663999990ac55c5559eecc51151555055d666d226d011551555e5ca5caa5c559663999990ac55c5559ee66666666666666666666666666666666
a5aca5a5aac9666949990cc955ad56eecc15515555150d666d2d6d001d555d5ea5aca5a5aac9666949990cc955ad56ee66666666666666666666666666666666
195aa59aaa5c9966669005a55a5556eecc1d5115d55550d66666d00555555556e95aa59aaa5c9966669005a55a555eee66666666666666666666666666666666
11a55955aac5559999c00aa5655d59eecc11155d55511555dd6d000155655d5de1a55955aac5559999c00aa5655d5eee66666666666666666666666666666666
11aa555aaaaa59995c00a5c96555cceecc1115555515155dd55100150d655511eeaa555aaaaa59995c00a5c96555eeee66666666666666666666666666666666
11c5caca55aa59995cc05aa56a95a0eecc11050d0555515ddd5000515561d510eec5caca55aa59995cc05aa56a95eeee66666666666666666666666666666666
11c5cc05a555a99950c05aa565d5a0eecc1105050515551ddd5000555565d550eee5cc05a555a99950c05aa565deeeee66666666666666666666666666666666
15a5acc00ccaa5955cc0ac55d5d55ceecc15151110001155d550001155d5d550eee5acc00ccaa5955cc0ac55d5deeeee66666666666666666666666666666666
115d5a1c0ccc5cc55ccccaaa55a551eecc105d5d100000500550000555555551eeee5a1c0ccc5cc55ccccaaa55eeeeee66666666666666666666666666666666
11c5a5111cc5c5a55acccd5555aa51eecc110555111005051551110d55551551eeeee5111cc5c5a55acccd555eeeeeee66666666666666666666666666666666
110155ac100caaacca11ac59dd5a5aeecc11015551100051510111105ddd5155eeeeeeac100caaacca11ac59eeeeeeee66666666666666666666666666666666
1101ca5110000caacc111cd5c55a5aeecc11010d5110000151011110d5055151eeeeeeee10000caacc111ceeeeeeeeee66666666666666666666666666666666
110011111c00cc5cc011cc55c55ca5eecc110011111100005000111155055155eeeeeeeeeee0cc5cc01eeeeeeeeeeeee66666666666666666666666666666666
6666665666666566666665666666656600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
6666665666666566666665666666656600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
6666665666666566666665666666656600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
6666656666666656666665666666566600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
6666656666666656666665666666566600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
6666656666666656666665666666566600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
6666656666666656666665666666566600000000000000000000000000000000eeeeeeeeeeeeeecccceeeeeeeeeeeeee00000000000000000000000000000000
5555555555555555555555555555555500000000000000000000000000000000eeeeeeeeeeeecccccccceeeeeeeeeeee00000000000000000000000000000000
5555555555555555555555555555555500000000000000000000000000000000eeeeeeeeeecccccccccccceeeeeeeeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeeeeeecccccccccccccccceeeeeeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeeeecccccccccccccccccccceeeeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeeccccccccccccccc00cccccceeeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeeeccccccccccccffff00ccccceeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeee9cccccccccffffffff00cccceee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeee999cccccffffffffffff00cccee00000000000000000000000000000000
0008888000088880000888800008888000000000000000000000000000000000eeeee9999ccfffffffffffffffff0cce00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeee99999fffffffffffffffffffeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeee99999fffffffffffffffffffeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeee99999fffffffffffffffffffeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeee99999fffccccccffffffffffeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeee99999fffc6666cffffffffffeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeee99999fffc6666cffccccffffeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeeee9999fffccccccffccccffffeee00000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000eeeeeee999fffffffffffccccffffeee00000000000000000000000000000000
6666666656666666656666666666566600000000000000000000000000000000eeeeeeee99fffffffffffcc8cffffeee00000000000000000000000000000000
6666666656666666656666666666566600000000000000000000000000000000eeeeeeeee9fffffffffffccccffffeee00000000000000000000000000000000
6666666656666666656666666666566600000000000000000000000000000000eeeeeeeeeefffffffffffccccffffeee00000000000000000000000000000000
6666666656666666656666666666566600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
6666666566666666665666666666566600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
6666666566666666665666666666566600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
6666666566666666665666666666566600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
6666666566666666665666666666566600000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000
__sfx__
000c00000010000100000000000000000000000000000000000000000000000000000000000000000000000007150071500715007150051500515005150051500415004150041500415002150021500215002150
000c00200c5500c5500c5500c55018550185501855018550175501755017550175501555015550155501555010550105501055011550135501355013550155501355013550135501355010550105501055010550
010c00000e5500e5500e5500e550135501355013550135500e5500e5500e5500e5501355013550135501355010550105501055018550175501755017550155501355013550135501355013550135501355013550
000c00000e5500e5500e5500b5500e5500e5500e55013550175501755017550175501555015550155501555013550135501355013550135501355013550135501355013550135501355000000000000000000000
010c00001855018550185501855018550185501855018550185501855018550185501755017550175501555013550135501355013550135501355013550135501355013550135501355010550105501055011550
010c00000000000000000000000010553105531055300000105501055010550105500000000000000000000010553105531055300000105501055010550105500000000000000000000000000000000000000000
000c00001355013550135501355015550155501555015550105501055010550105501355013550135501355011550115501155011550115501155011550115501155011550115501155000000000000000000000
000c00000c1500c1500c1500c150071500715007150071500c1500c1500c1500c1500d1500d1500d1500d1500e1500e1500e1500e1500b1500b1500b1500b1500915009150091500915007150071500715007150
000c0000175501755017550175501755017550175501755017550175501755017550155501555015550135501155011550115501155011550115501155011550115501155011550115500e5500e5500e55010550
000c00000000000000000000000011553115531155300000115501155011550115500000000000000000000011500115001150011500115531155311553000001155011550115501155000000000000000000000
010c00000c1500c1500c1500c150071500715007150071500c1500c1500c1500c150071500715007150071500c1500c1500c1500c150071500715007150071500c1500c1500c1500c15007150071500715007150
000c00000e1500e1500e1500e150071500715007150071500e1500e1500e1500e150071500715007150071500e1500e1500e1500e150071500715007150071500e1500e1500e1500e15007150071500715007150
000c00000e1500e1500e1500e150071500715007150071500e1500e1500e1500e150071500715007150071500c1500c1500c1500c150101501015010150101500e1500e1500e1500e15007150071500715007150
010c00001155011550115501155013550135501355013550175501755017550175501a5501a5501a5501a55013550135501355013550135501355013550135501355013550135501355013550135501355013550
000c00001855018550185501855018550185501855018550185501855018550185501755017550175501555013550135501355013550135501355013550135501355013550135501355010550105501055011550
000c00001355013550135501355018550185501855018550175501755017550175501615016150161501615015550155501555015550155501555015550155501555015550155501555000000000000000000000
000c00001a5501a5501a5501a5501855018550185501855017550175501755017550155501555015550155501355013550135501355013550135501555015550135501355010550105500e5500e5500c5500c550
000c00001355013550135501355013550135501355013550155501555015550155501755017550175501755018550185501855018550185501855018550185501855018550185501855500000000000000000000
010c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000135531355313553000001355013550135501355513550135501355013555
000c00000c1500c1500c1500c1500c1500c1500c1500c1500e1500e1500e1500e150101501015010150101501115011150111501115002150021500215002150091500915009150091500c1500c1500c1500c150
010c0000051500515005150051500515005150051500515006150061500615006150051500515005150051500715007150071500715007150071501515015150131501315010150101500e1500e1500c1500c150
010c00001315013150131501315513150131501315013155071500715007150071550715007150071500715500150001500015000150001500015000150001500015000150001500015500000000000000000000
__music__
01 01424344
00 02424344
00 01424344
00 03404300
00 0405470a
00 06474307
00 0809430b
00 0d42430c
00 0e05430a
00 0f424313
00 10424314
02 11124315

