-- skrypt wysyłający do bazy influxdb stan kotła gazowego
-- stan kotła pobierany jest z z wejścia Integry, które jest podłączone do 
-- wyjścia w elektronice kotła (De dietrich mcrII)

return  {
   on = {
    timer = { 'every minute' },
    devices = { 14 }
    --httpResponses = { 'trigger' }
    },
    execute = function(domoticz, item)
	if (item.isTimer) then
		if (domoticz.devices(14).nValue == 3) then     -- value 3 to stan aktywny
			domoticz.devices('Stankot').updateCustomSensor(1,1)
			--	print (domoticz.devices('Stankot').rawData)
	    	elseif
			(domoticz.devices(14).nValue == 1) then    -- value 1 tostan nieaktywny
			domoticz.devices('Stankot').updateCustomSensor(0,0)
		--	print (domoticz.devices('Stankot').rawData)
	    end
	domoticz.openURL({
         url = 'http://127.0.0.1:8086/write?db=domoticz&u=domoticz&p=domoticz&precision=ms',
         method = 'POST',
     --    headers = 'application/x-www-form-urlencoded',
     --    callback = 'trigger',
         postData = 'stankotla value=' .. domoticz.devices(67).state
         
      })
    
end
	if (item.isDevice) then
		if (domoticz.devices(14).nValue == 3) then
			domoticz.devices('Stankot').updateCustomSensor(1,1)
		--	print (domoticz.devices('Stankot').rawData)
			elseif
				(domoticz.devices(14).nValue == 1) then
				domoticz.devices('Stankot').updateCustomSensor(0,0)
			--	print (domoticz.devices('Stankot').rawData)
		end
		domoticz.openURL({
         url = 'http://127.0.0.1:8086/write?db=domoticz&u=domoticz&p=domoticz&precision=ms',
         method = 'POST',
     --    callback = 'trigger',
     --    headers = 'application/x-www-form-urlencoded',
         postData = 'stankotla value=' .. domoticz.devices(67).state
      })

    end 
--if (item.isHTTPResponse and item.ok) then
         
 --   domoticz.log('odpalony')
    
  --    end
end
}
