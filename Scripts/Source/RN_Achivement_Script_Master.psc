Scriptname RN_Achivement_Script_Master extends ObjectReference

Import RN_Utility_Global
Import Debug

;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

RN_Achivement_Script_01 property Achievement01 auto
RN_Achivement_Script_02 property Achievement02 auto
RN_Achivement_Script_03 property Achievement03 auto
RN_Achivement_Script_04 property Achievement04 auto
RN_Achivement_Script_05 property Achievement05 auto
RN_Achivement_Script_06 property Achievement06 auto

RN_ComAchievement_Script_01 property Achievement07 auto
RN_ComAchievement_Script_02 property Achievement08 auto
;Player.
objectreference property PlayerRef auto

;;Global to control counts
GlobalVariable Property RN_Achievements_Listener_Total Auto
GlobalVariable Property RN_Achievements_Listener_Count Auto
GlobalVariable Property RN_Achievements_Listener_Complete Auto

GlobalVariable Property RN_ComAchievements_Listener_Total Auto
GlobalVariable Property RN_ComAchievements_Listener_Count Auto
GlobalVariable Property RN_ComAchievements_Listener_Complete Auto

globalvariable property AchHealth auto
globalvariable property AchStamina auto
globalvariable property AchMagicka auto
globalvariable property AchSpeech auto

;;Formlist containing all indivisual achievement globals
Formlist Property RN_Achievement_Globals Auto

Formlist Property RN_ComAchievement_Globals Auto

;Properties for visual & sound effects.
Sound Property TCC_Ach_Sound Auto
Sound Property TCC_Ach_SoundCheer Auto
Sound Property TCC_Ach_SoundBrass Auto

VisualEffect Property TCC_AchievementFX Auto

;Rewards Container.
objectreference property TCC_Achievements_Container auto
MiscObject Property Gold001 Auto

Bool Notified

;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------- Script Start ---------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Event onInit()

	RegisterForModEvent("FireScripts", "_OnFireScripts")
endEvent

;;-- Functions ---------------------------------------

Event _OnFireScripts (string eventName, string strArg, float numArg, Form sender)

	GoToState("Running")
endEvent	

;;-- Functions ---------------------------------------

State Running	
	
	Event OnBeginState()
		RegisterForSingleUpdate(5)
	endEvent	
	
	Event OnUpdate()

		if RN_Achievements_Listener_Complete.GetValue() && RN_Achievements_Listener_Total.GetValue() != RN_Achievements_Listener_Count.GetValue()
			RN_Achievements_Listener_Complete.SetValue(0)
		endIf

		if RN_ComAchievements_Listener_Complete.GetValue() && RN_ComAchievements_Listener_Total.GetValue() != RN_ComAchievements_Listener_Count.GetValue()
			RN_ComAchievements_Listener_Complete.SetValue(0)
		endIf
		
		if RN_Achievements_Listener_Complete.GetValue() && RN_ComAchievements_Listener_Complete.GetValue()
			if !Notified
				RN_Utility_Global.Notify("The Curators Companion: All " + (RN_Achievement_Globals.GetSize() AS Int + RN_ComAchievement_Globals.GetSize() AS Int) + " Achievements Unlocked", MCM.ColourString)
				Notified = True
				TCCDebug.Log("Achievements Master - All Available Achievements Completed", 0)
			endif
		
		else

			Achievement01.RegisterForSingleUpdate(0)
			Achievement02.RegisterForSingleUpdate(0)
			Achievement03.RegisterForSingleUpdate(0)
			Achievement04.RegisterForSingleUpdate(0)
			Achievement05.RegisterForSingleUpdate(0)
			Achievement06.RegisterForSingleUpdate(0)
			Achievement07.RegisterForSingleUpdate(0)
			Achievement08.RegisterForSingleUpdate(0)		
			RegisterForSingleUpdate(20)
		endIf
	endEvent
endState

;;-- Functions ---------------------------------------

auto state Disabled

	Event OnUpdate()
	endEvent
endState
	
;;-- Functions ---------------------------------------

function preview()

	if (MCM.Ach_Visual)
		TCC_AchievementFX.Play(PlayerRef)
	endIf
	
	if (MCM.Ach_Notify)
		RN_Utility_Global.Notify("Achievement Unlocked! (Achievement!)", MCM.ColourString)
	endIf	
	
	PlayFX(MCM.IndexSounds)

	if (MCM.Ach_Visual)
		TCC_AchievementFX.Stop(PlayerRef)
	endIf
endFunction	

;;-- Functions ---------------------------------------

function Notify(String _Message)
		
	if (MCM.Ach_Visual)
		TCC_AchievementFX.Play(PlayerRef)
	endIf
	
	if (MCM.Ach_Notify)
		RN_Utility_Global.Notify("Achievement Unlocked! (" + _Message + ")", MCM.ColourString)
		TCCDebug.Log("Achievements Master - Achievement complete: " + _Message, 0)
	endIf
	
	PlayFX(MCM.IndexSounds)
		
	if (MCM.Ach_Visual)
		TCC_AchievementFX.Stop(PlayerRef)
	endIf
endfunction

;;-- Functions ---------------------------------------

function PlayFX(Int _Value)

	if _Value == 0	
		TCC_Ach_Sound.Playandwait(PlayerRef)
	elseif _Value == 1
		TCC_Ach_SoundCheer.Playandwait(PlayerRef)
	elseif _Value == 2
		TCC_Ach_SoundBrass.Playandwait(PlayerRef)
	endIf
endfunction

;;-- Functions ---------------------------------------

function Attribute(Int _Value)

	if _Value == 4
		Int _RandomAtt = Utility.RandomInt(1,3)
		PushAttr(_RandomAtt)
	else
		PushAttr(_Value)
	endIf
endfunction

;;-- Functions ---------------------------------------			
			
function PushAttr(Int _Value)
	
	if _Value == 1
		Game.GetPlayer().ModActorValue("Magicka", 10.0)	
		AchMagicka.Mod(10)
	elseif _Value == 2
		Game.GetPlayer().ModActorValue("Health", 10.0)
		AchHealth.Mod(10)
	elseif _Value == 3
		Game.GetPlayer().ModActorValue("Stamina", 10.0)	
		AchStamina.Mod(10)
	endIf
endfunction

;;-- Functions ---------------------------------------	

function Reward(Bool _GivePerk, Bool _GiveGold, Form _UniqueItem = None, String _Attr = "", Int _Value = 0)
	
	if _GivePerk
		Game.AddPerkPoints(1)
	endIf
		
	if _GiveGold
		TCC_Achievements_Container.AddItem(Gold001, 1000)
	endIf
		
	if _UniqueItem
		TCC_Achievements_Container.AddItem(_UniqueItem, 1)
	endIf
	
	if _Attr != ""
		Game.GetPlayer().ModActorValue(_Attr, _Value)
		
		if _Attr == "Speechcraft"
			AchSpeech.Mod(_Value)
			
		elseif _Attr == "Magicka"
			AchMagicka.Mod(_Value)
		endif
		
	endIf
	
	Attribute(MCM.IndexAttribute)
endfunction
