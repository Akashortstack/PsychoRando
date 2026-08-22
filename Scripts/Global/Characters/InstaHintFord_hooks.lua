function InstaHintFord_hooks(Ob)

    -- creates text for Ford's response based on RandoSeed settings
    function Ob:makeFordGoalResponse(responseType, value)
        --get seed settings
        local seedsettings = fso('RandoSeed', 'Randoseed')
        local responses = {
            text = {},
            voice = {}
        }

        if seedsettings.beatoleander == TRUE then -- beat Oleander Brain Tank
            responses.text[1] =
                "You need to stop Coach Oleander! " ..
                "Get to the top of the Asylum, quick!"
            responses.voice[1] = "/GLAJ014FO/" -- DIALOG=<<What are we doing down here? We need to be up in the tower, trying to free your girlfriend!>>
        else -- brainhunt MUST be TRUE
            responses.text[1] =
                "You need to find " .. seedsettings.brainsrequired ..
                " stolen brains and bring them back to me for recranialization!"
            responses.voice[1] = "/GLAJ006FO/" -- DIALOG=<<And keep your eyes peeled for stolen brains.>>
        end

        -- if both are true, add a second response
        if seedsettings.beatoleander == TRUE and seedsettings.brainhunt == TRUE then
            responses.text[2] =
                "You also need to find " .. seedsettings.brainsrequired ..
                " stolen brains and bring them back to me for recranialization!"
            responses.voice[2] = "/GLAJ006FO/" -- DIALOG=<<And keep your eyes peeled for stolen brains.>>

            if seedsettings.requireMC == TRUE then -- every setting on, add third dialogue for Meat Circus
                responses.text[3] = "After that, chase little Oly into that big tent in the Meat Circus!"
                responses.voice[3] = "/GLAT000FO/"--DIALOG=<<Follow that kid! Don\'t let him get hurt while your brains are connected!>>
            end

        elseif seedsettings.requireMC == TRUE then -- only one goal set, add second dialogue for Meat Circus
            responses.text[2] = "After that, chase little Oly into that big tent in the Meat Circus!"
            responses.voice[2] = "/GLAT000FO/"--DIALOG=<<Follow that kid! Don\'t let him get hurt while your brains are connected!>>
        end

        return responses[responseType] and responses[responseType][value] or nil
    end

    --Creates a forced tutorial textbox when dialog is chosen
    function Ob:forcedTutorialTextbox(line)
        Global:saveGlobal('bDisableTutorialBoxes', 0)
        Global.levelScript:addTutorialBox(line)
        Global:saveGlobal('bDisableTutorialBoxes', 1)
    end

    --FULL FUNCTION OVERRIDE
    --Add Custom Archipelago responses to the Bacon
    function Ob:makeDialogTreeTable()
		local table = {}
		table.tResponse = {}
		table.tInitialTree = {}
		
		local maintree = table.tInitialTree
		
		self:makeNewPsiPowerTreeTable( table )

        -- Make return to HQ first option for easy teleporting
        if Global:loadGlobal('bFordReturnToCAJADisabled') ~= 1 then	
			tinsert(maintree, {
					Name = 'node1_20',
					line = "/GLZA016TO/",--DIALOG=<<I need to regroup back at HQ.>>
					voice = "/GLAE001RA/"--DIALOG=<<I need to regroup back at HQ.>>
				}
			)
	
			table.tResponse.node1_20 = {
				{
					voice = "/GLAE002FO/",--DIALOG=<<Affirmative. Prepare for extraction.>>
					postCallback = self.loadCaja
				}
			}
		end

        -- Put the Archieplago Goal setting next
		local randoGoalText1 = self:makeFordGoalResponse('text', 1)
		local randoGoalText2 = self:makeFordGoalResponse('text', 2)
		local randoGoalText3 = self:makeFordGoalResponse('text', 3)
        local randoGoalVoice1 = self:makeFordGoalResponse('voice', 1)
        local randoGoalVoice2 = self:makeFordGoalResponse('voice', 2)
        local randoGoalVoice3 = self:makeFordGoalResponse('voice', 3)

        -- Raz's Dialog in the tree
        tinsert( maintree, {
				Name = 'node1_100',
				line = "Agent Cruller. What is my Archipelago Goal for today?", -- CUSTOM TEXT GOES HERE
                voice = "" -- this NEEDS a voice value passed or it breaks, but will overwrite Custom Text if used
                        -- making it blank works for now
				--voice = "/GLAE000RA/"--DIALOG=<<Agent Cruller. Do you have any advice on the current situation?>>
			}
		)

        -- Ford's Responses
        table.tResponse.node1_100 = {}

        if randoGoalText1 then
            tinsert(table.tResponse.node1_100, {
                voice = randoGoalVoice1, preCallback = self.forcedTutorialTextbox, preCallbackArg = randoGoalText1
            })
        end

        if randoGoalText2 then
            tinsert(table.tResponse.node1_100, {
                voice = randoGoalVoice2, preCallback = self.forcedTutorialTextbox, preCallbackArg = randoGoalText2
            })
        end

        if randoGoalText3 then
            tinsert(table.tResponse.node1_100, {
                voice = randoGoalVoice3, preCallback = self.forcedTutorialTextbox, preCallbackArg = randoGoalText3
            })
        end
		
		local levelhint = self:getLevelHintResponse()
		if( levelhint ~= nil ) then
			local nHintMaxIndex = getn(levelhint)
			if nHintMaxIndex > 0 then
				levelhint[nHintMaxIndex].postCallback = self.CheckHintAchievement
			end
			tinsert(maintree, {
					Name = 'node1_10',
					line = "/GLZA005TO/",--DIALOG=<<Agent Cruller. Do you have any advice on the current situation?>>
					voice = "/GLAE000RA/"--DIALOG=<<Agent Cruller. Do you have any advice on the current situation?>>
				}
			)

			table.tResponse.node1_10 = levelhint
		end
		
		self:makeHostileTreeTable( table, maintree )
		
		if Global:loadGlobal('bCanChangePSIBallColor') == 1 and Global.levelScript:getLevelPrefix() ~= 'BV' then
			self:makePsiBallTreeTable( table, maintree )
		end
		
		tinsert( maintree, {
				Name = 'node1_3',
				line = "/GLZA021TO/",--DIALOG=<<Nothing more to report at this time.>>
				voice = "/GLAE009RA/",--DIALOG=<<Nothing more to report at this time.>>
				bExitNode = 1		
			}
		)

		table.tResponse.node1_3 = {
			{
				voice = "/GLAE010FO/",--DIALOG=<<Cruller out.>>
				postCallback = self.disappear
			}
		}	
	
		table.sCamString = 'Global.levelScript.cutsceneScript:oneShot(Global.player, 180, 100, 140, 10, 10)'

		return table
	end
    

end