ScriptName RN_Utility_Token extends ObjectReference

RN_PatchAPI property API auto
RN_Utility_MCM property MCM auto

message property TCC_TokenAdded auto
message property TCC_TokenUpdated auto
message property TCC_TokenExisting auto
message property TCC_TokenMax auto
message property TCC_TokenVendor auto
message property TCC_TokenShipmentCrate auto

Formlist property TCC_TokenList_ExcludedItems auto

ObjectReference property PlayerRef auto

globalvariable property TokenRefList_NoShipmentSize auto

formlist property dbmNew auto
formlist property dbmFound auto
formlist property dbmDisp auto

Container Property DBMMuseumShipmentsCrateIncoming auto
Container Property DBMMuseumShipmentsCrateOutgoing auto

MiscObject property TCCToken auto

Faction property JobMerchantFaction auto
Faction property JobInnkeeperFaction auto

Bool TokenAdded

;;Alias to force the base item into.
ReferenceAlias property FoundAlias auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	
	if (akNewContainer.GetBaseObject() == DBMMuseumShipmentsCrateOutgoing) || (akNewContainer.GetBaseObject() == DBMMuseumShipmentsCrateIncoming)
		akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
		TCCDebug.Log("Token - Unable to add [" + akNewContainer.GetBaseObject().GetName() + "] " + akNewContainer + " to TokenRefList or TokenRefList_NoShipment as shipment crates are handled seperately")
		TCC_TokenShipmentCrate.Show()
		Return
	endif
		
	if akOldContainer == PlayerRef && akNewContainer && API.TokenRefList.Find(akNewContainer) == -1 && !TCC_TokenList_ExcludedItems.HasForm(akNewContainer)
		
		if TokenRefList_NoShipmentSize.GetValue() == 10              
			
			FoundAlias.ForceRefTo(akNewContainer)
			
			TCC_TokenMax.Show()
			
			FoundAlias.Clear()
			
			akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
			
			Return
			
		else
		
			if akNewContainer as Actor
				Actor NPC = akNewContainer as Actor
				if (NPC.IsInFaction(JobMerchantFaction)) || (NPC.IsInFaction(JobInnkeeperFaction))
					FoundAlias.ForceRefTo(NPC)
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
				
				TokenAdded = API.AddToTokenRefList(akNewContainer, True)

				FoundAlias.Clear()
				
				if TokenAdded
					TCC_TokenUpdated.Show()
				endif
				
			elseif _MenuButton == 1
			
				akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
				
			endIf

		endIf
		
	elseIf akOldContainer == PlayerRef && akNewContainer && API.TokenRefList.Find(akNewContainer) != -1 && !TCC_TokenList_ExcludedItems.HasForm(akNewContainer)
		
		FoundAlias.ForceRefTo(akNewContainer)
		
		akNewContainer.RemoveItem(TCCToken, 1, false, PlayerRef)
		
		TCC_TokenExisting.Show()
		
		FoundAlias.Clear()	
	endIf		
endEvent

;-- Events --------------------------------

Event updateFormlists(form akBaseItem)

	if !dbmDisp.HasForm(akBaseItem)
		dbmNew.RemoveAddedForm(akBaseItem)
		dbmFound.AddForm(akBaseItem)
	endIf	
	
endEvent
