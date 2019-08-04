-- Sterowanie lampką podłączoną do Sonoff Basic z softem Tasmota
-- Lampka jest sterowana poprzez czujnik alarmowy PIR podłączony do Integry.
-- Integra jest połączona z Domoticzem poprzez port integracji
-- Skrypt może działać także na fizycznych czujnikach bez Integry itp.
-- Jedynie trzeba zamienić sposób wyzwalania. Opisany poniżej.
-- urządzenia:
-- PIRSypialniazachód - czujnik PIR
-- Lampa - Sonoff Basic jako switch
-- Działanie: Lampa zapala się w godzinach nocnych i działa do dwóch minut po ostatnim naruszeniu PIRa
-- W dzień nie zapala się, ale może być sterowana manualnie.
return {
   on = {
      timer = { 'every 2 minutes at nighttime' },
      -- co dwie minuty przez cała noc
      devices = { 'PIRSypialniazachód' }
      -- czujnik ma sterować lampą tylko w nocy 
      -- PIRSypialniazachód z Integry
      -- Może to być dowolny czujnik PIR
   },
   execute = function(domoticz, item)
      if (item.isTimer and (domoticz.devices('PIRSypialniazachód').lastUpdate.minutesAgo > 2) ) then
         
         domoticz.devices('Lampa').switchOff().checkFirst()
      elseif (domoticz.time.isNightTime and domoticz.devices('PIRSypialniazachód').nValue == 3) then
       -- Dla zwykłego czujnika zamieniamy powyższą linię na: elseif (domoticz.time.isNightTime and item.isDevice and item.active)
         domoticz.devices('Lampa').switchOn().checkFirst()
      end
   end
}