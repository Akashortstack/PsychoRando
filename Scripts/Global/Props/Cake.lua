--
--              "Cake.lua"                
--  
--       from  P S Y C H O N A U T S
--
--  (c) 2004 Double Fine Productions, Inc.  
--            All Rights Reserved.
--        Proprietary and Confidential and Runnin nekkid in the wind
--
--	Andrew Falth

function Cake(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.HeldObject')
		
		Ob.meshName = 'Levels/AS_Asylum/Props/AS_cake.plb'
		Ob.HeldPosX = -9.6;
		Ob.HeldPosY = -0.2;
		Ob.HeldPosZ = -2.88;
		Ob.HeldRotX = 97.13;
		Ob.HeldRotY = 2.691;
		Ob.HeldRotZ = -80.595;
		Ob.homeX = 142   --   90
		Ob.homeY = 3364  --   2600
		Ob.homeZ = -438  --   -860
		Ob.clutchAnim = 'Anims/DartNew/BodyParts/Hold_Cake_ShoulderJALf.jan'
		Ob.collSphereRadius = 50
		Ob.pickupSpriteName = 'PokeylopeCake'
   		Ob.displayName = "/GLZB042TO/"--DIALOG=<<Birthday Cake>>

		--edit removed, default is 'all'
		--Ob.level = 'real'
		
		Ob.dependencies = {
			meshes = {
				'Levels/AS_Asylum/Props/AS_cake.plb',
			},
		}
	end
    
--************************************************************************************************* 

	function Ob:onBeginLevel()
		-- call parent's stateinit
		self:setPosition(self.homeX, self.homeY, self.homeZ)
        %Ob.Parent.onBeginLevel(self)                             
		self:setPosition(self.homeX, self.homeY, self.homeZ)
--		local saw = Global:loadGlobal('SawSheegorIntro')
--		if (saw ~= 1) then
--			self:beNotPickupable()
--		end
	end
	
	function Ob:onPostBeginLevel()
        %Ob.Parent.onPostBeginLevel(self)                             
		local pokey = FindScriptObject('Pokeylope')
		if (pokey) then
			pokey:activateCakeFollowing()
		end
	end
	
	function Ob:onAddedToInventory()
		%Ob.Parent.onAddedToInventory(self)		
		local pokey = FindScriptObject('Pokeylope')
		if (pokey) then
			pokey:activateCakeFollowing()
		end
	end
    
	function Ob:onActivateFromInventory(data, from)
		local target = Global.player:getLookTarget()
		if (not target) then
			Global.player:sayLine("/GLGO047RA/",0, 1, nil, 1, nil, 1)   --DIALOG=<<Man, I can see why pokeylope loves this cake. It looks so moist and delicious.>>
		else
			local pokey = FindScriptObject('Pokeylope',1)
			if (pokey and (target == pokey or pokey:distance(Global.player) < 600)) then
				Global.player:sayLine("/GLGO048RA/",0, 1, nil, 1, nil, 1)   --DIALOG=<<Come on Mr. Pokeylope. Come and get your cake!>>
			end
		end
    end

--************************************************************************************************* 


       
    return Ob
    
end
