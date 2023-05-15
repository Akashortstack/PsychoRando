function ObjList(class)
	local print_ent = function(ent)
		local x,y,z = ent:getPosition()
		local ox,oy,oz = ent:getOrientation()
		GamePrint(format('%s %s Position X,Y,Z %d %d %d Orientation OX,OY,OZ %d %d %d', ent.Type, ent.Name, x, y, z, ox, oy, oz))
	end
	GamePrint(format('Listing objects of class %s', class));
	foreach_entity_oftype(class, print_ent, nil, 1)
	GamePrint(format('!!!!!!!!!!!!!!!!!'))
end

--Objects found in most Real Levels
ObjList('global.collectibles.PSIChallengeCard')
ObjList('global.collectibles.PSIChallengeMarker')
ObjList('global.collectibles.BrainJar')
ObjList('ca.props.ScavengerHuntItem')

--Objects found in most Mental Levels
ObjList('global.collectibles.EmotionalBaggageTag')
ObjList('global.collectibles.EmotionalBaggage')

ObjList('global.collectibles.MaxLivesUp')
ObjList('global.collectibles.MaxAmmoUp')
ObjList('global.collectibles.OneUp') --not sure if these would be randomized?
--ObjList('global.collectibles.Cobweb')


--Other Objects are more level specific, need to make a list and look all at once
	--EX. ObjList('mm.props.PropSign') for the Sign prop in MM