Scriptname RN_Utility_Treasury extends ObjectReference  

RN_Utility_Script Property RN_Utility Auto

Objectreference Property akContainer Auto
GlobalVariable Property akVariable Auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	RN_Utility.UpdateTreasuryValue(akContainer, akVariable)				
endEvent


Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	
	RN_Utility.UpdateTreasuryValue(akContainer, akVariable)				
endEvent

