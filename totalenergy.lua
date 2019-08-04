-- Sumowanie zużycia kilowatogodzin z trzech faz do jednego licznika
return {

	on = {
	    devices = { 11 }
	},
	
	execute = function(domoticz, item)
	    
	    local l1Power = domoticz.devices(11)  -- PZEM004t faza 1
	    local l2Power = domoticz.devices(12)  -- PZEM004t faza 2
	    local l3Power = domoticz.devices(26)  -- PZEM004t faza 3
	    local totalPower = domoticz.devices(15)  -- suma ze wszystkich
	    
	    totalPower.updateElectricity(
            	l1Power.WhActual + l2Power.WhActual + l3Power.WhActual,
            	l1Power.WhTotal + l3Power.WhTotal + l2Power.WhTotal
            )
	    
	end
	
}