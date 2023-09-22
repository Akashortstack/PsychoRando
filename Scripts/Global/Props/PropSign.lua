function PropSign(Ob)
	if not Ob then
		--edit to make Global
		Ob = CreateObject('global.Props.PropBase')
		Ob.meshName = 'Characters/CharacterProps/MM_Sign.plb'
		
		-- set up holding
		Ob.HeldPosX = 0 -- Editable
		Ob.HeldPosY = 0 -- Editable
		Ob.HeldPosZ = 0 -- Editable
		Ob.HeldRotX = 0 -- Editable
		Ob.HeldRotY = 0 -- Editable
		Ob.HeldRotZ = 0 -- Editable

		--edit to make name appear in all levels. *STILL NEEDS LOCALIZATION*
		Ob.displayName = "Sign"	--DIALOG=<<Sign>>

		Ob.pickupSpriteName = 'MM_Sign'
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_MM_Sign.jan' -- Editable
		Ob.collSphereRadius = 30 -- Editable
		Ob.bAutoSelect = 1
		Ob.GmanPropName = 'Sign'
		-- for moving while on clairvoyance
		Ob.bClairvoyancePlayerControl = 1
		Ob.ownerName = 'GmanSign1'
		
		-- set up anims
		Ob.startAnim = 'UseSign_start'
		Ob.loopAnim = 'UseSign_loop'
        
		-- timer setup for playing custom prop anim
		Ob.PLAY_ANIM_TIMER = '8020'
        
		Ob.propLine = "/MMAJ000RA/"--DIALOG=<<I am on the road crew. This is my stop sign.>>
	end

--  I N I T  **************************************************************************************
    
	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
	end
	
--**************************************************************************************************
	
	function Ob:onAddedToInventory(data, from)
		%Ob.Parent.onAddedToInventory(self, data, from)
		--Got the stop sign, now find a rose.
		if (self.bReincarnated ~= 1) then
			if (GetCurrentLevelName() == 'MMI1') then
				Global.cutsceneScript:enqueueAction(4)				
			end
		end

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)
		
	end
	
--**************************************************************************************************--**************************************************************************************************

	function Ob:onActivateFromInventory(data, from)
		-- this function overrides PropBase's function, so we want to call PropBase's parent here
		%Ob.Parent.Parent.onActivateFromInventory(self, data, from)
		-- say the prop line when you activate without a look entity
        if (not GetLookTarget(Global.player) and Global:load('bSignGmenClairvoyanceCluePlayed') == 1) then 
			Global.player:sayLine(self.propLine, 0, 1, nil, 1) 
		end
	end
	
--**************************************************************************************************

	function Ob:onSelected()
		if (self.propLine and Global.cutsceneScript.cutscenePlaying ~= 1 and Global:load('bSignGmenClairvoyanceCluePlayed') == 1) then
			Global.player:sayLine(self.propLine, 0, 1, nil, 1)
		end

		self:createTimer(self.playAnimTime, self.PLAY_ANIM_TIMER)
	end

--**************************************************************************************************


	return Ob
end


