-- <LuaCutsceneDataFile/>
EZScenes = EZScenes or {}
EZScenes["CS_EmoBagTutorial"] = function()

    --[[Global.EZScene = {}

    -- <actors>
    -- <actor name="global" type="Global" />
    -- <actor name="camera" type="Camera" />
    -- <actor name="raz" type="Actor">
    -- <resources>
    -- <resource name="DartIdle01" path="Anims/DartNew/DartIdle01.jan" type=".JAN" />
    -- <resource name="DartIdle02" path="Anims/DartNew/DartIdle02.jan" type=".JAN" />
    -- <resource name="Listen" path="Anims/DartNew/Listen.jan" type=".JAN" />
    -- </resources>
    -- </actor>
    -- </actors>
    Global.EZScene.Actors =
    {
        emobag = { cScriptObject = 'EmoBagSteamertrunk', cCODE = '' },
        coach = { cScriptObject = 'Coach', cCODE = 'CO' },
    }

    Global.EZScene.BeginScene =
    {
        tActions =
        {
            { time = 0, action = 'fadeToBlack', duration = 0, bStrong = 0, },
            { time = 0.03333334, action = 'placeChar', yPos = -2453.616, entity = 'raz', zPos = 8012.392, xOr = 0, xPos = -8042.456, yOr = -167.6794, zOr = 0, },
            -- turn off banter
            { time = 0.03333334, action = 'dostring', bStrong = 0, text = 'FindScriptObject(\'Tutorial\'):onBanterOff()', },
            { time = 0.06666667, action = 'cutTo', yOr = -35, zPos = 8192, xOr = -20, bStrong = 1, xPos = -8331, zOr = 0, yPos = -2249, fov = 104, },
            -- turn on coach screen
            { time = 0.06666667, action = 'dostring', bStrong = 0, text = 'FindScriptObject(\'Tutorial\'):setPropagandaTexture(1)', },
            { time = 0.1, action = 'fadeIn', duration = 15, bStrong = 0, },
            -- listen
            { time = 0.3, action = 'playAnim', looping = 1, entity = 'raz', speed = 1, blendTime = 5, animName = 'Anims/DartNew/Listen.jan', },
            { time = 0.3, action = 'sleep', duration = 1, },
        }
    }

    Global.EZScene.Scene =
    {
        tLines = 
        {
            {
                cLine = "BBBR018CO",
                -- <DialogText>Hey, what are you staring at?</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 72, },
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
            {
                cLine = "BBBR019CO",
                -- <DialogText>We all have emotional baggage, kid.</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        -- hide
                        { time = 0, action = 'runMemberFunction', entity = 'emobag', argString = nil, functionName = 'makeInvisible', bStrong = 0, },
                        -- look around
                        { time = 0, action = 'playAnim', looping = 1, entity = 'raz', speed = 1, blendTime = 5, animName = 'Anims/DartNew/DartIdle01.jan', },
                        { time = 0, action = 'cutTo', yOr = -136, zPos = 7882, xOr = -8, bStrong = 1, xPos = -8149, zOr = 0, yPos = -2351, fov = 113, },
                        { time = 0, action = 'sleep', duration = 1, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 86, },
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
            {
                cLine = "BBBR020CO",
                -- <DialogText>Why don't you make yourself useful? Sort some of it out while you're in here?</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        -- show
                        { time = 0, action = 'runMemberFunction', entity = 'emobag', argString = nil, functionName = 'makeVisible', bStrong = 0, },
                        { time = 0, action = 'cutTo', yOr = -35, zPos = 8192, xOr = -20, bStrong = 1, xPos = -8331, zOr = 0, yPos = -2249, fov = 104, },
                        { time = 0, action = 'sleep', duration = 1, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        -- idle
                        { time = 1.366667, action = 'playAnim', looping = 1, entity = 'raz', speed = 1, blendTime = 5, animName = 'Anims/DartNew/Listen.jan', },
                        { time = 1.366667, action = 'sleep', duration = 69, },
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
            {
                cLine = "BBBR021CO",
                -- <DialogText>Keep your eyes peeled for a tag that matches. Could be anywhere.</DialogText>
                cDialog = '',
                tPreLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'cutTo', yOr = -62, zPos = 7998, xOr = -18, bStrong = 1, xPos = -5975, zOr = 0, yPos = -1995, fov = 113, },
                        { time = 0, action = 'sleep', duration = 1, },
                    }
                },
                tLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'camPathTo', yOr = -59, zPos = 7887, xOr = -8, decl = 60, xPos = -5730, accel = 30, zOr = 0, yPos = -2027, duration = 210, fov = 113, },
                        { time = 0, action = 'sleep', duration = 185, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'fadeToBlack', duration = 15, bStrong = 0, },
                        { time = 0, action = 'sleep', duration = 14, },
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
            { time = 0, action = 'fadeToBlack', duration = 0, bStrong = 0, },
            { time = 0.03333334, action = 'placeChar', yPos = -2453.616, entity = 'raz', zPos = 8012.392, xOr = 0, xPos = -8042.456, yOr = -167.6794, zOr = 0, },
            -- show
            { time = 0.03333334, action = 'runMemberFunction', entity = 'emobag', argString = nil, functionName = 'makeVisible', bStrong = 0, },
            -- turn off coach projection
            { time = 0.03333334, action = 'dostring', bStrong = 0, text = 'FindScriptObject(\'Tutorial\'):setPropagandaTexture()', },
            -- idle
            { time = 0.06666667, action = 'playAnim', looping = 1, entity = 'raz', speed = 1, blendTime = 5, animName = 'Anims/DartNew/Listen.jan', },
            -- turn banter back on
            { time = 0.06666667, action = 'dostring', bStrong = 0, text = 'FindScriptObject(\'Tutorial\'):onBanterOn()', },
            { time = 0.06666667, action = 'sleep', duration = 3, },
        }
    }

end

