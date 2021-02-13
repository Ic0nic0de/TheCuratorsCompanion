Scriptname RN_Utility_ScanScript extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

int property _SectionToScan auto

string property _RoomName auto

ObjectReference[] property _Armory_Helms_Displays auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto
globalvariable property RN_SupportedCreationCount auto
globalvariable property RN_SafeouseContent_Installed auto

Formlist property _Museum_Formlist_Merged auto
Formlist property _Museum_Formlist_Enabled auto
Formlist property _Museum_Global_Complete auto
Formlist property _Museum_Global_Count auto
Formlist property _Museum_Global_Total auto
Formlist property _Museum_Message_Notification auto
Formlist property _Museum_Message_Default auto

Formlist _DisplayList
Formlist _EnabledList
GlobalVariable _Complete
GlobalVariable _Count
GlobalVariable _Total
Message _Notification
Message _Message

Bool bExclude
	
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

	If _SectionToScan == 8 && !RN_SupportedCreationCount.Getvalue() || _SectionToScan == 11 && !RN_SafeouseContent_Installed.GetValue()
		bExclude = True
	endIf	
	
	if !bExclude
		if !_Complete.GetValue()
			ObjectReference Disp = DisplayRef as ObjectReference
			if _DisplayList.HasForm(Disp) || _SectionToScan == 0 && _Armory_Helms_Displays.Find(Disp) != -1
				if EnableState
					_EnabledList.AddForm(Disp)
					_Count.Mod(1)
				elseif !EnableState
					if _EnabledList.HasForm(Disp)
						_EnabledList.RemoveAddedForm(Disp)
						_Count.Mod(-1)
					endIf
				endIf
			endif

			if (CheckValueCount1(_Count, _Total, _Complete) && (MCM.ShowSetCompleteVal)) 
				if (MCM.ShowSimpleNotificationVal)
					_Notification.Show()
				else
					_Message.Show()
				endif
			endif
		endIf
	endIf
endEvent
	
;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)

	TCCDebug.Log("Scan Event Received for: " + _RoomName)

;;----------	
	If _SectionToScan == 8 && !RN_SupportedCreationCount.Getvalue() || _SectionToScan == 11 && !RN_SafeouseContent_Installed.GetValue()
		
		RN_Scan_Done.Mod(1)
		TCCDebug.Log("Scan Event Not Run For: " + _RoomName)
		
	else
		
		if !_Complete.GetValue()
		
			_onDisplayCheck(_DisplayList, _EnabledList, _Count)
			
			if _SectionToScan == 0
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
		
		RN_Scan_Done.Mod(1)
		TCCDebug.Log("Scan Event Completed for: " + _RoomName)
	endIf
endEvent


Function Setup()

	_DisplayList = _Museum_Formlist_Merged.GetAt(_SectionToScan) as Formlist
	_EnabledList = _Museum_Formlist_Enabled.GetAt(_SectionToScan) as Formlist
	_Complete = _Museum_Global_Complete.GetAt(_SectionToScan) as GlobalVariable
	_Count = _Museum_Global_Count.GetAt(_SectionToScan) as GlobalVariable
	_Total = _Museum_Global_Total.GetAt(_SectionToScan) as GlobalVariable	
	_Notification = _Museum_Message_Notification.GetAt(_SectionToScan) as Message
	_Message = _Museum_Message_Default.GetAt(_SectionToScan) as Message
endFunction
