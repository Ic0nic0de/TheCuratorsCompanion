scriptname RN_Utility_autoScan extends quest

RN_Utility_MCM property RN_MCM auto

RN_Utility_Script property RN_Utility auto

globalvariable property DBM_SortWait auto

Int _ScanInt

Event Register()

	UpdateInt(RN_MCM._ScanInterval)	
endEvent

Event UpdateInt(Int Interval)
	
	UnregisterForUpdate()

	_ScanInt = Interval * 60
	
	if _ScanInt != 0
		RegisterforsingleUpdate(_ScanInt)
		;;Debug.Notification("Registered for update in " + _ScanInt + " seconds")
	else
		;;Debug.Notification("Registered update Disabled")
	endIf
endEvent

Event OnUpdate()
	
	if DBM_SortWait.getvalue() || !RN_MCM.autoScanVal || Game.GetPlayer().IsInCombat()
		If RN_MCM.DevDebugVal
			DBMDebug.Log(self, "TCC: Autoscan unable to start " + "Wait = " + DBM_SortWait.Getvalue() +  _ScanInt + RN_MCM.autoScanVal)
		endIf
		
		UpdateInt(RN_MCM._ScanInterval)	
	else
		RN_utility.ScanMuseum()
		UpdateInt(RN_MCM._ScanInterval)	
	endif
endEvent


State DISABLED

	Event OnUpdate()
	endEvent
endState

