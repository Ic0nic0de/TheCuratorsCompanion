Scriptname RN_Utility_Global

Import Debug

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;----------------------------------------------------------------------------- Script Start --------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Utility function _onConsolidateItems (Formlist afListA, Formlist afListB, Formlist afListC, Formlist afListD = None) global
	
	Int Index = afListA.GetSize()
	while Index
		Index -= 1
		Form formToProcess = afListA.GetAt(Index) As Form		
			if (formToProcess As Formlist)
			Formlist nestedList = formToProcess As Formlist
			Int Index2 = nestedList.GetSize()							
				While Index2
					Index2 -= 1
					formToProcess = nestedList.GetAt(Index2) as Form	
					if !formToProcess as Activator 
						afListB.AddForm(formToProcess)
						afListC.AddForm(formToProcess)
						afListD.AddForm(formToProcess)
					endIf
				EndWhile
				
			elseif !formToProcess as Activator 
				afListB.AddForm(formToProcess)
				afListC.AddForm(formToProcess)
				afListD.AddForm(formToProcess)
			endIf	
	endWhile
endFunction

;;-- Functions ---------------------------------------

Utility function _onConsolidateDisplays (Formlist afListA, Formlist afListB) global
	
	Int Index = afListA.GetSize() 
	while Index
		Index -= 1
		Form formToProcess = afListA.GetAt(Index) As Form   		
		if (formToProcess As Formlist)			
			afListB.AddForm((formToProcess as Formlist).GetAt(0) as ObjectReference)
		elseif (formToProcess As ObjectReference)
			afListB.AddForm(formToProcess As ObjectReference)
		endIf
	endWhile
endFunction

;;-- Functions ---------------------------------------

Utility function _onDisplayCheck (Formlist afListA, Formlist afListB, GlobalVariable akVariable) global
	
	Int Index = afListA.GetSize()
	while Index
		Index -= 1
		Form formToProcess = afListA.GetAt(Index) As Form
		if (formToProcess As Formlist)			
		FormList nestedList = formToProcess As Formlist
		Int Index2 = nestedList.GetSize()
			While Index2
				Index2 -= 1
				ObjectReference DisplayRef = nestedList.GetAt(Index2) as ObjectReference	
				if !afListB.HasForm(DisplayRef) && !DisplayRef.IsDisabled()
					afListB.AddForm(DisplayRef)				
				elseif aflistB.HasForm(DisplayRef) && DisplayRef.IsDisabled()
					afListB.RemoveAddedForm(DisplayRef)
				endIf
			EndWhile
				
		elseif (formToProcess As ObjectReference)
			ObjectReference DisplayRef = formToProcess As ObjectReference
			if !afListB.HasForm(DisplayRef) && !DisplayRef.IsDisabled()
				afListB.AddForm(DisplayRef)			
			elseif aflistB.HasForm(DisplayRef) && DisplayRef.IsDisabled()
				afListB.RemoveAddedForm(DisplayRef)
			endIf

			akVariable.Setvalue(afListB.GetSize())
		endIf
	endWhile
endFunction

;;-- Functions ---------------------------------------

Bool Function CheckValueCount1(GlobalVariable aKVariable_Count, GlobalVariable aKVariable_Total, GlobalVariable akVariable) global
	if aKVariable_Count.GetValue() >= aKVariable_Total.GetValue()
		akVariable.SetValue(1)	
		return true
	endIf
  
  akVariable.SetValue(0)
  return false
EndFunction

;;-- Functions ---------------------------------------

Bool Function CheckQuestComplete (Quest akQuest) global
	if (akQuest.IsCompleted())
		return true
	endif
  
  return false
EndFunction 

;;-- Functions ---------------------------------------

Bool Function CheckQuestStageComplete (Int akStage, Quest akQuest) global
	if (akQuest.Getstage() >= akStage) || (akQuest.IsCompleted())
		return true
	endif
  
  return false
EndFunction 

;;-- Functions ---------------------------------------

Bool Function CheckDeadActor (Actor akActor) global
	if (akActor.IsDead())
		return true
	endif
  
  return false
EndFunction 










