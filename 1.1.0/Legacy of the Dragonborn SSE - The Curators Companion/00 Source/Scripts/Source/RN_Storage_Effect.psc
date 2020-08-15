Scriptname RN_Storage_Effect extends activemagiceffect

Objectreference Property RN_Storage_Act Auto

Message Property RN_Storage_Message AUTO

Event OnEffectStart(Actor akTarget, Actor akCaster)

	int BTN = RN_Storage_Message.Show()
		if BTN == 0
			RN_Storage_Act.Activate(Game.GetPlayer())
		Elseif Btn == 1
			Return
		Endif
EndEvent
