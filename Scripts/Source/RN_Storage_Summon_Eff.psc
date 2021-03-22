Scriptname RN_Storage_Summon_Eff extends activemagiceffect  

ObjectReference Property RN_Storage_Container Auto
Explosion Property DLC1VampiresBaneExplosionDBM Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akCaster == Game.GetPlayer()
		RN_Storage_Container.MoveTo(akCaster, 120.0 * Math.Sin(akCaster.GetAngleZ()), 120.0 * Math.Cos(akCaster.GetAngleZ()), 0, false)
		RN_Storage_Container.PlaceAtMe(DLC1VampiresBaneExplosionDBM)
	Endif
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if akCaster == Game.GetPlayer()
		RN_Storage_Container.PlaceAtMe(DLC1VampiresBaneExplosionDBM)
		RN_Storage_Container.MoveToMyEditorLocation()
	Endif
endEvent
