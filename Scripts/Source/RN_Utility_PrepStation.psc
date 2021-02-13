scriptName RN_Utility_PrepStation extends ObjectReference

RN_Utility_MCM property RN_MCM auto
RN_Utility_Script Property RN_Utility Auto

Quest Property DBM_CuratorsCompanion_TransferUtil Auto

Message Property DBM_SortError Auto
Message Property DBM_RN_SetCheck_Message Auto
Message Property DBM_RN_TransferRelics_Message Auto

GlobalVariable Property DBM_SortWait Auto
Objectreference Property RN_Excluded_Act Auto

Int OPButton
Int TRButton

;;------------------------------------------------------------------------------------------

Function OnActivate(ObjectReference akActionRef)

	if (DBM_SortWait.GetValue())
		DBM_SortError.show()
	else
		OptionsMenu()
	endIf
endFunction

;;------------------------------------------------------------------------------------------

function OptionsMenu()
	OPButton = DBM_RN_SetCheck_Message.show()
	if OPButton == 0
		RN_Utility.ScanMuseum()
	elseif OPButton == 1
		Transfer()
	elseif OPButton == 2
		return
	endIf
endFunction

;;------------------------------------------------------------------------------------------

function Transfer()
	
	TRButton = DBM_RN_TransferRelics_Message.Show()
	if TRButton == 0
		if RN_MCM.PrepTransfer == 0
			DBM_CuratorsCompanion_TransferUtil.SetStage(10)
		elseif RN_MCM.PrepTransfer == 1
			DBM_CuratorsCompanion_TransferUtil.SetStage(20)
		elseif RN_MCM.PrepTransfer == 2
			DBM_CuratorsCompanion_TransferUtil.SetStage(30)
		endIf
	elseif TRButton == 1
		RN_Excluded_Act.Activate(Game.GetPlayer())
	elseif TRButton == 2
		OptionsMenu()
	endIf
endFunction


