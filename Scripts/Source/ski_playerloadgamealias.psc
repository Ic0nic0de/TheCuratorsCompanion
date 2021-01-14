;/ Decompiled by Champollion V1.0.1
Source   : SKI_PlayerLoadGameAlias.psc
Modified : 2012-11-03 23:59:18
Compiled : 2017-10-03 21:48:11
User     : Sebastian
Computer : SEBASTIAN-PC
/;
scriptName SKI_PlayerLoadGameAlias extends ReferenceAlias

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnPlayerLoadGame()

	(self.GetOwningQuest() as ski_questbase).OnGameReload()
endFunction

; Skipped compiler generated GotoState
