-- <LuaCutsceneDataFile/>
EZScenes = EZScenes or {}
EZScenes["CS_EmoTagTutorial"] = function()

    --[[Global.EZScene = {}

    -- <actors>
    -- <actor name="global" type="Global" />
    -- <actor name="camera" type="Camera" />
    -- <actor name="raz" type="Actor">
    -- <resources>
    -- <resource name="Listen" path="Anims/DartNew/Listen.jan" type=".JAN" />
    -- </resources>
    -- </actor>
    -- </actors>
    Global.EZScene.Actors =
    {
        coach = { cScriptObject = 'Coach', cCODE = 'CO' },
    }

    Global.EZScene.BeginScene =
    {
        tActions =
        {
            { time = 0, action = 'fadeToBlack', duration = 0, bStrong = 0, },
            { time = 0.03333334, action = 'placeChar', yPos = -2494.152, entity = 'raz', zPos = 8086.702, xOr = 0, xPos = -6509.942, yOr = 143.1134, zOr = 0, },
            -- turn on coach screen
            { time = 0.03333334, action = 'dostring', bStrong = 0, text = 'FindScriptObject(\'Tutorial\'):setPropagandaTexture(1)', },
            { time = 0.06666667, action = 'cutTo', yOr = -80, zPos = 8040, xOr = -6, bStrong = 1, xPos = -6765, zOr = 0, yPos = -2307, fov = 104, },
            -- turn off banter
            { time = 0.06666667, action = 'dostring', bStrong = 0, text = 'FindScriptObject(\'Tutorial\'):onBanterOff()', },
            -- idle
            { time = 0.06666667, action = 'playAnim', looping = 1, entity = 'raz', speed = 1, blendTime = 5, animName = 'Anims/DartNew/Listen.jan', },
            { time = 0.1, action = 'fadeIn', duration = 15, bStrong = 0, },
            { time = 0.1, action = 'camPathTo', yOr = -83, zPos = 8000, xOr = 1, decl = 60, xPos = -6582, accel = 30, zOr = 0, yPos = -2355, duration = 180, fov = 104, },
            { time = 0.1, action = 'sleep', duration = 7, },
        }
    }

    Global.EZScene.Scene =
    {
        tLines = 
        {
            {
                cLine = "BBBS023CO",
                -- <DialogText>There it is! Now-You will pick up that tag and you will put it on that bag you just found.</DialogText>
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
                        { time = 0, action = 'sleep', duration = 185, },
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
            -- Unless you'd rather just drop and give me 20 right now.
            { time = 0.03333334, action = 'dostring', bStrong = 0, text = 'FindScriptObject(\'Tutorial\'):onEnteredTriggerVolume(\'tv_emoTag\', Global.player)', },
            { time = 0.03333334, action = 'sleep', duration = 1, },
        }
    }

end

