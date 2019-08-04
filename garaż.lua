return {
   on = {
      timer = { 'every 2 minutes' },
      devices = { 
          'Garaż_kontaktron',
          'GarażPIR'
     }
   },
   execute = function(domoticz, item)
        if (domoticz.devices('Garaż_kontaktron').nValue == 1) then
             domoticz.devices('Garaż').switchOff().checkFirst()
        elseif  (item.isTimer and domoticz.devices('GarażPIR').lastUpdate.minutesAgo > 10 and domoticz.devices('Garaż_kontaktron').nValue == 3) then
             domoticz.devices('Garaż').switchOff().checkFirst()
        elseif (item.isDevice and domoticz.time.matchesRule('between 200 minutes before sunset and 30 minutes after sunrise') and domoticz.devices('Garaż_kontaktron').nValue == 3) then
             domoticz.devices('Garaż').switchOn().checkFirst()
        elseif (domoticz.time.matchesRule('between 200 minutes before sunset and 30 minutes after sunrise') and domoticz.devices('Garaż_kontaktron').nValue == 3 and domoticz.devices('GarażPIR').nValue == 3) then
             domoticz.devices('Garaż').switchOn().checkFirst()  
        end
   end
}