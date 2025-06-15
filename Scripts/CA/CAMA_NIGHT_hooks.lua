function CAMA_NIGHT_hooks(Ob)
    local onPostBeginLevel_original = Ob.onPostBeginLevel
    function Ob:onPostBeginLevel()
        %onPostBeginLevel_original(self)
        --this Cougar spawns so close to the spawn point from CAGP, you get attacked instantly
        --move this Bastard
		local coug = fso('Cougar2')
		if coug ~= nil then
			coug:setPosition(-1126, 3607, 9542)
		end
    end
end