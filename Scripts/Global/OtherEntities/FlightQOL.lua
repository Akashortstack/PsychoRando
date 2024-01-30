function FlightQOL()
    -- C O N S T R U C T O R
        local Ob = CreateObject('Prop','FlightQOL')
        Ob.dx = 0
        --adjusts vertical velocity value
        Ob.dy = 1200

        Ob.dz = 0
        --  sector thrust toggle switch
        Ob.trigger = 0
    
        function Ob:onBeginLevel()
            %Ob.Parent.onBeginLevel(self)
            self.player = FindScriptObject('Dart')
        end
        
        function Ob:onPostBeginLevel()
            %Ob.Parent.onBeginLevel(self)
			local settings = FindScriptObject('RandoSeed')
            if settings.easyflight == TRUE then
                self.trigger = 1
                self:setState(self.stateFloat)
            end
        end

        function Ob:stateFloat()        
            if ( (self.trigger == 1) and (QueryPlayerPhysicsState(PHYSICSSTATE_PSIFLOAT) == 1) ) then
                self.vx , self.vy , self.vz = GetVelocity(self.player)
                local dt = GetFrameSecs()
                self.vy = self.vy + self.dy * dt
                SetVelocity(self.player , self.vx, self.vy, self.vz)
            end
        
        end
    
        return Ob
    end