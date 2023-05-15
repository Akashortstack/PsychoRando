-- <LuaCutsceneDataFile/>
EZScenes = EZScenes or {}
EZScenes["CS_GotKnightOfJoy"] = function()

    Global.EZScene = {}

    -- <actors>
    -- <actor name="global" type="Global" />
    -- <actor name="camera" type="Camera" />
    -- <actor name="raz" type="Actor">
    -- <resources>
    -- <resource name="DartIdle01" path="Anims/DartNew/DartIdle01.jan" type=".JAN" />
    -- <resource name="DartIdle02" path="Anims/DartNew/DartIdle02.jan" type=".JAN" />
    -- <resource name="DartIdle03" path="Anims/DartNew/DartIdle03.jan" type=".JAN" />
    -- <resource name="DartIdle04" path="Anims/DartNew/DartIdle04.jan" type=".JAN" />
    -- <resource name="DartIdle05" path="Anims/DartNew/DartIdle05.jan" type=".JAN" />
    -- <resource name="Listen" path="Anims/DartNew/Listen.jan" type=".JAN" />
    -- <resource name="standstill" path="Anims/DartNew/standstill.jan" type=".JAN" />
    -- <resource name="Talk_1" path="Anims/DartNew/Talk_1.jan" type=".JAN" />
    -- <resource name="Talk_2" path="Anims/DartNew/Talk_2.jan" type=".JAN" />
    -- <resource name="Talk_3" path="Anims/DartNew/Talk_3.jan" type=".JAN" />
    -- <resource name="walkmove" path="Anims/DartNew/walkmove.jan" type=".JAN" />
    -- </resources>
    -- </actor>
    -- </actors>
    Global.EZScene.Actors =
    {
        Script = { cScriptObject = 'Script_KnightOfJoy', cCODE = '' },
        -- <resources>
        -- <resource name="Breath_pose01" path="Anims/Becky/Breath_pose01.jan" type=".JAN" />
        -- <resource name="Breath_pose02" path="Anims/Becky/Breath_pose02.jan" type=".JAN" />
        -- <resource name="Confusion" path="Anims/Becky/Confusion.jan" type=".JAN" />
        -- <resource name="DefPose01" path="Anims/Becky/DefPose01.jan" type=".JAN" />
        -- <resource name="DefPose02" path="Anims/Becky/DefPose02.jan" type=".JAN" />
        -- <resource name="Flail" path="Anims/Becky/Flail.jan" type=".JAN" />
        -- <resource name="Flail_loop" path="Anims/Becky/Flail_loop.jan" type=".JAN" />
        -- <resource name="Flinch" path="Anims/Becky/Flinch.jan" type=".JAN" />
        -- <resource name="Gesture01" path="Anims/Becky/Gesture01.jan" type=".JAN" />
        -- <resource name="Gesture02" path="Anims/Becky/Gesture02.jan" type=".JAN" />
        -- <resource name="Gesture03" path="Anims/Becky/Gesture03.jan" type=".JAN" />
        -- <resource name="Gesture04" path="Anims/Becky/Gesture04.jan" type=".JAN" />
        -- <resource name="GetScript" path="Anims/Becky/GetScript.jan" type=".JAN" />
        -- <resource name="Pose01_Pose02" path="Anims/Becky/Pose01_Pose02.jan" type=".JAN" />
        -- <resource name="Pose02_Pose01" path="Anims/Becky/Pose02_Pose01.jan" type=".JAN" />
        -- <resource name="TK_loop" path="Anims/Becky/TK_loop.jan" type=".JAN" />
        -- <resource name="TurnLf" path="Anims/Becky/TurnLf.jan" type=".JAN" />
        -- <resource name="TurnRt" path="Anims/Becky/TurnRt.jan" type=".JAN" />
        -- <resource name="Walk_loop" path="Anims/Becky/Walk_loop.jan" type=".JAN" />
        -- <resource name="Walk_start" path="Anims/Becky/Walk_start.jan" type=".JAN" />
        -- </resources>
        Becky = { cScriptObject = 'Becky', cCODE = 'BE' },
    }

    Global.EZScene.BeginScene =
    {
        tActions =
        {
            -- Hold Script
            -- DO NOT CHANGE
            { time = 0, action = 'runMemberFunction', entity = 'raz', argString = '\'Script_KnightOfJoy\',1', functionName = 'setSelectedItem', bStrong = 0, },
            { time = 0, action = 'cutTo', yOr = -112, zPos = -571, xOr = -25, bStrong = 1, xPos = 1585, zOr = 0, yPos = 267, fov = 104, },
            -- Idle
            { time = 0, action = 'playAnim', looping = 1, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Breath_pose01.jan', },
            { time = 0, action = 'placeChar', yPos = -7.629395E-06, entity = 'raz', zPos = -304.5239, xOr = 0, xPos = 1793.347, yOr = 140.1714, zOr = 0, },
            { time = 0, action = 'fadeToBlack', duration = 0, bStrong = 0, },
            -- Walk Forward
            { time = 0.03333334, action = 'playAnim', looping = 0, entity = 'raz', speed = 1, blendTime = 8, animName = 'Anims/DartNew/walkmove.jan', },
            { time = 0.06666667, action = 'dostring', bStrong = 0, text = 'Global.bInhibitFigments = 1', },
            { time = 0.1666667, action = 'CutsceneSettings', bDontSetState = 0, bDontFadeIn = 1, },
            { time = 0.3, action = 'fadeIn', duration = 30, bStrong = 0, },
            { time = 0.3, action = 'sleep', duration = 1, },
        }
    }

    Global.EZScene.Scene =
    {
        tLines = 
        {
            {
                cLine = "THAD000BE",
                -- <DialogText>Hey, what's this? A new script?</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        -- Get Script
                        -- DO NOT CHANGE
                        { time = 0.3, action = 'playAnim', looping = 1, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/GetScript.jan', },
                        -- Stop
                        { time = 0.3, action = 'playAnim', looping = 1, entity = 'raz', speed = 1, blendTime = 12, animName = 'Anims/DartNew/Listen.jan', },
                        { time = 0.3, action = 'sleep', duration = 1, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        { time = 2, action = 'placeChar', yPos = -7.629395E-06, entity = 'raz', zPos = -289.5438, xOr = 0, xPos = 1756.333, yOr = -178.9729, zOr = 0, },
                        { time = 2, action = 'cutTo', yOr = -102, zPos = -543, xOr = -10, bStrong = 1, xPos = 1761, zOr = 0, yPos = 205, fov = 104, },
                        -- Attach to Becky
                        -- DO NOT CHANGE
                        { time = 2.666667, action = 'runMemberFunction', entity = 'Script', argString = '81', functionName = 'attachToBecky', bStrong = 0, },
                        { time = 2.666667, action = 'sleep', duration = 1, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 39, },
                    }
                },
            }
            ,
            {
                cLine = "THAD001BE",
                -- <DialogText>'Knight of Joy?'</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'placeChar', yPos = 1, entity = 'raz', zPos = -364.5732, xOr = 0, xPos = 1780.857, yOr = 132.9214, zOr = 0, },
                        -- Attach to Becky
                        -- DO NOT CHANGE
                        { time = 0, action = 'runMemberFunction', entity = 'Script', argString = '123', functionName = 'attachToBecky', bStrong = 0, },
                        -- Lower Raz's hands
                        -- DO NOT CHANGE
                        { time = 0, action = 'dostring', bStrong = 0, text = 'UnLoadPriorityAnim(Global.player,1,0.5)', },
                        { time = 0, action = 'cutTo', yOr = -102, zPos = -543, xOr = -10, bStrong = 1, xPos = 1761, zOr = 0, yPos = 205, fov = 104, },
                        { time = 0, action = 'sleep', duration = 10, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 35, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 55, },
                    }
                },
            }
            ,
            {
                cLine = "THAD002BE",
                -- <DialogText>Weird. It smells like popcorn. And it doesn't say which set to play it on...</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        -- Throw Script
                        -- DO NOT CHANGE
                        { time = 0.3, action = 'setState', entity = 'Script', stateName = 'Thrown', },
                        { time = 0.3, action = 'sleep', duration = 1, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        -- Idle
                        { time = 1.6, action = 'playAnim', looping = 1, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Breath_pose01.jan', },
                        { time = 1.6, action = 'sleep', duration = 84, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 12, },
                    }
                },
            }
            ,
            {
                cLine = "THAD003BE",
                -- <DialogText>Oh well. We'll just play it on whatever's on stage. I mean, what could POSSIBLY go wrong?</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'placeChar', yPos = 1, entity = 'raz', zPos = -396.9757, xOr = 0, xPos = 1714, yOr = 122.9021, zOr = 0, },
                        -- Gesture
                        { time = 0, action = 'playAnim', looping = 0, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Gesture02.jan', },
                        { time = 0, action = 'playAnim', looping = 1, entity = 'raz', speed = 1, blendTime = 5, animName = 'Anims/DartNew/standstill.jan', },
                        { time = 0.03333334, action = 'cutTo', yOr = 154, zPos = -717, xOr = -22, bStrong = 1, xPos = 1959, zOr = 0, yPos = 259, fov = 104, },
                        { time = 0.03333334, action = 'sleep', duration = 1, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        -- Gesture
                        { time = 3.9, action = 'playAnim', looping = 0, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Gesture04.jan', },
                        { time = 3.9, action = 'sleep', duration = 50, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 12, },
                    }
                },
            }
            ,
            {
                cLine = "THAD004BE",
                -- <DialogText>Here. You can be my first A.D.</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        -- Gesture
                        { time = 0, action = 'playAnim', looping = 0, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Gesture03.jan', },
                        { time = 0, action = 'placeChar', yPos = 1, entity = 'raz', zPos = -366.9757, xOr = 0, xPos = 1789.043, yOr = 122.9021, zOr = 0, },
                        { time = 0.03333334, action = 'cutTo', yOr = -112, zPos = -571, xOr = -25, bStrong = 1, xPos = 1585, zOr = 0, yPos = 267, fov = 104, },
                        { time = 0.03333334, action = 'sleep', duration = 1, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        -- Give Raz Megaphone
                        -- DO NOT CHANGE
                        --edit I CHANGED IT
                        --{ time = 0.5333334, action = 'dostring', bStrong = 1, text = 'if not FindScriptObject(\'Megaphone\') then SpawnScript(\'TH.Props.Megaphone\', \'Megaphone\'):killSelf() end', },
                        
                        
                        -- Idle
                        { time = 1.933333, action = 'playAnim', looping = 1, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Breath_pose01.jan', },
                        { time = 1.933333, action = 'sleep', duration = 43, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 4, },
                    }
                },
            }
            ,
            {
                cLine = "THAD005BE",
                -- <DialogText>Use the megaphone if you want to run the play again.</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        -- Gesture
                        { time = 0, action = 'playAnim', looping = 0, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Gesture03.jan', },
                        { time = 0, action = 'placeChar', yPos = 1, entity = 'raz', zPos = -366.9757, xOr = 0, xPos = 1789.043, yOr = 160, zOr = 0, },
                        -- Give Raz Megaphone
                        -- DO NOT CHANGE
                        --edit I CHANGED IT (AGAIN)
                        --{ time = 0, action = 'dostring', bStrong = 1, text = 'if not FindScriptObject(\'Megaphone\') then SpawnScript(\'TH.Props.Megaphone\', \'Megaphone\', \'self.bAutoSelect = 1\'):setPosition(Global.player:getPosition()) end', },
                        { time = 0.03333334, action = 'cutTo', yOr = -171, zPos = -653, xOr = -22, bStrong = 1, xPos = 1744, zOr = 0, yPos = 202, fov = 104, },
                        { time = 0.06666667, action = 'camPathTo', yOr = -171, zPos = -585, xOr = -26, decl = 20, xPos = 1762, accel = 10, zOr = 0, yPos = 173, duration = 84, fov = 104, },
                        { time = 0.06666667, action = 'sleep', duration = 8, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        -- Idle
                        { time = 1.933333, action = 'playAnim', looping = 1, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Breath_pose01.jan', },
                        { time = 1.933333, action = 'sleep', duration = 17, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 4, },
                    }
                },
            }
            ,
            {
                cLine = "THAD006BE",
                -- <DialogText>Okay! New script everybody! Let's practice!</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        -- Gesture
                        { time = 0, action = 'playAnim', looping = 0, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Gesture01.jan', },
                        { time = 0, action = 'placeChar', yPos = -7.629395E-06, entity = 'raz', zPos = -289.5438, xOr = 0, xPos = 1756.333, yOr = -178.9729, zOr = 0, },
                        { time = 0.03333334, action = 'cutTo', yOr = 133, zPos = -1051, xOr = -12, bStrong = 1, xPos = 2138, zOr = 0, yPos = 361, fov = 104, },
                        { time = 0.03333334, action = 'sleep', duration = 9, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        -- Idle
                        { time = 2.6, action = 'playAnim', looping = 1, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Breath_pose01.jan', },
                        { time = 2.6, action = 'sleep', duration = 37, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 5, },
                    }
                },
            }
            ,
            {
                cLine = "THAD007BE",
                -- <DialogText>And... Action!</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'camPathTo', yOr = 164, zPos = -1918, xOr = -16, decl = 30, xPos = 968, accel = 15, zOr = 0, yPos = 836, duration = 110, fov = 104, },
                        -- Gesture
                        { time = 0.2333333, action = 'playAnim', looping = 0, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Gesture03.jan', },
                        { time = 0.2333333, action = 'sleep', duration = 23, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 62, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
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
            -- idle
            { time = 0, action = 'playAnim', looping = 1, entity = 'raz', speed = 1, blendTime = 5, animName = 'Anims/DartNew/Listen.jan', },
            -- Idle
            { time = 0, action = 'playAnim', looping = 1, entity = 'Becky', speed = 1, blendTime = 5, animName = 'Anims/Becky/Breath_pose01.jan', },
            { time = 0, action = 'fadeToBlack', duration = 45, bStrong = 0, },
            --edit I CHANGED IT (THREE)
            --{ time = 1.466667, action = 'dostring', bStrong = 1, text = 'if not FindScriptObject(\'Megaphone\') then SpawnScript(\'TH.Props.Megaphone\', \'Megaphone\', \'self.bAutoSelect = 1\'):setPosition(Global.player:getPosition()) end', },
            { time = 1.466667, action = 'sleep', duration = 1, },
        }
    }

end

