local rslib = require('rslib')

local rx, ry = getResolution ()
local font = loadFont("Play-Bold", 40)
local font2 = loadFont("Play", 30)
local font3 = loadFont("FiraMono", 15)
local font4 = loadFont("Play", 20)

local HoneycombLayer = createLayer()
local OutlineLayer = createLayer()
local layer = createLayer()
local imagelayer = createLayer()

-- SHIP INFO
if not init then
    info = {}
    for ix=0,0 do
        info[ix] = {}
        for iy=0,16 do
            info[ix][iy] = 0
        end
    end
    info[0][0] = "Mission Runner" --ship name
    info[0][1] = "assets.prod.novaquark.com/84521/03b8a53d-2b2c-48f9-828c-cfa8042f6670.png" --img src, leave "" if you do not have a picture uploaded
    info[0][2] = "S" --core size
    info[0][3] = "by RedDog Industries" --maker / creator name
    info[0][4] = "78 t" --dry mass 
    info[0][5] = "5.06 g" -- ATMO Thrust
    info[0][6] = "25.2 g" -- ATMO Brake
    info[0][7] = "1,154 KM/H" -- ATMO Max Speed
    info[0][8] = "4.13 g" -- ATMO Low Alt Lift
    info[0][9] = "5.17 g" -- ATMO High Alt Lift
    info[0][10] = "274 KM/H" -- ATMO Sus Speed
    info[0][11] = "3.8 g" -- SPACE Thrust
    info[0][12] = "7.38 g" -- SPACE Brake
    info[0][13] = "46,211 KM/H" -- SPACE Max Speed
    info[0][14] = "2.97 g" -- SPACE Low Alt Lift
    info[0][15] = "n/a" -- TOKEN price
    info[0][16] = "200,000 ħ" -- BLUEPRINT price
    info[0][17] = "DYNAMIC" -- core type
end
-- END of SHIP INFO

function DrawRDFooter()
    --If you modify our script, please leave this intact
    local footertxt = "Developed by RedDog Industries"
    setNextFillColor(layer, 1, 1, 1, 0.1)
    addText(layer, font3, footertxt, rx*0.66, ry - 15)
    setNextFillColor(layer, 1, 0, 0, 0.7)
    addText(layer, font3, footertxt, rx*0.66 - 2, ry - 15 - 2)
end

function addWindow (wx, wy, wwx, wwy)
    setNextStrokeColor(layer, 1, 1, 1, .1)
    setNextStrokeWidth(layer, 1)
    
    setNextShadow(layer, 20, 0, 0, 0, .7)
    setNextFillColor(layer, .5 ,.5, .5, .2)
    addBoxRounded(layer, wx, wy, wwx, wwy, 5)
end

function addTxt (tf, tx, ty, ttxt, tr, tg, tb)
    setNextFillColor(layer, 1 ,1, 1, 0.5)
    addText(layer, tf, ttxt, tx+1, ty+1)
    setNextFillColor(layer, tr ,tg, tb, 1)
    addText(layer, tf, ttxt, tx, ty)
end
    
function HexagonBackground(HoneycombLayer,OutlineLayer,r,g,b,a,str,stg,stb,sta,strokewidth,EdgeLength)
    
    local rx, ry = getResolution()
    local vw = rx/100
    local vh = ry/100
    
    local r = r or 55/255 -- edit BG color here
    local g = g or 10/255
    local b = b or 10/255
    local a = a or 1

    local str = str or 0/255
    local stg = stg or 0/255
    local stb = stb or 0/255
    local sta = sta or 1
    local strokewidth = strokewidth or 0.5*vh

    local EdgeLength = EdgeLength or 6;

    function addHexagon(HoneycombLayer,OutlineLayer,x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,r,g,b,a,str,stg,stb,sta,strokewidth)

        setDefaultFillColor(HoneycombLayer,Shape_Polygon,r,g,b,a)
        setDefaultStrokeColor(OutlineLayer,Shape_Line,str,stg,stb,a)
        setDefaultStrokeWidth(OutlineLayer,Shape_Line,strokewidth)
     
        addTriangle(HoneycombLayer,x1,y1,x2,y2,x3,y3)
        addTriangle(HoneycombLayer,x4,y4,x5,y5,x6,y6)
        addQuad(HoneycombLayer,x3,y3,x4,y4,x6,y6,x1,y1)

        addLine(OutlineLayer,x1,y1,x2,y2)
        addLine(OutlineLayer,x2,y2,x3,y3)
        addLine(OutlineLayer,x3,y3,x4,y4)

    end

    for ii = -5,170,EdgeLength*3 do
        for jj = -5,105,EdgeLength*math.sqrt(3) do
            grayvar = math.random()
            addHexagon(HoneycombLayer,OutlineLayer,(ii - EdgeLength/2)*vh,(jj - EdgeLength*math.sqrt(3)/2)*vh,(ii - EdgeLength)*vh,(jj - 0)*vh,(ii - EdgeLength/2)*vh,(jj + EdgeLength*math.sqrt(3)/2)*vh,(ii + EdgeLength/2)*vh,(jj + EdgeLength*math.sqrt(3)/2)*vh,(ii + EdgeLength)*vh,(jj - 0)*vh,(ii + EdgeLength/2)*vh,(jj - EdgeLength*math.sqrt(3)/2)*vh,grayvar*r,grayvar*g,grayvar*b,a,str,stg,stb,sta,strokewidth)
        end
    end

    for ii = -5+EdgeLength*1.5,170,EdgeLength*3 do
        for jj = -5+EdgeLength*math.sqrt(3)/2,105,EdgeLength*math.sqrt(3) do
            grayvar = math.random()
            addHexagon(HoneycombLayer,OutlineLayer,(ii - EdgeLength/2)*vh,(jj - EdgeLength*math.sqrt(3)/2)*vh,(ii - EdgeLength)*vh,(jj - 0)*vh,(ii - EdgeLength/2)*vh,(jj + EdgeLength*math.sqrt(3)/2)*vh,(ii + EdgeLength/2)*vh,(jj + EdgeLength*math.sqrt(3)/2)*vh,(ii + EdgeLength)*vh,(jj - 0)*vh,(ii + EdgeLength/2)*vh,(jj - EdgeLength*math.sqrt(3)/2)*vh,grayvar*r,grayvar*g,grayvar*b,a,str,stg,str,sta,strokewidth)
        end
    end
    
