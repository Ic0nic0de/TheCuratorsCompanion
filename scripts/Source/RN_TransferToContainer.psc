scriptname RN_TransferToContainer extends activemagiceffect

RN_Utility_Transfer property TransferUtil auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TransferUtil.TransferRelics(Game.GetCurrentCrosshairRef())
endEvent



