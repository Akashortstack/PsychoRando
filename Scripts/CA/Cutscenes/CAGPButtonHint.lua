-- <LuaCutsceneDataFile/>
EZScenes = EZScenes or {}
EZScenes["CS_CAGPButtonHint"] = function()

    --[[ --edit Removed, hatch is always open

    Global.EZScene = {}

    -- <actors>
    -- <actor name="global" type="Global" />
    -- <actor name="camera" type="Camera" />
    -- <actor name="raz" type="Actor" />
    -- </actors>
    Global.EZScene.Actors =
    {
    }

    Global.EZScene.BeginScene =
    {
        tActions =
        {
            { time = 0, action = 'placeChar', yPos = 1736.221, entity = 'raz', zPos = -5752.564, xOr = 0, xPos = 6135.699, yOr = 150.9619, zOr = 0, },
            { time = 0, action = 'cutTo', yOr = 107, zPos = -5959, xOr = -21, bStrong = 1, xPos = 6511, zOr = 0, yPos = 1921, fov = nil, },
            { time = 0, action = 'sleep', duration = 1, },
        }
    }

    Global.EZScene.Scene =
    {
        tLines = 
        {
            {
                cLine = "CADD005RA",
                -- <DialogText>Hmm. Looks like one of the buttons is missing.</DialogText>
                cDialog = '',
                cActor = 'raz',
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
                        { time = 0, action = 'camPathTo', yOr = 113, zPos = -6002, xOr = -41, decl = 0, xPos = 6355, accel = 0, zOr = 0, yPos = 1827, duration = 150, fov = nil, },
                        { time = 0, action = 'sleep', duration = 104, },
                    }
                },
                tPostLine =
                {
                    tActions =
                    {
                        { time = 0, action = 'sleep', duration = 60, },
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
            { time = 0, action = 'sleep', duration = 1, },
        }
    }
]]
end

