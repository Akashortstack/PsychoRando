-- <LuaCutsceneDataFile/>
EZScenes = EZScenes or {}
EZScenes["CS_ElevatorDrop2"] = function()

    Global.EZScene = {}

    -- <actors>
    -- <actor name="global" type="Global" />
    -- <actor name="camera" type="Camera" />
    -- <actor name="raz" type="Actor">
    -- <resources>
    -- <resource name="CrawlOutofWater" path="Anims/DartNew/CrawlOutofWater.jan" type=".JAN" />
    -- <resource name="DartIdle01" path="Anims/DartNew/DartIdle01.jan" type=".JAN" />
    -- <resource name="DartIdle02" path="Anims/DartNew/DartIdle02.jan" type=".JAN" />
    -- <resource name="DartIdle03" path="Anims/DartNew/DartIdle03.jan" type=".JAN" />
    -- <resource name="DartIdle04" path="Anims/DartNew/DartIdle04.jan" type=".JAN" />
    -- <resource name="DartIdle05" path="Anims/DartNew/DartIdle05.jan" type=".JAN" />
    -- <resource name="standstill" path="Anims/DartNew/standstill.jan" type=".JAN" />
    -- <resource name="walkmove" path="Anims/DartNew/walkmove.jan" type=".JAN" />
    -- </resources>
    -- </actor>
    -- </actors>
    Global.EZScene.Actors =
    {
        Elevator = { cScriptObject = 'elevator1', cCODE = '' },
    }

    Global.EZScene.BeginScene =
    {
        tActions =
        {
			-- Open doors
			{ time = 0, action = 'runMemberFunction', entity = 'Elevator', argString = '1, 0', functionName = 'closeDoors', bStrong = 0, },
			-- Initial Cut
            { time = 0, action = 'cutTo', yOr = 67, zPos = 5179, xOr = -37, bStrong = 1, xPos = 736, zOr = 0, yPos = 2004, fov = 104, },
            -- Initial position
            { time = 0, action = 'placeChar', yPos = 2210, entity = 'raz', zPos = 4385.572, xOr = 0, xPos = -811.4423, yOr = -177.7354, zOr = 0, },
            -- Hide raz
            { time = 0, action = 'runMemberFunction', entity = 'raz', argString = nil, functionName = 'makeInvisible', bStrong = 0, },
            { time = 0, action = 'fadeToBlack', duration = 0, bStrong = 0, },
            -- Drop
            { time = 0.1666667, action = 'setState', entity = 'Elevator', stateName = 'Drop2', },
            { time = 0.1666667, action = 'fadeIn', duration = 20, bStrong = 0, },
            { time = 0.8333333, action = 'playSound', cueName = 'ElevatorLand', },
            { time = 0.8333333, action = 'sleep', duration = 5, },
        }
    }

    Global.EZScene.Scene =
    {
        tLines = 
        {
            {
                cLine = "ASAQ007RA",
                -- <DialogText>Well at least it's fast.</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        -- Walk out of elevator
                        { time = 1.066667, action = 'playAnim', looping = 0, entity = 'raz', speed = 1, blendTime = 0, animName = 'Anims/DartNew/CrawlOutofWater.jan', },
                        -- Ensure position
                        { time = 1.4, action = 'placeChar', yPos = 210, entity = 'raz', zPos = 4385.572, xOr = 0, xPos = -811.4423, yOr = -177.7354, zOr = 0, },
                        -- Show raz
                        { time = 1.4, action = 'runMemberFunction', entity = 'raz', argString = nil, functionName = 'makeVisible', bStrong = 0, },
                        -- Cut to door
                        { time = 1.4, action = 'cutTo', yOr = 147, zPos = 3350, xOr = -25, bStrong = 1, xPos = -232, zOr = 0, yPos = 913, fov = 104, },
                        -- Open doors
                        { time = 1.666667, action = 'runMemberFunction', entity = 'Elevator', argString = '0, 0', functionName = 'openDoors', bStrong = 0, },
                        -- Zoom in on Raz
                        { time = 2.3, action = 'camPathTo', yOr = 164, zPos = 3629, xOr = -19, decl = 30, xPos = -665, accel = 10, zOr = 0, yPos = 510, duration = 90, fov = 104, },
                        { time = 2.3, action = 'sleep', duration = 1, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 39, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
                        -- Ensure cut
                        { time = 1.666667, action = 'cutTo', yOr = 164, zPos = 3629, xOr = -19, bStrong = 1, xPos = -665, zOr = 0, yPos = 510, fov = 104, },
                        { time = 2.5, action = 'fadeToBlack', duration = 15, bStrong = 0, },
                        -- Idle
                        { time = 2.7, action = 'playAnim', looping = 1, entity = 'raz', speed = 1, blendTime = 10, animName = 'Anims/DartNew/standstill.jan', },
                        { time = 2.7, action = 'sleep', duration = 9, },
                    }
                },
            }
            ,
        }
    }

    Global.EZScene.EndScene =
    {
        tActions =
        {
            -- Ensure end position
            { time = 0, action = 'runMemberFunction', entity = 'Elevator', argString = '1', functionName = 'moveToStart', bStrong = 0, },
            --edit to prevent invisible Raz if skipping
            { time = 0, action = 'runMemberFunction', entity = 'raz', argString = nil, functionName = 'makeVisible', bStrong = 0, },
            -- Ensure position
            --edit position to be off elevator, helps with cutscene skips
            { time = 0, action = 'placeChar', yPos = 113.8181, entity = 'raz', zPos = 4019.804, xOr = 0, xPos = -832.6858, yOr = -177.7354, zOr = 0, },
            { time = 0, action = 'fadeToBlack', duration = 0, bStrong = 0, },
            { time = 0, action = 'sleep', duration = 5, },
            

        }
    }

end

