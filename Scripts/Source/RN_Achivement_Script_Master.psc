Scriptname RN_Achivement_Script_Master extends ObjectReference

Import Debug

;Property to obtain values from MCM Script.
RN_Utility_MCM Property MCM Auto

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
VisualEffect Property TCC_AchievementFX Auto

;Rewards Container.
objectreference property TCC_Achievements_Container auto
MiscObject Property Gold001 Auto

;;-- Functions ---------------------------------------

Event onCellAttach()
	
	if RN_Achievements_Listener_Complete.GetValue() && RN_Achievements_Listener_Total.GetValue() != RN_Achievements_Listener_Count.GetValue()
		RN_Achievements_Listener_Complete.SetValue(0)
	endIf

	if RN_ComAchievements_Listener_Complete.GetValue() && RN_ComAchievements_Listener_Total.GetValue() != RN_ComAchievements_Listener_Count.GetValue()
		RN_ComAchievements_Listener_Complete.SetValue(0)
	endIf
	
	if !RN_Achievements_Listener_Complete.GetValue() && !RN_ComAchievements_Listener_Complete.GetValue()
		if (RN_Achievements_Listener_Count.GetValue() == RN_Achievement_Globals.GetSize()) && (RN_ComAchievements_Listener_Count.GetValue() == RN_ComAchievement_Globals.GetSize())
			Notification("The Curators Companion: All " + (RN_Achievement_Globals.GetSize() AS Int + RN_ComAchievement_Globals.GetSize() AS Int) + " Achievements Unlocked")
			if MCM.advdebug
				TCCDebug.Log("Achievements Master - All Available Achievements Completed", 0)
			endif
			RN_Achievements_Listener_Complete.SetValue(1)
			RN_ComAchievements_Listener_Complete.SetValue(1)
		else
			RN_Achievements_Listener_Complete.SetValue(0)
			RN_ComAchievements_Listener_Complete.SetValue(0)
		endIf		
	endIf
	
	SendModEvent("_RunAchievementsCheck")
endEvent

;;-- Functions ---------------------------------------

function Notify(String _Message)
		
	if (MCM.Ach_Visual)
		TCC_AchievementFX.Play(PlayerRef)
	endIf
	
	if (MCM.Ach_Notify)
		Notification("Achievement Unlocked! (" + _Message + ")")
		if MCM.advdebug
			TCCDebug.Log("Achievements Master - Achievement complete: " + _Message, 0)
		endif
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
