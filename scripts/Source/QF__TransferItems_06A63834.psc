;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF__TransferItems_06A63834 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE RN_Utility_Transfer
Quest __temp = self as Quest
RN_Utility_Transfer kmyQuest = __temp as RN_Utility_Transfer
;END AUTOCAST
;BEGIN CODE
kmyQuest.RunRelicTransfer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE RN_Utility_Transfer
Quest __temp = self as Quest
RN_Utility_Transfer kmyQuest = __temp as RN_Utility_Transfer
;END AUTOCAST
;BEGIN CODE
kmyQuest.RunAllTransfer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE RN_Utility_Transfer
Quest __temp = self as Quest
RN_Utility_Transfer kmyQuest = __temp as RN_Utility_Transfer
;END AUTOCAST
;BEGIN CODE
kmyQuest.RunCustomTransfer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
