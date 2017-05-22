local physics = require ("physics")

physics.start()
physics.setGravity(0,0)
-- physics.setDrawMode("hybrid")

local w = display.contentWidth
local h = display.contentHeight

local galaxy = display.newImage( "galaxy.png")
galaxy.x = w/2
galaxy.y = h/2
galaxy.fill.effect = "filter.scatter"
 
galaxy.fill.effect.intensity = .2
-- galaxy.anchorX = 0
-- galaxy.anchorY = 0
     
local startButton = display.newImage( "start.png")
startButton.x = w/4
startButton.y = h/1.08

local stopButton = display.newImage( "stop.png" )
stopButton.x = w/2
stopButton.y = h/1.08


local sun = display.newCircle(display.contentCenterX, 
display.contentCenterY, 200)
sun:setFillColor(1,1,0)
sun.fill.effect = "generator.sunbeams"
 
sun.fill.effect.posX = 0.5
sun.fill.effect.posY = 0.5
sun.fill.effect.aspectRatio = ( sun.width / sun.height )
sun.fill.effect.seed = 0

local mercury = display.newCircle(display.contentWidth*.360, 
display.contentCenterY, 28.8)
mercury:setFillColor(1,0,0)

local mercuryOrbit = display.newCircle( 550, 950, 160 )
mercuryOrbit.strokeWidth = 20
mercuryOrbit:setStrokeColor( 0, 0, 1 )
mercuryOrbit.alpha = 0.1  -- set to 10% opacity


local venus = display.newCircle(display.contentWidth*.290, 
display.contentCenterY, 22.8)
venus:setFillColor(1,1,0)
local venusOrbit = display.newCircle( 550, 950, 230 )
venusOrbit.strokeWidth = 20
venusOrbit:setStrokeColor( 0, 1, 1 )
venusOrbit.alpha = 0.1  -- set to 10% opacity


local earth = display.newCircle(display.contentWidth*.210, 
display.contentCenterY, 42.8)
earth:setFillColor(0,.5,.5)
local earthOrbit = display.newCircle( 550, 950, 315 )
earthOrbit.strokeWidth = 20
earthOrbit:setStrokeColor( 1, 0, 1 )
earthOrbit.alpha = 0.1  -- set to 10% opacity


local mars = display.newCircle(display.contentWidth*.120, 
display.contentCenterY, 20.8)
mars:setFillColor(1,0,0)
local marsOrbit = display.newCircle( 550, 950, 410 )
marsOrbit.strokeWidth = 20
marsOrbit:setStrokeColor( 0.5, 0.5, 0.3 )
marsOrbit.alpha = 0.1  -- set to 10% opacity


physics.addBody(sun, "static")

physics.addBody(mercury, "dynamic", {density=0, friction=0,
radius=28.8})

physics.addBody(venus, "dynamic", {density=0, friction=0,
radius=22.8})

physics.addBody(earth, "dynamic", {density=0, friction=0,
radius=42.8})

physics.addBody(mars, "dynamic", {density=0, friction=0,
radius=20.8})

local mercuryJoint = physics.newJoint("pivot", sun, mercury,
sun.x, sun.y)
mercuryJoint.isMotorEnabled = false
mercuryJoint.motorSpeed = -150
mercuryJoint.maxMotorTorque = 100

local venusJoint = physics.newJoint("pivot", sun, venus,
sun.x, sun.y)
venusJoint.isMotorEnabled = false
venusJoint.motorSpeed = -110
venusJoint.maxMotorTorque = 100

local earthJoint = physics.newJoint("pivot", sun, earth,
sun.x, sun.y)
earthJoint.isMotorEnabled = false
earthJoint.motorSpeed = -50
earthJoint.maxMotorTorque = 100

local marsJoint = physics.newJoint("pivot", sun, mars,
sun.x, sun.y)
marsJoint.isMotorEnabled = false
marsJoint.motorSpeed = -40
marsJoint.maxMotorTorque = 100

function start (event)
    mercuryJoint.isMotorEnabled = true
    venusJoint.isMotorEnabled = true
    earthJoint.isMotorEnabled = true
    marsJoint.isMotorEnabled = true
    return false
end

function stop (event)
    mercuryJoint.motorSpeed = 0
    venusJoint.motorSpeed = 0
    earthJoint.motorSpeed = 0
    marsJoint.motorSpeed = 0
    return false
end

function scaleMercury (event)
    transition.scaleTo( mercury, { xScale=2.0, yScale=2, time=2000 } )
end

function scaleVenus (event)
    transition.scaleTo( venus, { xScale=2.0, yScale=2, time=2000 } )
end

function scaleEarth (event)
    transition.scaleTo( earth, { xScale=2.0, yScale=2, time=2000 } )
end

function scaleMars (event)
    transition.scaleTo( mars, { xScale=2.0, yScale=2, time=2000 } )
end



startButton:addEventListener("tap", start)
stopButton:addEventListener("tap", stop)
mercury:addEventListener("touch", scaleMercury)
venus:addEventListener("touch", scaleVenus)
earth:addEventListener("touch", scaleEarth)
mars:addEventListener("touch", scaleMars)



