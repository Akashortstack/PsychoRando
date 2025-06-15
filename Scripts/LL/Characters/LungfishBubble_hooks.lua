--[[Controls Faster Lungfish Boss, speeding up the auto-scroller sections]]

function LungfishBubble_hooks(Ob)

    local startSplineMove_original = Ob.startSplineMove
    --state after defeating the Lungfish Boss
    function Ob:startSplineMove()

        %startSplineMove_original(self)
        --make it faster! Original is 1
		self.splineSpeed = 1.5
    end

    --FULL FUNCTION OVERRIDE
    function Ob:continueSpline()
		--edit from (self, 1)
	    SplineSpeedRel( self, self.splineSpeed)
		self.bMoving = 1		
	end

    --FULL FUNCTION OVERRIDE
    function Ob:onEnteredTriggerVolume(data,from)			  
		if (from == Global.player and self.bossMain.phase == 2 and strsub(data, 1,11) == 'tv_slowPath' and self.bossMain.waterArms.state_name ~= 'RespawnRaz') then
			GamePrint("ENTERING SLOW ZONE")
			--go faster! original is 0.5
			self.splineSpeed = 1
			SplineSpeedRel( self, self.splineSpeed)
		end
	end

    --FULL FUNCTION OVERRIDE
    function Ob:onExitedTriggerVolume(data,from)			  
		if (from == Global.player and self.bossMain.phase == 2 and strsub(data, 1,11) == 'tv_slowPath' and self.bossMain.waterArms.state_name ~= 'RespawnRaz') then
			GamePrint("EXITING SLOW ZONE")
			--edit go faster! original is 1
			self.splineSpeed = 1.5
			SplineSpeedRel( self, self.splineSpeed)
		end
	end

end