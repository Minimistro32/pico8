pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--fathers day
function _init()
	frame=0
	t=0

    alien_sr=100
    life_sr=100

    state="cutscene"
    -- state="running"
    cutscene="type"
    frame_rate = 5
    
	x=50
	y=114
    health=3 --from 3 to 0, if goes negative dead
    y_laser={}
    gun=true --true is left, falsez is right

    code={}
    code_vis={}
    for i=1,600 do
        add(code, flr(rnd(2)))
    end
    for i=1,600 do
        add(code, flr(rnd(2)) == 0)
    end
    code_start=0
	
	life_q={"uphill_bothways()", "school()", "mat_sci()", "mission()", "ups()", "FAM", "get_apt()", "FAM", "full_time()", "more_school()", "FAM", "info_sys()", "promotion()", "move_boise()", "work_nights()", "promotion()", "preload_mngr()", "grind()", "ma_degree()", "FAM", "paint_grass()", "plumbing()", "FAM", "promotion()", "move_to_wa()", "accquired_by_bsi()", "promotion()", "regional_mngr()", "disneyland!", "move_to_ca()", "ants()", "it_director()", "hr_director()", "sql_reports()","open_the_dc()", "acquire_exide()", "covid()", "cbs_merger()", "weddings()", "empty_nester()"}
    life={}
    life_i = 1
    next_life=30--flr(rnd(300))

    aliens={}
    r_laser={}
    add_aliens(10)
    -- add_aliens(1)

    score=0
    family={
        {col=14, found=false},
        {col=9, found=false},
        {col=2, found=false},
        {col=3, found=false},
        {col=12, found=false}
    }
    fam_scrn={}
    fam_i=0
end

