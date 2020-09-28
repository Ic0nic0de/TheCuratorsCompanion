Scriptname RN_Utility_ArrayHolder extends Quest

RN_Utility_Mods Property RN_Mod Auto

;;Museum storage containers to check within several events.
ObjectReference[] property _MuseumContainerArray auto 		;; Used to check Museum containers for displayed items (Creating moreHUD lists).
ObjectReference[] property _MuseumContainerArray_WP auto	;; Used to check Museum containers & Player when updating found items lists by all patches.

;;Safehouse storage containers to check within several events.
ObjectReference[] property _SafehouseContainerArray auto 		;; Used to check Museum containers for displayed items (Creating moreHUD lists).
ObjectReference[] property _SafehouseContainerArray_WP auto	;; Used to check Museum containers & Player when updating found items lists by all patches.

Formlist property _SafehouseContainerList auto 		;; Used to check Museum containers for displayed items (Creating moreHUD lists).
Formlist property _SafehouseContainerList_WP auto		;; Used to check Museum containers & Player when updating found items lists by all patches.

;;Setup Events
String[] Property _ModSetup auto ;;Museum Setup
String[] Property _ModUpdate auto ;;Update Found Items

;;----- Museum
GlobalVariable[] Property _Museum_Global_Complete auto
GlobalVariable[] Property _Museum_Global_Count auto
GlobalVariable[] Property _Museum_Global_Total auto
Formlist[] Property _Museum_Formlist_Merged auto
Formlist[] Property _Museum_Formlist_Enabled auto
Message[] Property _Museum_Message_Default auto
Message[] Property _Museum_Message_Notification auto
String[] Property _Museum_Section_names auto
String[] Property _Museum_Scan_EventNames auto

;;----- Armory
ObjectReference[] Property _Armory_Helms_Displays auto
GlobalVariable[] Property _Armory_Global_Complete auto
GlobalVariable[] Property _Armory_Global_Count auto
GlobalVariable[] Property _Armory_Global_Total auto
Formlist[] Property _Armory_Formlist_Displays auto
Formlist[] Property _Armory_Formlist_Enabled auto
Message[] Property _Armory_Message_Default auto
Message[] Property _Armory_Message_Notification auto
String[] Property _Armory_Section_names auto

;;----- Heavy Armory
GlobalVariable[] Property _HeavyArmory_Global_Complete auto
GlobalVariable[] Property _HeavyArmory_Global_Count auto
GlobalVariable[] Property _HeavyArmory_Global_Total auto
String[] Property _HeavyArmory_Section_names auto

;;----- Immersive Weapons
GlobalVariable[] Property _ImmersiveWeapons_Global_Complete auto
GlobalVariable[] Property _ImmersiveWeapons_Global_Count auto
GlobalVariable[] Property _ImmersiveWeapons_Global_Total auto
String[] Property _ImmersiveWeapons_Section_names auto

;;----- Patches
GlobalVariable[] Property _GVComplete auto
GlobalVariable[] Property _PatchCount auto
GlobalVariable[] Property _PatchTotal auto
GlobalVariable[] Property _bPatches auto
String[] Property _PatchName auto
String[] Property _ModScan auto
String[] Property _Patches auto

;;----- Creation Club
GlobalVariable[] Property _GVCreationComplete auto
GlobalVariable[] Property _CreationCount auto
GlobalVariable[] Property _CreationTotal auto
GlobalVariable[] Property _bCreations auto
String[] Property _CreationName auto
String[] Property _CreationScan auto
String[] Property _Creations auto
