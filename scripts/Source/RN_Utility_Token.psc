ScriptName RN_Utility_Token extends ObjectReference

RN_Utility_MCM property MCM auto

message property TCC_TokenRemoval auto
message property TCC_TokenAdded auto
message property TCC_TokenUpdated auto
message property TCC_TokenExisting auto
message property TCC_TokenMax auto
message property TCC_TokenVendor auto

Formlist property TCC_TokenList auto
Formlist property TCC_TokenList_NoShipmentCrates auto
Formlist property TCC_TokenList_ExcludedItems auto

ObjectReference property PlayerRef auto
ObjectReference property RN_Storage_Container auto

formlist property dbmNew auto 						;; Items available to be displayed
formlist property dbmFound auto 					;; Items that are in inventory or storage
formlist property dbmDisp auto 						;; Items that are on display
formlist property dbmMaster auto					;; Total items list

MiscObject property TCCToken auto

Faction property JobMerchantFaction auto

Int Handle

;;Alias to force the base item into.
ReferenceAlias property FoundAlias auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	
	if akOldContainer == PlayerRef && akNewContainer && !TCC_TokenList.HasForm(akNewContainer) && !TCC_TokenList_ExcludedItems.HasForm(akNewContainer)
		
		if TCC_TokenList_NoShipmentCrates.GetSize() == 6               
			
			FoundAlias.ForceRefTo(akNewContainer)
			
			TCC_TokenMax.Show()
			
			FoundAlias.Clear()
			
			akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
			
			Return
			
		else
		
			if akNewContainer as Actor
			
				Actor _o = akNewContainer as Actor
				
				if _o.IsInFaction(JobMerchantFaction)
				
					FoundAlias.ForceRefTo(_o)
					
					TCC_TokenVendor.Show()
					
					FoundAlias.Clear()
					
					akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
					
					Return
					
				endIf
				
			endIf
		
			FoundAlias.ForceRefTo(akNewContainer)
			
			Int _MenuButton = TCC_TokenAdded.Show()
			
			if _MenuButton == 0	
			
				akNewContainer.RemoveItem(TCCToken, 1, false)
			
				Int Index = akNewContainer.GetNumItems()
				While Index
					Index -= 1
					Form akBaseItem = akNewContainer.GetNthForm(Index)
					If dbmNew.HasForm(akBaseItem) && !dbmDisp.HasForm(akBaseItem)
						updateFormlists(akBaseItem)
					endIf
				endWhile
			
				TCC_TokenList.AddForm(akNewContainer)
				TCC_TokenList_NoShipmentCrates.AddForm(akNewContainer)
				if !MCM.advdebug
					TCCDebug.Log("Token - Added [" + akNewContainer.GetBaseObject().GetName() + "] " + akNewContainer + " to TCC_TokenList and TCC_TokenList_NoShipmentCrates")
				endif
				Handle = ModEvent.Create("Update_TokenArray")
				if (Handle)
					ModEvent.PushString(Handle, "")
					ModEvent.PushString(Handle, "Updating Token Array")
					ModEvent.PushFloat(Handle, 0.0)
					ModEvent.PushForm(Handle, self)
					ModEvent.Send(Handle)
				endIf
				FoundAlias.Clear()
			
				TCC_TokenUpdated.Show()
				
			elseif _MenuButton == 1
			
				akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
				
			endIf

		endIf
		
	elseIf akOldContainer == PlayerRef && akNewContainer && TCC_TokenList.HasForm(akOldContainer) && !TCC_TokenList_ExcludedItems.HasForm(akNewContainer)
		
		if akNewContainer != RN_Storage_Container
		
			FoundAlias.ForceRefTo(akNewContainer)

			Int _MenuButton = TCC_TokenRemoval.Show()
			
			if _MenuButton == 0	
			
				akNewContainer.RemoveItem(TCCToken, 1, false)
		
				Int Index = akNewContainer.GetNumItems() 
				While Index
					Index -= 1
					Form akBaseItem = akNewContainer.GetNthForm(Index)		
					if dbmMaster.HasForm(akBaseItem)
						akNewContainer.RemoveItem(akBaseItem, akNewContainer.GetitemCount(akBaseItem), false, PlayerRef)
					endIf
				endWhile
				
				TCC_TokenList.RemoveAddedForm(akNewContainer)
				TCC_TokenList_NoShipmentCrates.RemoveAddedForm(akNewContainer)
				if !MCM.advdebug
					TCCDebug.Log("Token - Removed [" + akNewContainer.GetBaseObject().GetName() + "] " + akNewContainer + " from TCC_TokenList and TCC_TokenList_NoShipmentCrates")
				endif
				Handle = ModEvent.Create("Update_TokenArray")
				if (Handle)
					ModEvent.PushString(Handle, "")
					ModEvent.PushString(Handle, "Updating Token Array")
					ModEvent.PushFloat(Handle, 0.0)
					ModEvent.PushForm(Handle, self)
					ModEvent.Send(Handle)
				endIf
				FoundAlias.Clear()
				
				TCC_TokenUpdated.Show()
				
			elseif _MenuButton == 1
			
				akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
			
			endIf
		
		else
			
			FoundAlias.ForceRefTo(akNewContainer)
			
			TCC_TokenExisting.Show()
			
			FoundAlias.Clear()
			
			akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
		endIf
	endIf		
endEvent

;-- Events --------------------------------

Event updateFormlists(form akBaseItem)

	if !dbmDisp.HasForm(akBaseItem)
		dbmNew.RemoveAddedForm(akBaseItem)
		dbmFound.AddForm(akBaseItem)
	endIf	
	
endEvent