--UPDATES
function _update()
    frame+=1

    for i=1,600 do
        if flr(rnd(100)) == 0 then
            code_vis[i] = not code_vis[i]
        end
    end
    
    if(frame%frame_rate==0 and cutscene=="type")then
        t+=1
        if t==31 then
            cutscene="hold"
        end
    end
    if(frame%frame_rate==0 and cutscene=="cursor")then
        t+=1
        if t > 4 then
            frame_rate=10
        end
        if t == 19 then
            state="running"
            x=50
            frame = 0
        end
    end
    
    if(state=="cutscene") then
        if(btnp(🅾️))then
            if cutscene=="type" then
                t=30
            elseif cutscene=="hold" then
                cutscene="cursor"
                t=0
                frame_rate=20
            end
        end
    end

    if(state=="running")then
        if(btn(⬆️) and y > 97)then
            y-=1
        end
        if(btn(➡️) and x < 91)then
            x+=1
        end
        if(btn(⬅️) and x > 6)then
            x-=1
        end
        if(btn(⬇️) and y < 132)then
            y+=1
        end
        if(btnp(❎) or btnp(🅾️))then
            x_offset = 6 - (13 * tonum(gun))
            add(y_laser,
                {
                    num=rnd({"@","#","\\","%","{","}","[","]","|",",",".","(",")","<",">","?","!","&","^","$","$","$","$"}),
                    x=x + x_offset,
                    y=y-12
                }
            )
            gun = not gun
        end

        --background
        if frame%30 == 0 then
            code_start = (code_start + 25) % 600
        end

        --aliens
        if frame%alien_sr == 0 then
            add_aliens(flr(rnd(3)))
        end

        for a in all(aliens) do
            a.x += a.dx
            if a.x > 90 or a.x < 0 then
                a.dx = -a.dx
            end
            a.y += a.dy
            if a.y > 80 or a.y < 0 then
                a.dy = -a.dy
            end

            if flr(rnd(400)) == 0 then
                add(r_laser, {num=flr(rnd(2)), x=a.x, y=a.y})
            end
        end

        --lasers
        for rl in all(r_laser) do
            rl.y += 1 
        end
        for yl in all(y_laser) do
            yl.y -= 1 
        end

        --life
        if frame > next_life then
            if life_q[life_i] == "FAM" then
                fam_i += 1
                add(fam_scrn, {data=family[fam_i], y=0})
            else
                add(life, {str=life_q[life_i], x=flr(rnd(70)), y=0})
            end
            next_life += flr(rnd(life_sr)) + 30
            life_i += 1
        end

        for event in all(life) do
            event.y += 1
        end

        for person in all(fam_scrn) do
            person.y += 1
        end

        --collision
        for a in all(aliens) do
            for yl in all(y_laser) do
                lx = yl.x - 1
                ax = a.x
                lw = 4
                aw = 7

                ly = yl.y - 1
                ay = a.y - 1
                lh = 6
                ah = 5

                if lx < ax + aw and lx + lw > ax and ly < ay + ah and ly + lh > ay then
                    del(aliens, a)
                    del(y_laser, yl)
                    score += 50
                end
            end
        end

        for event in all(life) do
            --rectfill(event.x - 1, event.y - 1, event.x + (#event.str * 4), event.y + 5, 14)
            for yl in all(y_laser) do
                lx = yl.x - 1
                ex = event.x - 1
                lw = 4
                ew = 1 + (#event.str * 4)

                ly = yl.y - 1
                ey = event.y - 1
                lh = 6
                eh = 6

                if lx < ex + ew and lx + lw > ex and ly < ey + eh and ly + lh > ey then
                    del(life, event)
                    del(y_laser, yl)
                    score += next_life
                end
            end
        end

        for rl in all(r_laser) do 
            --laser and ship l- / y-
            lx = rl.x - 1
            sx = x - 6
            lw = 4
            w = 13

            ly = rl.y - 1
            sy = y - 13
            lh = 6
            h = 9

            if lx < sx + w and lx + lw > sx and ly < sy + h and ly + lh > sy then
                del(r_laser, rl)
                health -= 1
            end
        end

        for person in all(fam_scrn) do 
            --laser and ship l- / y-
            fx = 50
            sx = x - 6
            fw = 4
            w = 13

            fy = person.y
            sy = y - 13
            fh = 6
            h = 9

            if fx < sx + w and fx + fw > sx and fy < sy + h and fy + fh > sy then
                del(fam_scrn, person)
                family[fam_i].found = true
            end
        end
    end
end

function add_aliens(n)
    for i=1,n do
		add(aliens, {x=flr(rnd(82)), y=flr(rnd(80)), dx=flr(rnd(5)) - 2, dy=flr(rnd(5)) - 2})
		-- add(aliens, {x=flr(rnd(82)), y=flr(rnd(80)), dx=0, dy=0})
	end
end


--DRAW
function _draw()
	cls(0)

    if(state=="cutscene") then
        if cutscene=="type" or cutscene=="hold" then
            y_offset=min(max(flr((t-25)/2), 0)*-6, 18)
            print(">",1, 122, 7-((flr(frame/20)%2)*7))
            print(sub("> press z to begin work\n>\n>\n ",1, -32+t),1,122+y_offset,7)
        elseif cutscene=="cursor" then
            if t < 5 then
                spr(3+t,1+(t*15),122-(t*4))
            elseif t < 10 then
                if t%2 == 1 then
                    spr(1,57,98,2,2)
                else
                    spr(7,61,106)
                end
            elseif t < 20 then
                if t%2 == 0 then
                    draw_code()
                end
                
                draw_ship(64, 114)
            end
        end
    end

	if(state=="running") then
        draw_code()
        draw_ship(x, y)
        draw_ui()
        draw_aliens()

        for yl in all(y_laser) do
            draw_laser(yl, 10, 0)
        end
        
        for event in all(life) do
            rectfill(event.x - 1, event.y - 1, event.x + (#event.str * 4), event.y + 5, 14)
            print(event.str, event.x, event.y, 7)
        end

        for person in all(fam_scrn) do
            draw_family_orb(fam_i - 1, person.data.col, true, 36, person.y)
        end
    end
end

function draw_code()
    for ix=0,24 do
        for iy=0,20 do
            if code_vis[ix * iy] then
                print(code[(code_start + ix + iy) % 600 + 1], ix*5, iy*6, 11)
            end
        end
    end
end

function draw_ship(x, y)
    draw_shield(x, y)
    spr(1,x-7,y-16,2,2)
end

function draw_shield(x, y)
    --shield
    circfill(x-2, y-8, 8, 12)
    circfill(x+1, y-8, 8, 12)
    circfill(x+3, y-8, 8, 12)
    --overlay
    circfill(x-2, y-8, 8-health+1, 0)
    circfill(x+1, y-8, 8-health+1, 0)
    circfill(x+3, y-8, 8-health+1, 0)
end

function draw_aliens()
    for a in all(aliens) do
        circfill(a.x+3, a.y+2, 5, 0)
        print("🐱", a.x, a.y, 8)
    end

    for rl in all(r_laser) do
        draw_laser(rl, 8, 7)
    end
end

function draw_laser(laser, col, text_col)
    rectfill(laser.x-1, laser.y-1, laser.x+3, laser.y+5, col)
    print(laser.num, laser.x, laser.y, text_col)
end

function draw_ui()
    ui_start=128-30+2
    rectfill(ui_start,0, 128, 128, 0)
    print("conquer\n  work!\n\n\n\ncollect\n   your\nfamily!", ui_start+1, 1, 7)
    print(score, ui_start + 14 - ((#tostr(score) - 1) * 2), 19, 7)

    for i, person in pairs(family) do
        draw_family_orb(i, person.col, person.found, ui_start, 46 + (i * 13))
    end
    line(ui_start-1, 0, ui_start-1, 128,13)
end

function draw_family_orb(n, col, visible, x, y)
    circfill(x + 15, y, 5, 0)
    circ(x + 15, y, 5, 13)
    if visible then
        print("웃",x + 12, y-2, col)
    end
end
__gfx__
00000000000000000000000070000000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000007000000770700000007000000070000000700000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000700000000700000070700000707000707770700000000000000000000000000000000000000000000000000000000000000000
00077000000000077000000007000000007000000700070007000700707070700000000000000000000000000000000000000000000000000000000000000000
00077000000000777700000070000000000000000000000007000700770007700000000000000000000000000000000000000000000000000000000000000000
00700700000000777700000000000000000000000000000000000000070007000000000000000000000000000000000000000000000000000000000000000000
00000000000007700770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000070007700770007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077077000077077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077077000077077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077770000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007770000007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
