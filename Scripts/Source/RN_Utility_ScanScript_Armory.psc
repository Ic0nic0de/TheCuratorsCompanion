Scriptname RN_Utility_ScanScript_Armory extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

string property _RoomName Auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto

ObjectReference[] property _Armory_Helms_Displays auto

Formlist property _Armory_Formlist_Displays auto
Formlist property _Armory_Formlist_Enabled auto
Formlist property _Armory_Global_Complete auto
Formlist property _Armory_Global_Count auto
Formlist property _Armory_Global_Total auto
Formlist property _Armory_Message_Notification auto
Formlist property _Armory_Message_Default auto
		
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event onInit()
	
	RegisterForModEvent("TCCScan", "_onScan")
endEvent

;;-- Events ---------------------------------------		

Event onPlayerLoadGame()
	
	RegisterForModEvent("TCCScan", "_onScan")
endEvent
	
;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Received for: " + _RoomName)
	endIf
	
;;----------

	Int _Index = 0
	Int _Length = _Armory_Global_Complete.GetSize()	
	
	While _Index < _Length 
	
		Formlist _DisplayList = _Armory_Formlist_Displays.GetAt(_Index) as Formlist
		Formlist _EnabledList = _Armory_Formlist_Enabled.GetAt(_Index) as Formlist
		GlobalVariable _Complete = _Armory_Global_Complete.GetAt(_Index) as GlobalVariable
		GlobalVariable _Count = _Armory_Global_Count.GetAt(_Index) as GlobalVariable
		GlobalVariable _Total = _Armory_Global_Total.GetAt(_Index) as GlobalVariable	
		Message _Notification = _Armory_Message_Notification.GetAt(_Index) as Message
		Message _Message = _Armory_Message_Default.GetAt(_Index) as Message
		if !_Complete.GetValue()

			_onDisplayCheck(_DisplayList, _EnabledList, _Count)
			
			if _Index == 11
				Int _Index2 = 0
				Int _Length2 = _Armory_Helms_Displays.length
				While _Index2 < _Length2
					ObjectReference formToProcess = _Armory_Helms_Displays[_Index2] As ObjectReference
					if !_EnabledList.HasForm(formToProcess) && !formToProcess.IsDisabled()
						_EnabledList.AddForm(formToProcess)
					elseif _EnabledList.HasForm(formToProcess) && formToProcess.IsDisabled()
						_EnabledList.RemoveAddedForm(formToProcess)	
					endIf
					_Index2 += 1
				endWhile
				_Count.setvalue(_EnabledList.GetSize()) 	
			endIf
			
			if (CheckValueCount1(_Count, _Total, _Complete) && (MCM.ShowSetCompleteVal)) 
				if (MCM.ShowSimpleNotificationVal)
					_Notification.Show()
				else
					_Message.Show()
				endif
			endif
		endIf
		_Index += 1		
	endWhile

;;----------
	
	RN_Scan_Done.Mod(1)
	
	If MCM.DevDebugVal
		DBMDebug.Log(GetOwningQuest(), "TCC: Scan Event Completed for: " + _RoomName)
	endIf
endEvent

