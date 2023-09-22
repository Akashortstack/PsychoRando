function AS_CrowFeather(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		Ob.meshName = 'GlobalModels/Objects/HeldObjects/AS_CrowFeather.plb' -- Editable
		Ob.heldscale = 1
		Ob.needstarget = 1
		Ob.usedFromInterface = 1
		Ob.HeldPosX = 11.8;
		Ob.HeldPosY = 0.4;
		Ob.HeldPosZ = -2.6;
		Ob.HeldRotX = 9.631;
		Ob.HeldRotY = -9.24;
		Ob.HeldRotZ = -25.819;
		-- init for dropping the feather in asgr
		Ob.dropX = 0
		Ob.dropY = 0
		Ob.dropZ = 0
		Ob.dropTime = 0
		--Ob.proximityLine = 'Press /YButton/ to pick up feather.'
		
		--edit name, needs localization
   		Ob.displayName = "Crow Feather"--DIALOG=<<Crow Feather>>
		Ob.pickupSpriteName = 'CrowFeather'
		Ob.testX = 15
		Ob.testY = 780
		Ob.testZ = 5445
		Ob.rotY = -35
		Ob.clairRotX = -25		
	
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_PinchPalmUp_ArmLf.jan'
		--edit removed
		--Ob.level = 'real'
		
		Ob.dependencies = {
			meshes = {
				'GlobalModels/Objects/HeldObjects/AS_CrowFeather.plb',
			},
		}
	end
    
--************************************************************************************************* 

	function Ob:onPreBeginLevel()
		self.ClairvoyanceTarget = nil
		%Ob.Parent.onPreBeginLevel(self)
	end
	
	function Ob:onBeginLevel()
		-- call parent's stateinit
		%Ob.Parent.onBeginLevel(self)
		SetActionTable(self, 'Anims/AS_Feather/Feather.asd')
		
		self.bDropped = 0
		
		self:loadMesh(self.meshName)
		--self:setEntityInterestLevel(2)	-- no need for this - the held object will take care of it
		SetMaxViewDistance(self,400)
		SetEntityFlag(self,ENTITY_DRAWSHADOW,0)
		SetEntityCollideSphere(self, 1)
		SetPhysicsFlag(self, PHYSICS_NOPHYSICS, 1)
		SetPhysicsFlag(self, PHYSICS_COLLIDEE, 1)
		SetPhysicsFlag(self, PHYSICS_COLLIDER, 0)
	end                                               

	function Ob:onPostBeginLevel()
		%Ob.Parent.onPostBeginLevel(self)
		if GetCurrentLevelName() == 'CAGP' then
			self:addClairvoyanceTarget( fso('CA_crow') )
			if (self.player:isInInventory(self.Name) ~= 1) then
				self:bePickupable(1)
			end
		elseif Global.levelScript.Type == 'as.ASLB' then
			self:addClairvoyanceTarget( fso('Cage') )
		end		
	end

--*************************************************************************************************
	--edit remove to allow pickup
	--[[function Ob:bePickupable(bLocal)
		if bLocal then %Ob.Parent.bePickupable(self) end
	end]]

	--edit sendMessage to Dart
	function Ob:onAddedToInventory()
		%Ob.Parent.onAddedToInventory(self)		
		--sendMessage to Dart
		self:sendMessage(Global.player, 'RandoProp', self.Name, 1)
	end

	function Ob:stateDrop()
		if self.bDropped == 1 then
			self:setState(nil)
			return nil
		end
		self:setNewAction('Fall')
		-- Temporarily just setting the position until I figure out why it won't move.  Used to be a moveToPos.
		self:setPosition(self.dropX, self.dropY, self.dropZ-10)
		self:bePickupable(1)
		self.bDropped = 1
		self:setState(nil)
	end
    
--************************************************************************************************* 
-- MESSAGE HANDLERS
--*************************************************************************************************

	function Ob:onActivate(data, from)
		if (GetEntityFlag(self, ENTITY_VISIBLE) < 1) then
			return nil
		end
		self:setNewAction('Vertical')
		self:addToInventory()
	end

--*************************************************************************************************

	function Ob:addClairvoyanceTarget( crow )
		self.ClairvoyanceTarget = crow
		--tinsert( self.ClairvoyanceTargets, crow )
	end
	
	function Ob:onClairvoyance(data, from)
		local owner = self.ClairvoyanceTarget
		if owner and Global.levelScript.Type == 'as.ASGR' then
			self.ownerName = self.ClairvoyanceTarget.Name
			owner:setPosition(15, 780, 5445)
			owner.lookTarget = fso('BrainJarJT') or fso('BrainJarFranke') or fso('BrainJarBobby') or Global.player
			if( owner.lookTarget == Global.player ) then
				self.clairFollows = 1
			end
		elseif owner and GetCurrentLevelName() == 'CAGP' then
			self.ownerName = self.ClairvoyanceTarget.Name
			owner.clairOffY = 15		
			owner.clairRotY = 205		
			owner.clairRotZ = -45		
		elseif owner and Global.levelScript.Type == 'as.ASCO' then
			self.ownerName = self.ClairvoyanceTarget.Name
			owner.lookTarget = fso('BrainJarChops') or fso('BrainJarMaloof') or fso('BrainJarChloe') or Global.player
			if( owner.lookTarget.Name == 'BrainJarChops' ) then
				owner:setPosition( -1447.7, 1898.3, 1114.4 )
			elseif( owner.lookTarget.Name == 'BrainJarMaloof' ) then
				owner:setPosition( 1092.5, 1570.5, 976.6 )
			elseif( owner.lookTarget.Name == 'BrainJarChloe' ) then
				owner:setPosition( 743.0, 1590.1, -1158.4 )
			else
				owner:setPosition( 2135.7, 1256.8, 404.4 )
				self.clairFollows = 1
			end
		end
		%Ob.Parent.onClairvoyance(self, data, from)
	end 

--*************************************************************************************************

	function Ob:onActivateFail(data, from)
		Global.player:sayLine("/ASAF000RA/", 0, 1, nil, 1, nil, 1)--DIALOG=<<I don\'t wanna tickle that right now.>>
	end

--************************************************************************************************* --DIALOG=<<I don\'t wanna tickle that right now.>>

	function Ob:onDrop()
		self:setState('Drop')
	end

--************************************************************************************************* 
   
   	function Ob:onActivateFromInventory(data, from)
		if (not self.state_name) then
			self:setState('Tickle')
		end
	end

	function Ob:stateTickle()
		LoadPriorityAnim(Global.player, 'Anims/Dartnew/FeatherTickle.jan', 2, 0.2, 0)
		self:sleep(0.4)
		self:setState(nil)
	end
	
	function Ob:endStateTickle()
		UnLoadPriorityAnim(Global.player, 2, 0.2)
		Global.player:setClutchAnim()
		self:setState(nil)
	end
 
	return Ob
    
end
