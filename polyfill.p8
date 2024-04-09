pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
    r=0
end

function _update60()
    r+=0.005
end

function _draw()
    cls()
    make_hexagon(32,40)
    draw_polygon157(obj)
    make_star(32,96)
    draw_polygon157(obj)
    make_hexagon(96,40)
    draw_polygon148(obj)
    make_star(96,96)
    draw_polygon148(obj)
    print("157 tokens",12,2,7)
    print("148 tokens",76,2,7)
end

function make_star(x,y)
    obj={}
    for i=0,5 do
        add(obj,{x=x+sin(i/6+r)*15,y=y+cos(i/6+r)*15})
        add(obj,{x=x+sin((i+0.5)/6+r)*25,y=y+cos((i+0.5)/6+r)*25})
    end
end

function make_hexagon(x,y)
    obj={}
    for i=0,5 do
        add(obj,{x=x+sin(i/6+r)*25,y=y+cos(i/6+r)*25})
    end
end

function draw_polygon148(points)
    local xl,xr,ymin,ymax={},{},129,0xffff
    for k,v in pairs(points) do
        local p2=points[k%#points+1]
        local x1,y1,x2,y2=v.x,flr(v.y),p2.x,flr(p2.y)
        if y1>y2 then
            y1,y2,x1,x2=y2,y1,x2,x1
        end
        local d=y2-y1
        for y=y1,y2 do
            local xval=flr(x1+(x2-x1)*(d==0 and 1 or (y-y1)/d))
            xl[y],xr[y]=min(xl[y] or 32767,xval),max(xr[y] or 0x8001,xval)
        end
        ymin,ymax=min(y1,ymin),max(y2,ymax)
    end
    for y=ymin,ymax do
        rectfill(xl[y],y,xr[y],y,8)
    end
end

function draw_polygon157(points)
     local xl,xr,ymin,ymax={},{},129,0xffff
     for k,v in pairs(points) do
         local p2=points[k%#points+1]
         local x1,y1,x2,y2,x_array=v.x,flr(v.y),p2.x,flr(p2.y),xr
         if y1==y2 then
             xl[y1],xr[y1]=min(xl[y1] or 32767,min(x1,x2)),max(xr[y1] or 0x8001,max(x1,x2))
         else
             if y1>y2 then
                 x_array,y1,y2,x1,x2=xl,y2,y1,x2,x1
             end    
             for y=y1,y2 do
                 x_array[y]=flr(x1+(x2-x1)*(y-y1)/(y2-y1))
             end
         end
         ymin,ymax=min(y1,ymin),max(y2,ymax)
     end
     for y=ymin,ymax do
         rectfill(xl[y],y,xr[y],y,8)
     end
 end