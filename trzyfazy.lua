-- Konsolidacja prądu z trzech faz na jeden czujnik.
return {

	on = {
	    devices = { 6 }
	},
	
	execute = function(domoticz, item)
	    
	    local l1 = domoticz.devices(5)  -- PZEM004t faza 1
	    local l2 = domoticz.devices(6)  -- PZEM004t faza 2
	    local l3 = domoticz.devices(7)  -- PZEM004t faza 3
	    local threephase = domoticz.devices(16)  -- wszystkie trzy wartości na jednym wykresie.
	    
	    threephase.updateCurrent(
            	l1.current,
            	l2.current,
            	l3.current
            )
	    
	end
	
}