Scriptname Ic0n_TeachEnchantment Extends ActiveMagicEffect

FormList Property _EnchantmentList Auto  
Enchantment Property _Enchantment Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)

	_Enchantment.SetPlayerKnows(True)
	_EnchantmentList.AddForm(_Enchantment)
	
	if Game.GetPlayer().GetActorValue("Enchanting") <= 10
		Game.AdvanceSkill("Enchanting", 0.3)
	ElseIf Game.GetPlayer().GetActorValue("Enchanting") <= 20
		Game.AdvanceSkill("Enchanting", 0.5)
	ElseIf Game.GetPlayer().GetActorValue("Enchanting") <= 30
		Game.AdvanceSkill("Enchanting", 0.6)
	ElseIf Game.GetPlayer().GetActorValue("Enchanting") <= 40
		Game.AdvanceSkill("Enchanting", 0.8)
    ElseIf Game.GetPlayer().GetActorValue("Enchanting") <= 50
		Game.AdvanceSkill("Enchanting", 0.7)
    ElseIf Game.GetPlayer().GetActorValue("Enchanting") <= 60
		Game.AdvanceSkill("Enchanting", 0.5)
    ElseIf Game.GetPlayer().GetActorValue("Enchanting") <= 70
		Game.AdvanceSkill("Enchanting", 0.4)
    ElseIf Game.GetPlayer().GetActorValue("Enchanting") <= 80
		Game.AdvanceSkill("Enchanting", 0.3)
    ElseIf Game.GetPlayer().GetActorValue("Enchanting") <= 90
		Game.AdvanceSkill("Enchanting", 0.2)	
	EndIf
EndEvent

