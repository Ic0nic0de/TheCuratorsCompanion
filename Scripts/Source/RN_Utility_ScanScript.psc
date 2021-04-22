Scriptname RN_Utility_ScanScript extends ReferenceAlias

Import Debug

Import RN_Utility_Global

RN_Utility_MCM property MCM auto

int property _SectionToScan auto

string property _RoomName auto

globalvariable property RN_Scan_Done auto
globalvariable property RN_Scan_Registered auto
globalvariable property RN_CreationClubContent_Installed auto

Formlist property _Museum_Formlist_Merged auto
Formlist property _Museum_Formlist_Enabled auto
Formlist property _Museum_Global_Complete auto
Formlist property _Museum_Global_Count auto
Formlist property _Museum_Global_Total auto
Formlist property _Museum_Message_Notification auto

Formlist _DisplayList
Formlist _EnabledList
GlobalVariable _Complete
GlobalVariable _Count
GlobalVariable _Total
Message _Notification

Bool bNotified

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
	
	ObjectReference Disp = DisplayRef as ObjectReference
	
	if (_DisplayList.HasForm(Disp))

		if _RoomName == "Hall of Wonders" && !RN_CreationClubContent_Installed.Getvalue()
			TCCDebug.Log("Display Event Not Run For: " + _RoomName + " as RN_CreationClubContent_Installed is set to " + RN_CreationClubContent_Installed.Getvalue() as Int)
		
		else
		
			if (EnableState) && (!_EnabledList.HasForm(Disp))
			
				_EnabledList.AddForm(Disp)
				
				TCCDebug.Log("Updated [" + _RoomName  + "] display " + Disp.GetName() + Disp, 0)
				
				_Count.Mod(1)
				
			elseif (!EnableState) && (_EnabledList.HasForm(Disp))
			
				_EnabledList.RemoveAddedForm(Disp)
				
				TCCDebug.Log("Removed [" + _RoomName  + "] display " + Disp.GetName() + Disp, 0)
				
				_Count.Mod(-1)
			endIf
		
			if (CheckValueCount1(_Count, _Total, _Complete) && (MCM.ShowSetCompleteVal) && (!bNotified))  
				_Notification.Show()
				bNotified = True
			endif
		endif
	endIf
endEvent
	
;;-- Events ---------------------------------------	

Event _onScan(string eventName, string strArg, float numArg, Form sender)
	
	RN_Scan_Registered.Mod(1)
	
	TCCDebug.Log("Scan Event Received for: " + _RoomName)
	
	If _RoomName == "Hall of Wonders" && !RN_CreationClubContent_Installed.Getvalue()
		TCCDebug.Log("Scan Event Not Run For: " + _RoomName + " as RN_CreationClubContent_Installed is set to " + RN_CreationClubContent_Installed.Getvalue() as Int)
		RN_Scan_Done.Mod(1)
	else
		
		_onDisplayCheck(_DisplayList, _EnabledList, _Count, _RoomName)
			
		if (CheckValueCount1(_Count, _Total, _Complete) && (MCM.ShowSetCompleteVal) && (!bNotified))  
			_Notification.Show()
			bNotified = True
		endif
		
		RN_Scan_Done.Mod(1)
		
		TCCDebug.Log("Scan Event Completed for: " + _RoomName)
	endIf
endEvent

;;-- Events ---------------------------------------	

Function Setup()

	_DisplayList = _Museum_Formlist_Merged.GetAt(_SectionToScan) as Formlist
	_EnabledList = _Museum_Formlist_Enabled.GetAt(_SectionToScan) as Formlist
	_Complete = _Museum_Global_Complete.GetAt(_SectionToScan) as GlobalVariable
	_Count = _Museum_Global_Count.GetAt(_SectionToScan) as GlobalVariable
	_Total = _Museum_Global_Total.GetAt(_SectionToScan) as GlobalVariable	
	_Notification = _Museum_Message_Notification.GetAt(_SectionToScan) as Message
endFunction
