Scriptname RN_Utility_TreasuryUpdate extends ReferenceAlias  

globalvariable property RN_Treasury_Count auto
globalvariable property RN_Treasury_Count2 auto
globalvariable property RN_Treasury_Count3 auto

Event Oninit()

	RegisterForModEvent("DBM Treasury Updated", "_UpdateValue")
endEvent

Event OnPlayerLoadGame()

	RegisterForModEvent("DBM Treasury Updated", "_UpdateValue")
endEvent

Event _UpdateValue(string eventName, string strArg, float _value, Form sender)

	if strArg == "Safehouse"
		RN_Treasury_Count.SetValue(_value as Int)
		
	elseIf strArg == "Deepholme"
		RN_Treasury_Count2.SetValue(_value as Int)
	
	elseif strArg == "Rkund"
		RN_Treasury_Count3.SetValue(_value as Int)
	endIf	
endEvent

