Scriptname Ic0n_RoomSelectionScript extends ObjectReference  

Formlist Property SH_GlobalList Auto
Formlist Property SH_ReceiptList Auto

;----------------------------------------------

Event OnClose(ObjectReference akActionRef)
	CheckReceipts()
endEvent

;----------------------------------------------

Event CheckReceipts()

	Int Index = SH_ReceiptList.GetSize()
	While Index
		Index -= 1
		form _Receipt = SH_ReceiptList.GetAt(Index)
		GlobalVariable _Global = SH_GlobalList.GetAt(Index) as GlobalVariable
		if self.GetItemCount(_Receipt)
			_Global.setvalue(1)
		else
			_Global.setvalue(0)
		endIf
	endWhile
endEvent
