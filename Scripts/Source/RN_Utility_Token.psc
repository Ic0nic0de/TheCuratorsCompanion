ScriptName RN_Utility_Token extends ObjectReference

DBM_ReplicaHandler Property ReplicaHandler Auto

RN_Utility_MCM property RN_MCM auto

message property TCC_TokenRemoval auto
message property TCC_TokenAdded auto
message property TCC_TokenUpdated auto
message property TCC_TokenExisting auto
message property TCC_TokenMax auto

Formlist property RN_TokenFormlist auto
Formlist property RN_TokenFormlist_NoShipment auto
Formlist property RN_TokenFormlistExcluded auto

ObjectReference property PlayerRef auto
ObjectReference property RN_Storage_Container auto

GlobalVariable Property CustomContainer auto

formlist property dbmNew auto 						;; Items available to be displayed
formlist property dbmFound auto 					;; Items that are in inventory or storage
formlist property dbmDisp auto 						;; Items that are on display
formlist property dbmMaster auto					;; Total items list

Formlist property DBM_ReplicaBaseItems auto 		;; holds the Replica Base Items.
formlist property DBM_ReplicaItems auto 			;; Holds the Replicas.

MiscObject property TCCToken auto

;;Alias to force the base item into.
ReferenceAlias property RN_Alias_Found auto
					
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	
	if akOldContainer == PlayerRef && akNewContainer && !RN_TokenFormlist.HasForm(akNewContainer) && !RN_TokenFormlistExcluded.HasForm(akNewContainer)
	
		if CustomContainer.GetValue() as Int == 6               
			
			RN_Alias_Found.ForceRefTo(akNewContainer)
			
			TCC_TokenMax.Show()
			
			RN_Alias_Found.Clear()
			
			akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
		
		else
		
			RN_Alias_Found.ForceRefTo(akNewContainer)
			
			Int _MenuButton = TCC_TokenAdded.Show()
			
			if _MenuButton == 0	
			
				akNewContainer.RemoveItem(TCCToken, 1, false)
			
				Int Index = akNewContainer.GetNumItems()
				While Index
					Index -= 1
					Form akBaseItem = akNewContainer.GetNthForm(Index)
					If dbmNew.HasForm(akBaseItem) && !dbmDisp.HasForm(akBaseItem)
						processForm(akBaseItem)
					endIf
				endWhile
			
				RN_TokenFormlist.AddForm(akNewContainer)
				RN_TokenFormlist_NoShipment.AddForm(akNewContainer)
				CustomContainer.Mod(1)
				RN_Alias_Found.Clear()
			
				TCC_TokenUpdated.Show()
				
			elseif _MenuButton == 1
			
				akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
				
			endIf

		endIf
		
	elseIf akOldContainer == PlayerRef && akNewContainer && RN_TokenFormlist.HasForm(akOldContainer) && !RN_TokenFormlistExcluded.HasForm(akNewContainer)
		
		if akNewContainer != RN_Storage_Container
		
			RN_Alias_Found.ForceRefTo(akNewContainer)

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
				
				RN_TokenFormlist.RemoveAddedForm(akNewContainer)
				RN_TokenFormlist_NoShipment.RemoveAddedForm(akNewContainer)
				CustomContainer.Mod(-1)
				RN_Alias_Found.Clear()
				
				TCC_TokenUpdated.Show()
				
			elseif _MenuButton == 1
			
				akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
			
			endIf
		
		else
			
			RN_Alias_Found.ForceRefTo(akNewContainer)
			
			TCC_TokenExisting.Show()
			
			RN_Alias_Found.Clear()
			
			akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
		endIf
	endIf		
endEvent

;-- Events --------------------------------

Event processForm(form akBaseItem)

	updateFormlists(akBaseitem)
	
	if RN_MCM.ReplicaTag		
		if DBM_ReplicaBaseItems.HasForm(akBaseitem)						;; If the item being processed is a "Base Item" ...				
			updateFormlists(ReplicaHandler.GetReplica(akBaseItem))		;; ... we also need to process the replica
				
		elseif DBM_ReplicaItems.HasForm(akBaseitem)						;; If the item being processed is a "Replica" ...
			updateFormlists(ReplicaHandler.GetOriginal(akBaseItem))		;; ... we also need to process the original

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
