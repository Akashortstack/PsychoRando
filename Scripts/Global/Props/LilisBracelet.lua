--
--              "LilisBracelet.lua"                
--  
--       from  P S Y C H O N A U T S
--
--  (c) 2004 Double Fine Productions, Inc.  
--            All Rights Reserved.
--        Proprietary and Confidential and Runnin nekkid in the wind
--
--	Andrew Falth

function LilisBracelet(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		
		Ob.meshName = 'GlobalModels/Objects/HeldObjects/AS_LilliBracelet.plb'
		Ob.HeldPosX = 7.2;
		Ob.HeldPosY = -2.7;
		Ob.HeldPosZ = 15.3;
		Ob.HeldRotX = -15.592;
		Ob.HeldRotY = -43.353;
		Ob.HeldRotZ = -34.471;
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_PinchPalmDn_ArmLf.jan'
		--edit removed, default is 'all'
		--Ob.level = 'real'
		Ob.collSphereRadius = 50
		Ob.pickupSpriteName = 'LiliBracelet'
   		Ob.displayName = "/GLZB045TO/"--DIALOG=<<Lili\'s Bracelet>>

		Ob.dependencies = {
			meshes = {
				'GlobalModels/Objects/HeldObjects/AS_LilliBracelet.plb',
			},
		}
	end
    
--************************************************************************************************* 

	function Ob:onBeginLevel()
		if Global.levelScript.Type ~= 'as.ASLB' then
			-- this is hack to let the clairvoyance eyeball pop up in the inventory menu in levels where lili is Not
			-- it doesnt actually use Dart anywhere as a clairvoyance target
			self.ClairvoyanceTarget = 'Dart'
			self.ownerName = 'Dart' 
		else
			self.ClairvoyanceTarget = 'Lili'
			self.ownerName = 'Lili' 
		end	

        %Ob.Parent.onBeginLevel(self) 
		--edit make bigger?
		self:setScale(1.5, 1.5, 1.5) 
                            
	end
	
	--edit
	function Ob:addToInventory(bHoldImmediately, bSilent)
        if (self.rMovementThread) then
			self.rMovementThread:killSelf()
		end
		self:beNotPickupable()
		self.player:addToInventory(self, (self.bAutoSelect == 1 and 1) or bHoldImmediately, bSilent)
		--self:setVelocity(0, 0, 0)

		--edit make a sound!
		PlaySound(nil, LoadSound('YouWin'))

		--edit sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)

		--edit save found
		Global:saveGlobal('bGotLiliBracelet', 1)

		self:setState(nil)
	end
	
	function Ob:stateClairvoyance()
		if Global.levelScript.Type ~= 'as.ASLB' then
			self:playVideo('cutScenes/prerendered/aslv.xmv')			
--			self:cancelClairvoyance()
			self:setState(nil)
		else
			local lili = FindScriptObject('Lili')
			if (lili ~= nil) then
				Global.player:setClairvoyanceTarget(lili)
				self:setState(nil)
			end
		end
	end
	       
    function Ob:onClairvoyance(data, from)
		self:setState('Clairvoyance')
    end 
	
	function Ob:onActivateFromInventory()
		local target = GetLookTarget(Global.player)
		if (target and (is_subclass_of(target, 'Global.Characters.ActionActor') or is_subclass_of(target, 'Actor')) and target.Name ~= 'Lili') then
			Global.player:sayLine("/GLGO034RA/", 0, 1, nil, 1, nil, 1)  --DIALOG=<<I don\'t want to show anyone this bracelet. People will think we\'re totally boyfriend-girlfriend.>>
		else
			Global.player:sayLine("/GLGO033RA/", 0, 1, nil, 1, nil, 1)  --DIALOG=<<Hm. I don\'t think I want to put this bracelet on just yet. I think Lili and I need to talk about our relationship first.>>
		end									 
	end
																 
    return Ob
    
end
