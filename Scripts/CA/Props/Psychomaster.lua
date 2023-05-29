----------------------------------------
--
-- Psychomaster.lua
--
-- Your giant reward for collecting everything.
--

function Psychomaster(Ob)
	if not Ob then
		Ob = CreateObject('Global.Props.SplineFollower')
		Ob.meshName = 'GlobalModels/CO_Collectibles/Co_Figment6x6.plb'
		Ob.dependencies = {
			meshes = {
				'GlobalModels/CO_Collectibles/Co_Figment6x6.plb'
			}
		}

		Ob.waypointPrefix = 'CreditFigment1Wp'
		Ob.speed = 20
	end

	function Ob:onBeginLevel()
		%Ob.Parent.onBeginLevel(self)
		SetEntityFlag(self, ENTITY_ALWAYS_POSE, 1)
		self:setScale(60, 60, 60)
		SplineConformJoints(self, 1)
		--SetScale(self, 100, 30, 100)
		LockMeshEntityLODLevel(self, 1)
		SetEntityFlag(self, ENTITY_DETAIL_CULLING, 0)
		SetSimulationCullDistance(self, 0)
		AddFontTexturedMesh(self,"Everything's Random! Find Disguise and Cake!", 255, 255, 255) -- r,g,b is the text color. This function will take the mesh and texture it with the text you pass in.
	end

	return Ob
end
