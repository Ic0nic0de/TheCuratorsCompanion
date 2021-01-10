Scriptname RN_Fafnir_Rewards extends ReferenceAlias

Import Utility

ObjectReference Property PlayerRef Auto

MiscObject Property Gold001 Auto
MiscObject Property TCCFafnirTeddy Auto

Formlist Property GemList Auto
Formlist Property ShellList Auto
Formlist Property CardList Auto
GlobalVariable Property RN_Fafnir_Gold Auto

Message Property DBM_FoundGoldMessage Auto
Message Property DBM_FoundGemMessage Auto
Message Property DBM_FoundShellMessage Auto
Message Property DBM_FoundCardMessage Auto
Message Property DBM_Fafnir_UserMessage Auto

;;-- Functions ---------------------------------------

Event OnInit()

	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(TCCFafnirTeddy)
endEvent

;;-- Functions ---------------------------------------

Event OnPlayerLoadGame()

	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(TCCFafnirTeddy)
endEvent

;;-- Functions ---------------------------------------

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseitem == TCCFafnirTeddy
		DBM_Fafnir_UserMessage.Show()
		RegisterForSingleUpdateGameTime(RandomInt(12,36))
	endIf
endEvent

;;-- Functions ---------------------------------------
	
Event OnUpdateGameTime()

	if PlayerRef.GetItemCount(TCCFafnirTeddy) > 0
		
		Int _Choice = RandomInt(1,11)
		
		if _Choice <= 3	
			Int _Index = RandomInt(0, GemList.GetSize())
			Form _Rewardtoadd = GemList.GetAt(_Index)
			PlayerRef.AddItem(_Rewardtoadd, 1)
			DBM_FoundGemMessage.Show()	
				
		elseif _Choice == 4
			Int _Index = RandomInt(0, ShellList.GetSize())
			Form _Rewardtoadd = ShellList.GetAt(_Index)
			PlayerRef.AddItem(_Rewardtoadd, 1)
			DBM_FoundShellMessage.Show()

		elseif _Choice == 5
			Int _Index = RandomInt(0, CardList.GetSize())
			Form _Rewardtoadd = CardList.GetAt(_Index)
			PlayerRef.AddItem(_Rewardtoadd, 1)
			DBM_FoundCardMessage.Show()
			
		else
			Int _Reward = RandomInt(1,9)
			RN_Fafnir_Gold.Setvalue(_Reward)
			GetOwningQuest().UpdateCurrentInstanceGlobal(RN_Fafnir_Gold)
			PlayerRef.Additem(Gold001, _Reward, true)
			DBM_FoundGoldMessage.Show()
		endIf
		RegisterForSingleUpdateGameTime(RandomInt(12,36))
	else
		UnRegisterForUpdateGameTime()
	endIf
endEvent
