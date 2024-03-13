function FlightQOL()
        local Ob = CreateObject('Prop','FlightQOL')
        --adjusts vertical velocity value
        --need to adjust all three to account for MM and SA gravity changes
        Ob.dx = 1200
        Ob.dy = 1200
        Ob.dz = 1200

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
            else
                self:killSelf()
            end
        end

        function Ob:stateFloat()        
            if self.trigger == 1 and QueryPlayerPhysicsState(PHYSICSSTATE_PSIFLOAT) == 1 then
                local vx, vy, vz = GetVelocity(self.player)
                local dt = GetFrameSecs()
                -- Get gravity direction
                local gx, gy, gz = GetEntityGravityDir(self.player) 
                -- Calculate the gravity vector
                local gravityVector = {
                    gx * self.dx,
                    gy * self.dy,
                    gz * self.dz
                }
                -- Adjust the velocity based on the gravity vector
                vx = vx + gravityVector[1] * dt
                vy = vy + gravityVector[2] * dt
                vz = vz + gravityVector[3] * dt
                -- Set the new velocity
                SetVelocity(self.player, vx, vy, vz)
            end
        
        end
    
        return Ob
    end

    