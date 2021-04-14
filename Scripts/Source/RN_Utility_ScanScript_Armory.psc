Scriptname RN_Utility_ScanScript_Armory extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

int property _SectionToScan auto

string property _RoomName Auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

Formlist property _Armory_Formlist_Displays auto
Formlist property _Armory_Formlist_Enabled auto
Formlist property _Armory_Global_Complete auto
Formlist property _Armory_Global_Count auto
Formlist property _Armory_Global_Total auto
Formlist property _Armory_Message_Notification auto

Formlist _DisplayList
Formlist _EnabledList
GlobalVariable _Complete
GlobalVariable _Count
GlobalVariable _Total
Message _Notification
	
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event onInit()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
	Setup()
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()
	
	RegisterForModEvent("TCCScan", "_onScan")
	RegisterForModEvent("DBM DisplayEvent", "_OnDisplayEventReceived")
	Setup()
endEvent

;;-- Events ---------------------------------------	

Event _OnDisplayEventReceived(Form fSender, Form DisplayRef, Form ItemRef, Bool EnableState)

	if !_Complete.GetValue()
		ObjectReference Disp = DisplayRef as ObjectReference
		if _DisplayList.HasForm(Disp)
			if EnableState
				_EnabledList.AddForm(Disp)
				if MCM.advdebug
					TCCDebug.Log("Armory Scan Script [" + _RoomName  + "] - Updated display " + Disp.GetName() + Disp, 0)
				endif
				_Count.Mod(1)
			else
				if _EnabledList.HasForm(Disp)
					_EnabledList.RemoveAddedForm(Disp)
					if MCM.advdebug
						TCCDebug.Log("Armory Scan Script [" + _RoomName  + "] - Removed display " + Disp.GetName() + Disp, 0)
					endif
					_Count.Mod(-1)
				endIf
			endIf
		endif

		if (CheckValueCount1(_Count, _Total, _Complete) && (MCM.ShowSetCompleteVal)) 
			_Notification.Show()
		endif
	endIf
endEvent
	
;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender)

	RN_Scan_Registered.Mod(1)
	
	if MCM.advdebug
		TCCDebug.Log("Scan Event Received for: " + _RoomName)
	endif
	
	if !_Complete.GetValue()
	
		_onDisplayCheck(_DisplayList, _EnabledList, _Count)
		
		if (CheckValueCount1(_Count, _Total, _Complete) && (MCM.ShowSetCompleteVal)) 
			_Notification.Show()
		endif
	endIf
	
	RN_Scan_Done.Mod(1)
	if MCM.advdebug
		TCCDebug.Log("Scan Event Completed for: " + _RoomName)
	endif
endEvent

Function Setup()

	_DisplayList = _Armory_Formlist_Displays.GetAt(_SectionToScan) as Formlist
	_EnabledList = _Armory_Formlist_Enabled.GetAt(_SectionToScan) as Formlist
	_Complete = _Armory_Global_Complete.GetAt(_SectionToScan) as GlobalVariable
	_Count = _Armory_Global_Count.GetAt(_SectionToScan) as GlobalVariable
	_Total = _Armory_Global_Total.GetAt(_SectionToScan) as GlobalVariable	
	_Notification = _Armory_Message_Notification.GetAt(_SectionToScan) as Message
endFunction