end

HexagonBackground(HoneycombLayer,OutlineLayer,r,g,b,a,str,stg,stb,sta,strokewidth,EdgeLength)

-- Header info
addWindow(20, 20, rx-40, 66)
addTxt (font, 30, 54, info[0][0], 1, 0, 0)
addTxt (font3, 33, 74, info[0][3], 1, 1, 0)
addTxt (font2, 745, 54, "Core Size: " .. info[0][2], 1, 1, 0)
addTxt (font3, 745, 74, "Core type: " .. info[0][17], 1, .5, 0)
 -- image window
addWindow(20, 100, 600, 400)

if info[0][1] == "" then 
 --   local shipimg = loadImage("assets.prod.novaquark.com/52764/bf6a920c-619c-496e-957d-da0cdc5d32a2.jpg")
 --   addImage(layer, shipimg, 22, 102, 596, 396)
    
    addTxt(font, 120, 300, "Image not available", 1, .5, 0)
    
    else
    local shipimg = loadImage(info[0][1])
    addImage(imagelayer, shipimg, 22, 102, 596, 396)
    end


 -- stats window
addWindow(640, 100, 364, 400)
addTxt(font2, 650, 140, "Atmo Stats:", 1, 1, 0)
addTxt(font4, 650, 175, "Max Thrust:", .5, .5, .5)
addTxt(font4, 650, 200, "Brake Force:", .5, .5, .5)
addTxt(font4, 650, 225, "Max Speed:", .5, .5, .5)
addTxt(font4, 650, 250, "Low Alt Lift:", .5, .5, .5)
addTxt(font4, 650, 275, "High Alt Lift:", .5, .5, .5)
addTxt(font4, 650, 300, "Sust. Speed:", .5, .5, .5)
addTxt(font2, 650, 340, "Space Stats:", 1, 1, 0)
addTxt(font4, 650, 375, "Max Thrust:", .5, .5, .5)
addTxt(font4, 650, 400, "Brake Force:", .5, .5, .5)
addTxt(font4, 650, 425, "Max Speed:", .5, .5, .5)
addTxt(font4, 650, 450, "Low Alt Lift:", .5, .5, .5)

addTxt(font4, 650, 480, "Dry Mass:", .5, .5, .5)

-- stat data
addTxt(font4, 830, 175, info[0][5], 1, 1, 1)
addTxt(font4, 830, 200, info[0][6], 1, 1, 1)
addTxt(font4, 830, 225, info[0][7], 1, 1, 1)
addTxt(font4, 830, 250, info[0][8], 1, 1, 1)
addTxt(font4, 830, 275, info[0][9], 1, 1, 1)
addTxt(font4, 830, 300, info[0][10], 1, 1, 1)

addTxt(font4, 830, 375, info[0][11], 1, 1, 1)
addTxt(font4, 830, 400, info[0][12], 1, 1, 1)
addTxt(font4, 830, 425, info[0][13], 1, 1, 1)
addTxt(font4, 830, 450, info[0][14], 1, 1, 1)

addTxt(font4, 830, 480, info[0][4], 1, 1, 1)

 -- price tag
addWindow(20, 516, 450, 80)
addTxt(font2, 33, 544, "Blueprint Price: " .. info[0][16], 1, .5, .2)
addTxt(font2, 33, 584, "Token Price:       " .. info[0][15], 1, .5, .2)
DrawRDFooter()


