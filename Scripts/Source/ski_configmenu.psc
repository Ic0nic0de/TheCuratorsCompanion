
scriptName SKI_ConfigMenu extends SKI_ConfigBase

;-- Properties --------------------------------------
import FISSFactory

ski_main property SKI_MainInstance auto
ski_favoritesmanager property SKI_FavoritesManagerInstance auto
ski_settingsmanager property SKI_SettingsManagerInstance auto
ski_activeeffectswidget property SKI_ActiveEffectsWidgetInstance auto

;-- Variables ---------------------------------------
	
Int _categoryIconThemeIdx = 0
Int _itemcardAlignIdx = 2
Int _itemlistQuantityMinCount = 6
Int _favCurGroupIdx = 0
Int _effectWidgetFlags
Int _switchTabKey = 56
Int _switchTabButton = 271
Int _sortOrderButton = 272
Int _nextColumnButton = 275
Int _3DItemFlags
Int _effectWidgetOrientationIdx = 1
Int _equipModeKey = 42
Int _prevColumnButton = 274
Int _effectWidgetHAnchorIdx = 1
Int _effectWidgetIconSizeIdx = 1
Int _itemlistFontSizeIdx = 1
Int _searchKey = 57
Int _effectWidgetGroupCount = 8
Int _effectWidgetVAnchorIdx = 0

Float _itemXBaseW
Float _fInventory3DItemPosXWide
Float _fInventory3DItemPosZ
Float _3DItemXOffset
Float _itemXBase
Float _fMagic3DItemPosXWide
Float _fInventory3DItemPosX
Float _fInventory3DItemPosScaleWide
Float _itemcardXOffset
Float _itemcardYOffset
Float _3DItemScale = 1.50000
Float _fMagic3DItemPosX
Float _fInventory3DItemPosScale
Float _fInventory3DItemPosZWide
Float _fMagic3DItemPosZWide
Float _fMagic3DItemPosScaleWide
Float _fMagic3DItemPosZ
Float _effectWidgetYOffset
Float _effectWidgetXOffset
Float _3DItemYOffset
Float _fMagic3DItemPosScale

Bool _3DItemDisablePositioning
Bool _itemlistNoIconColors

String[] _categoryIconThemeLongNames
String[] _categoryIconThemeShortNames
String[] _categoryIconThemeValues
String[] _sizes
String[] _favGroupNames
String[] _alignmentValues
String[] _orientations
String[] _orientationValues
String[] _vertAlignments
String[] _alignments
String[] _vertAlignmentValues

Float[] _vertAlignmentBaseOffsets
Float[] _effectWidgetIconSizeValues
Float[] _alignmentBaseOffsets

String Status_Return

;-- Functions ---------------------------------------

Function Begin_Config_Save()
FISSInterface fiss = FISSFactory.getFISS()

	If !fiss
		ShowMessage("FISS not installed, unable to save user settings to config file", false, "Ok")
		return
	endIf
	
	fiss.beginSave("SKY_UI.xml", "SKYUI")

	fiss.saveBool("_3DItemDisablePositioning", _3DItemDisablePositioning)				;Working
	fiss.saveBool("_itemlistNoIconColors", _itemlistNoIconColors) 						;Working
	
	fiss.saveInt("_categoryIconThemeIdx", _categoryIconThemeIdx) 						;Working
	fiss.saveInt("_itemcardAlignIdx", _itemcardAlignIdx)								;Working
	fiss.saveInt("_itemlistQuantityMinCount", _itemlistQuantityMinCount)				;Working
	fiss.saveInt("_favCurGroupIdx", _favCurGroupIdx)
	fiss.saveInt("_effectWidgetFlags", _effectWidgetFlags)
	fiss.saveInt("_switchTabButton", _switchTabButton)
	fiss.saveInt("_switchTabKey", _switchTabKey)
	fiss.saveInt("_sortOrderButton", _sortOrderButton)
	fiss.saveInt("_nextColumnButton", _nextColumnButton)
	fiss.saveInt("_effectWidgetOrientationIdx", _effectWidgetOrientationIdx)
	fiss.saveInt("_equipModeKey", _equipModeKey)
	fiss.saveInt("_prevColumnButton", _prevColumnButton)
	fiss.saveInt("_effectWidgetHAnchorIdx", _effectWidgetHAnchorIdx)
	fiss.saveInt("_effectWidgetIconSizeIdx", _effectWidgetIconSizeIdx)
	fiss.saveInt("_itemlistFontSizeIdx", _itemlistFontSizeIdx)
	fiss.saveInt("_searchKey", _searchKey)
	fiss.saveInt("_effectWidgetGroupCount", _effectWidgetGroupCount)
	fiss.saveInt("_effectWidgetVAnchorIdx", _effectWidgetVAnchorIdx)

	fiss.saveFloat("_itemXBaseW", _itemXBaseW)
	fiss.saveFloat("_fInventory3DItemPosXWide", _fInventory3DItemPosXWide)
	fiss.saveFloat("_fInventory3DItemPosZ", _fInventory3DItemPosZ)
	fiss.saveFloat("_3DItemXOffset", _3DItemXOffset)
	fiss.saveFloat("_itemXBase", _itemXBase)
	fiss.saveFloat("_fMagic3DItemPosXWide", _fMagic3DItemPosXWide)
	fiss.saveFloat("_fInventory3DItemPosX", _fInventory3DItemPosX)
	fiss.saveFloat("_fInventory3DItemPosScaleWide", _fInventory3DItemPosScaleWide)
	fiss.saveFloat("_itemcardXOffset", _itemcardXOffset)
	fiss.saveFloat("_itemcardYOffset", _itemcardYOffset)
	fiss.saveFloat("_3DItemScale", _3DItemScale)
	fiss.saveFloat("_fMagic3DItemPosX", _fMagic3DItemPosX)
	fiss.saveFloat("_fInventory3DItemPosScale", _fInventory3DItemPosScale)
	fiss.saveFloat("_fInventory3DItemPosZWide", _fInventory3DItemPosZWide)
	fiss.saveFloat("_fMagic3DItemPosZWide", _fMagic3DItemPosZWide)
	fiss.saveFloat("_fMagic3DItemPosScaleWide", _fMagic3DItemPosScaleWide)
	fiss.saveFloat("_fMagic3DItemPosZ", _fMagic3DItemPosZ)
	fiss.saveFloat("_effectWidgetYOffset", _effectWidgetYOffset)
	fiss.saveFloat("_effectWidgetXOffset", _effectWidgetXOffset)
	fiss.saveFloat("_3DItemYOffset", _3DItemYOffset)
	fiss.saveFloat("_fMagic3DItemPosScale", _fMagic3DItemPosScale)

	string saveResult = fiss.endSave()
		If (saveResult != "")
			ShowMessage("Fiss Save Error - Please check the log", false, "Ok")
		else
			ShowMessage("User settings saved successfully to Config file", false, "Ok")
		endIf
EndFunction

Function Begin_Config_Load()
	FISSInterface fiss = FISSFactory.getFISS()
	
	If !fiss && Utility.IsInMenuMode()
		ShowMessage("FISS not installed, unable to load user settings from config file", false, "Ok")
		return
	endIf
	
	fiss.beginLoad("SKY_UI.xml")	

;---------------
	
	_itemXBase = fiss.loadFloat("_itemXBase")
	_itemXBaseW = fiss.loadFloat("_itemXBaseW")
	
	_3DItemScale = fiss.loadFloat("_3DItemScale")
	_3DItemYOffset = fiss.loadFloat("_3DItemYOffset")
	_3DItemXOffset = fiss.loadFloat("_3DItemXOffset")
	
	_fInventory3DItemPosX = fiss.loadFloat("_fInventory3DItemPosX")
	_fInventory3DItemPosXWide = fiss.loadFloat("_fInventory3DItemPosXWide")	
	
	_fInventory3DItemPosScale = fiss.loadFloat("_fInventory3DItemPosScale")		
	_fInventory3DItemPosScaleWide = fiss.loadFloat("_fInventory3DItemPosScaleWide")
	
	_fInventory3DItemPosZ = fiss.loadFloat("_fInventory3DItemPosZ")
	_fInventory3DItemPosZWide = fiss.loadFloat("_fInventory3DItemPosZWide")
	
	_fMagic3DItemPosZ = fiss.loadFloat("_fMagic3DItemPosZ")
	_fMagic3DItemPosZWide = fiss.loadFloat("_fMagic3DItemPosZWide")
	
	_fMagic3DItemPosX = fiss.loadFloat("_fMagic3DItemPosX")
	_fMagic3DItemPosXWide = fiss.loadFloat("_fMagic3DItemPosXWide")
	
	_fMagic3DItemPosScale = fiss.loadFloat("_fMagic3DItemPosScale")	
	_fMagic3DItemPosScaleWide = fiss.loadFloat("_fMagic3DItemPosScaleWide")
		
	_3DItemDisablePositioning = fiss.loadBool("_3DItemDisablePositioning")	
	
	Apply3DItemXOffset()
	Apply3DItemYOffset()
	Apply3DItemScale()
	
;---------------

	_itemlistNoIconColors = fiss.loadBool("_itemlistNoIconColors")
	SKI_SettingsManagerInstance.SetOverride("Appearance$icons$item$noColor", _itemlistNoIconColors)	
	
;---------------	
	
	_categoryIconThemeIdx = fiss.loadInt("_categoryIconThemeIdx")
	SKI_SettingsManagerInstance.SetOverride("Appearance$icons$category$source", _categoryIconThemeValues[_categoryIconThemeIdx])
	
;---------------

	_itemcardAlignIdx = fiss.loadInt("_itemcardAlignIdx")
	if _itemcardAlignIdx < _alignments.length - 1
		_itemcardAlignIdx += 1
	else
		_itemcardAlignIdx = 0
	endIf
	SKI_SettingsManagerInstance.SetOverride("ItemInfo$itemcard$align", _alignmentValues[_itemcardAlignIdx])
	
;---------------
		
	_itemlistQuantityMinCount = fiss.loadInt("_itemlistQuantityMinCount")
	SKI_SettingsManagerInstance.SetOverride("ItemList$quantityMenu$minCount", _itemlistQuantityMinCount)

;---------------

	_itemcardXOffset = fiss.loadFloat("_itemcardXOffset")
	_itemcardYOffset = fiss.loadFloat("_itemcardYOffset")	
	SKI_SettingsManagerInstance.SetOverride("ItemInfo$itemcard$xOffset", _itemcardXOffset)
	SKI_SettingsManagerInstance.SetOverride("ItemInfo$itemcard$yOffset", _itemcardYOffset)

;---------------
	
	_effectWidgetHAnchorIdx = fiss.loadInt("_effectWidgetHAnchorIdx")
	_effectWidgetVAnchorIdx = fiss.loadInt("_effectWidgetVAnchorIdx")
	_effectWidgetYOffset = fiss.loadFloat("_effectWidgetYOffset")
	
	if _effectWidgetVAnchorIdx < _vertAlignments.length - 1
		_effectWidgetVAnchorIdx += 1
	else
		_effectWidgetVAnchorIdx = 0
	endIf
	SKI_ActiveEffectsWidgetInstance.VAnchor = _vertAlignmentValues[_effectWidgetVAnchorIdx]
	SKI_ActiveEffectsWidgetInstance.Y = _vertAlignmentBaseOffsets[_effectWidgetVAnchorIdx] + _effectWidgetYOffset	
		
	
	_effectWidgetXOffset = fiss.loadFloat("_effectWidgetXOffset")	
	if _effectWidgetHAnchorIdx < _alignments.length - 1
		_effectWidgetHAnchorIdx += 1
	else
		_effectWidgetHAnchorIdx = 0
	endIf
	SKI_ActiveEffectsWidgetInstance.HAnchor = _alignmentValues[_effectWidgetHAnchorIdx]
	SKI_ActiveEffectsWidgetInstance.X = _alignmentBaseOffsets[_effectWidgetHAnchorIdx] + _effectWidgetXOffset

;---------------
	
	_effectWidgetGroupCount = fiss.loadInt("_effectWidgetGroupCount")
	SKI_ActiveEffectsWidgetInstance.GroupEffectCount = _effectWidgetGroupCount

;---------------
	
	_effectWidgetIconSizeIdx = fiss.loadInt("_effectWidgetIconSizeIdx")
	if _effectWidgetIconSizeIdx < _sizes.length - 1
		_effectWidgetIconSizeIdx += 1
	else
		_effectWidgetIconSizeIdx = 0
	endIf
	SKI_ActiveEffectsWidgetInstance.EffectSize = _effectWidgetIconSizeValues[_effectWidgetIconSizeIdx]
		
;---------------		

	_effectWidgetOrientationIdx = fiss.loadInt("_effectWidgetOrientationIdx")
	if _effectWidgetOrientationIdx < _orientations.length - 1
		_effectWidgetOrientationIdx += 1
	else
		_effectWidgetOrientationIdx = 0
	endIf
	SKI_ActiveEffectsWidgetInstance.Orientation = _orientationValues[_effectWidgetOrientationIdx]

;---------------
		
	_switchTabButton = fiss.loadInt("_switchTabButton")
	SetKeyMapOptionValueST(_switchTabButton, true, "SWITCH_TAB_BUTTON")
	SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$switchTab", _switchTabButton)		

	_switchTabKey = fiss.loadInt("_switchTabKey")
	SetKeyMapOptionValueST(_switchTabKey, true, "SWITCH_TAB_KEY")
	SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$switchTab", _switchTabKey)
	
	_equipModeKey = fiss.loadInt("_equipModeKey")
	SetKeyMapOptionValueST(_equipModeKey, true, "EQUIP_MODE_KEY")
	SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$equipMode", _equipModeKey)
		
	_searchKey = fiss.loadInt("_searchKey")
	SetKeyMapOptionValueST(_searchKey, true, "SEARCH_KEY")
	SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$search", _searchKey)
		
	_sortOrderButton = fiss.loadInt("_sortOrderButton")
	SetKeyMapOptionValueST(_sortOrderButton, true, "SORT_ORDER_BUTTON")
	SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$sortOrder", _sortOrderButton)
		
	_nextColumnButton = fiss.loadInt("_nextColumnButton")
	SetKeyMapOptionValueST(_nextColumnButton, true, "NEXT_COLUMN_BUTTON")
	SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$nextColumn", _nextColumnButton)

	_prevColumnButton = fiss.loadInt("_prevColumnButton")
	SetKeyMapOptionValueST(_prevColumnButton, true, "PREV_COLUMN_BUTTON")
	SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$prevColumn", _prevColumnButton)	
	
;---------------
	
	_itemlistFontSizeIdx = fiss.loadInt("_itemlistFontSizeIdx")
	if _itemlistFontSizeIdx < _sizes.length - 1
		_itemlistFontSizeIdx += 1
	else
		_itemlistFontSizeIdx = 0
	endIf
	ApplyItemListFontSize()

;---------------	

	string loadResult = fiss.endLoad()
		If (loadResult != "")
			if Utility.IsInMenuMode()
				ShowMessage("Fiss Load Error - No config file found", false, "Ok")
			endIf
		else
			if Utility.IsInMenuMode()
				ShowMessage("User settings loaded successfully from Config file", false, "Ok")
				ForcePageReset()
			endIF
		endIf
EndFunction	

function OnGameReload()

	parent.OnGameReload()
	ApplySettings()
endFunction

Bool function ValidateKey(Int a_keyCode, Bool a_gamepad)

	if a_keyCode == 1
		return false
	endIf
	Bool isGamepad = game.UsingGamepad()
	if isGamepad != a_gamepad
		return false
	endIf
	if !isGamepad
		if a_keyCode > 255
			ShowMessage("$SKI_MSG1", false, "$OK", "$Cancel")
			return false
		endIf
	elseIf a_keyCode < 266
		return false
	endIf
	return true
endFunction

function Apply3DItemYOffset()

	if _3DItemDisablePositioning
		utility.SetINIFloat("fInventory3DItemPosZWide:Interface", _fInventory3DItemPosZWide)
		utility.SetINIFloat("fInventory3DItemPosZ:Interface", _fInventory3DItemPosZ)
		utility.SetINIFloat("fMagic3DItemPosZWide:Interface", _fMagic3DItemPosZWide)
		utility.SetINIFloat("fMagic3DItemPosZ:Interface", _fMagic3DItemPosZ)
	else
		utility.SetINIFloat("fInventory3DItemPosZWide:Interface", 12 as Float + _3DItemYOffset)
		utility.SetINIFloat("fInventory3DItemPosZ:Interface", 16 as Float + _3DItemYOffset)
		utility.SetINIFloat("fMagic3DItemPosZWide:Interface", 12 as Float + _3DItemYOffset)
		utility.SetINIFloat("fMagic3DItemPosZ:Interface", 16 as Float + _3DItemYOffset)
	endIf
endFunction

function SwapItemListKey(Int a_newKey, Int a_curKey)

	if a_newKey == _searchKey
		_searchKey = a_curKey
		SetKeyMapOptionValueST(_searchKey, true, "SEARCH_KEY")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$search", _searchKey)
	elseIf a_newKey == _switchTabKey
		_switchTabKey = a_curKey
		SetKeyMapOptionValueST(_switchTabKey, true, "SWITCH_TAB_KEY")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$switchTab", _switchTabKey)
	elseIf a_newKey == _equipModeKey
		_equipModeKey = a_curKey
		SetKeyMapOptionValueST(_equipModeKey, true, "EQUIP_MODE_KEY")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$equipMode", _equipModeKey)
	elseIf a_newKey == _switchTabButton
		_switchTabButton = a_curKey
		SetKeyMapOptionValueST(_switchTabButton, true, "SWITCH_TAB_BUTTON")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$switchTab", _switchTabButton)
	elseIf a_newKey == _prevColumnButton
		_prevColumnButton = a_curKey
		SetKeyMapOptionValueST(_prevColumnButton, true, "PREV_COLUMN_BUTTON")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$prevColumn", _prevColumnButton)
	elseIf a_newKey == _nextColumnButton
		_nextColumnButton = a_curKey
		SetKeyMapOptionValueST(_nextColumnButton, true, "NEXT_COLUMN_BUTTON")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$nextColumn", _nextColumnButton)
	elseIf a_newKey == _sortOrderButton
		_sortOrderButton = a_curKey
		SetKeyMapOptionValueST(_sortOrderButton, true, "SORT_ORDER_BUTTON")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$sortOrder", _sortOrderButton)
	endIf
endFunction

function SetCurrentFavoriteGroup(Int a_index)

	Int ARMOR_FLAG = SKI_FavoritesManagerInstance.GROUP_FLAG_UNEQUIP_ARMOR
	Int HANDS_FLAG = SKI_FavoritesManagerInstance.GROUP_FLAG_UNEQUIP_HANDS
	SetToggleOptionValueST(SKI_FavoritesManagerInstance.GetGroupFlag(_favCurGroupIdx, ARMOR_FLAG), true, "FAV_GROUP_UNEQUIP_ARMOR")
	SetToggleOptionValueST(SKI_FavoritesManagerInstance.GetGroupFlag(_favCurGroupIdx, HANDS_FLAG), true, "FAV_GROUP_UNEQUIP_HANDS")
endFunction

function SetFavoritesGroupHotkey(Int a_groupIndex, Int a_keyCode, String a_conflictControl, String a_conflictName)

	Bool continue = true
	if a_conflictControl != "" && a_conflictName != ModName
		String msg
		if a_conflictName != ""
			msg = "$SKI_MSG2{" + a_conflictControl + " (" + a_conflictName + ")}"
		else
			msg = "$SKI_MSG2{" + a_conflictControl + "}"
		endIf
		continue = ShowMessage(msg, true, "$Yes", "$No")
	endIf
	if !continue
		return 
	endIf
	if !SKI_FavoritesManagerInstance.SetGroupHotkey(a_groupIndex, a_keyCode)
		return 
	endIf
	Int[] groupHotkeys = SKI_FavoritesManagerInstance.GetGroupHotkeys()
	SetKeyMapOptionValueST(groupHotkeys[0], true, "FAV_GROUP_USE_HOTKEY1")
	SetKeyMapOptionValueST(groupHotkeys[1], true, "FAV_GROUP_USE_HOTKEY2")
	SetKeyMapOptionValueST(groupHotkeys[2], true, "FAV_GROUP_USE_HOTKEY3")
	SetKeyMapOptionValueST(groupHotkeys[3], true, "FAV_GROUP_USE_HOTKEY4")
	SetKeyMapOptionValueST(groupHotkeys[4], true, "FAV_GROUP_USE_HOTKEY5")
	SetKeyMapOptionValueST(groupHotkeys[5], true, "FAV_GROUP_USE_HOTKEY6")
	SetKeyMapOptionValueST(groupHotkeys[6], true, "FAV_GROUP_USE_HOTKEY7")
	SetKeyMapOptionValueST(groupHotkeys[7], false, "FAV_GROUP_USE_HOTKEY8")
endFunction

; Skipped compiler generated GotoState

function Apply3DItemScale()

	if _3DItemDisablePositioning
		utility.SetINIFloat("fInventory3DItemPosScaleWide:Interface", _fInventory3DItemPosScaleWide)
		utility.SetINIFloat("fMagic3DItemPosScaleWide:Interface", _fMagic3DItemPosScaleWide)
		utility.SetINIFloat("fInventory3DItemPosScale:Interface", _fInventory3DItemPosScale)
		utility.SetINIFloat("fMagic3DItemPosScale:Interface", _fMagic3DItemPosScale)
	else
		utility.SetINIFloat("fInventory3DItemPosScaleWide:Interface", _3DItemScale)
		utility.SetINIFloat("fMagic3DItemPosScaleWide:Interface", _3DItemScale)
		utility.SetINIFloat("fInventory3DItemPosScale:Interface", _3DItemScale)
		utility.SetINIFloat("fMagic3DItemPosScale:Interface", _3DItemScale)
	endIf
endFunction

function OnVersionUpdate(Int a_version)

	if a_version >= 2 && CurrentVersion < 2
		debug.Trace(self + ": Updating to script version 2", 0)
		_categoryIconThemeShortNames = new String[4]
		_categoryIconThemeShortNames[0] = "SKYUI V3"
		_categoryIconThemeShortNames[1] = "CELTIC"
		_categoryIconThemeShortNames[2] = "CURVED"
		_categoryIconThemeShortNames[3] = "STRAIGHT"
		_categoryIconThemeLongNames = new String[4]
		_categoryIconThemeLongNames[0] = "SkyUI V3, by PsychoSteve"
		_categoryIconThemeLongNames[1] = "Celtic, by GreatClone"
		_categoryIconThemeLongNames[2] = "Curved, by T3T"
		_categoryIconThemeLongNames[3] = "Straight, by T3T"
		_categoryIconThemeValues = new String[4]
		_categoryIconThemeValues[0] = "skyui\\icons_category_psychosteve.swf"
		_categoryIconThemeValues[1] = "skyui\\icons_category_celtic.swf"
		_categoryIconThemeValues[2] = "skyui\\icons_category_curved.swf"
		_categoryIconThemeValues[3] = "skyui\\icons_category_straight.swf"
		SKI_SettingsManagerInstance.ClearOverride("Input$controls$search")
		SKI_SettingsManagerInstance.ClearOverride("Input$controls$switchTab")
		SKI_SettingsManagerInstance.ClearOverride("Input$controls$equipMode")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$search", _searchKey)
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$switchTab", _switchTabKey)
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$equipMode", _equipModeKey)
	endIf
	if a_version >= 3 && CurrentVersion < 3
		debug.Trace(self + ": Updating to script version 3", 0)
		_3DItemFlags = OPTION_FLAG_NONE
	endIf
	if a_version >= 4 && CurrentVersion < 4
		debug.Trace(self + ": Updating to script version 4", 0)
		_orientations = new String[2]
		_orientations[0] = "$Horizontal"
		_orientations[1] = "$Vertical"
		_orientationValues = new String[2]
		_orientationValues[0] = "horizontal"
		_orientationValues[1] = "vertical"
		_vertAlignments = new String[3]
		_vertAlignments[0] = "$Top"
		_vertAlignments[1] = "$Bottom"
		_vertAlignments[2] = "$Center"
		_vertAlignmentValues = new String[3]
		_vertAlignmentValues[0] = "top"
		_vertAlignmentValues[1] = "bottom"
		_vertAlignmentValues[2] = "center"
		_effectWidgetIconSizeValues = new Float[3]
		_effectWidgetIconSizeValues[0] = 32.0000
		_effectWidgetIconSizeValues[1] = 48.0000
		_effectWidgetIconSizeValues[2] = 64.0000
		_alignmentBaseOffsets = new Float[3]
		_alignmentBaseOffsets[0] = 0.000000
		_alignmentBaseOffsets[1] = 1280.00
		_alignmentBaseOffsets[2] = 640.000
		_vertAlignmentBaseOffsets = new Float[3]
		_vertAlignmentBaseOffsets[0] = 0.000000
		_vertAlignmentBaseOffsets[1] = 720.000
		_vertAlignmentBaseOffsets[2] = 360.000
		_effectWidgetFlags = OPTION_FLAG_NONE
		SKI_ActiveEffectsWidgetInstance.Enabled = true
		SKI_ActiveEffectsWidgetInstance.EffectSize = _effectWidgetIconSizeValues[_effectWidgetIconSizeIdx]
		SKI_ActiveEffectsWidgetInstance.HAnchor = _alignmentValues[_effectWidgetHAnchorIdx]
		SKI_ActiveEffectsWidgetInstance.VAnchor = _vertAlignmentValues[_effectWidgetVAnchorIdx]
		SKI_ActiveEffectsWidgetInstance.GroupEffectCount = _effectWidgetGroupCount
		SKI_ActiveEffectsWidgetInstance.Orientation = _orientationValues[_effectWidgetOrientationIdx]
		SKI_ActiveEffectsWidgetInstance.X = _alignmentBaseOffsets[_effectWidgetHAnchorIdx] + _effectWidgetXOffset
		SKI_ActiveEffectsWidgetInstance.Y = _vertAlignmentBaseOffsets[_effectWidgetVAnchorIdx] + _effectWidgetYOffset
	endIf
	if a_version >= 5 && CurrentVersion < 5
		debug.Trace(self + ": Updating to script version 5", 0)
	endIf
	if a_version >= 6 && CurrentVersion < 6
		debug.Trace(self + ": Updating to script version 6", 0)
		Pages = new String[3]
		Pages[0] = "$General"
		Pages[1] = "$Favorite Groups"
		Pages[2] = "$Advanced"
		_favGroupNames = new String[8]
		_favGroupNames[0] = "$Group {1}"
		_favGroupNames[1] = "$Group {2}"
		_favGroupNames[2] = "$Group {3}"
		_favGroupNames[3] = "$Group {4}"
		_favGroupNames[4] = "$Group {5}"
		_favGroupNames[5] = "$Group {6}"
		_favGroupNames[6] = "$Group {7}"
		_favGroupNames[7] = "$Group {8}"
	endIf
	if a_version >= 7 && CurrentVersion < 7
		debug.Trace(self + ": Updating to script version 7", 0)
		Pages = new String[3]
		Pages[0] = "$General"
		Pages[1] = "$Controls"
		Pages[2] = "$Advanced"
	endIf
	if a_version >= 8 && CurrentVersion < 8
		debug.Trace(self + ": Updating to script version 8", 0)
		_categoryIconThemeShortNames = new String[1]
		_categoryIconThemeShortNames[0] = "SKYUI V5"
		_categoryIconThemeLongNames = new String[1]
		_categoryIconThemeLongNames[0] = "SkyUI V5, by PsychoSteve"
		_categoryIconThemeValues = new String[1]
		_categoryIconThemeValues[0] = "skyui\\icons_category_psychosteve.swf"
		_categoryIconThemeIdx = 0
		SKI_SettingsManagerInstance.ClearOverride("Appearance$icons$category$source")
		SKI_SettingsManagerInstance.SetOverride("Appearance$icons$category$source", _categoryIconThemeValues[_categoryIconThemeIdx])
	endIf
	if a_version >= 9 && CurrentVersion < 9
		debug.Trace(self + ": Updating to script version 9", 0)
		_categoryIconThemeShortNames = new String[4]
		_categoryIconThemeShortNames[0] = "SKYUI V5"
		_categoryIconThemeShortNames[1] = "CELTIC"
		_categoryIconThemeShortNames[2] = "CURVED"
		_categoryIconThemeShortNames[3] = "STRAIGHT"
		_categoryIconThemeLongNames = new String[4]
		_categoryIconThemeLongNames[0] = "SkyUI V5, by PsychoSteve"
		_categoryIconThemeLongNames[1] = "Celtic, by GreatClone"
		_categoryIconThemeLongNames[2] = "Curved, by T3T"
		_categoryIconThemeLongNames[3] = "Straight, by T3T"
		_categoryIconThemeValues = new String[4]
		_categoryIconThemeValues[0] = "skyui\\icons_category_psychosteve.swf"
		_categoryIconThemeValues[1] = "skyui\\icons_category_celtic.swf"
		_categoryIconThemeValues[2] = "skyui\\icons_category_curved.swf"
		_categoryIconThemeValues[3] = "skyui\\icons_category_straight.swf"
	endIf
endFunction

function OnConfigInit()

	_alignments = new String[3]
	_alignments[0] = "$Left"
	_alignments[1] = "$Right"
	_alignments[2] = "$Center"
	_sizes = new String[3]
	_sizes[0] = "$Small"
	_sizes[1] = "$Medium"
	_sizes[2] = "$Large"
	_alignmentValues = new String[3]
	_alignmentValues[0] = "left"
	_alignmentValues[1] = "right"
	_alignmentValues[2] = "center"
	ApplySettings()
endFunction

function RefreshFavoriteHotkeys()

	SetKeyMapOptionValueST(SKI_FavoritesManagerInstance.GroupAddKey, true, "FAV_GROUP_ADD_KEY")
	SetKeyMapOptionValueST(SKI_FavoritesManagerInstance.GroupUseKey, true, "FAV_GROUP_USE_KEY")
	SetKeyMapOptionValueST(SKI_FavoritesManagerInstance.SetIconKey, true, "FAV_SET_ICON_KEY")
	SetKeyMapOptionValueST(SKI_FavoritesManagerInstance.ToggleFocusKey, true, "FAV_TOGGLE_FOCUS")
	SetKeyMapOptionValueST(SKI_FavoritesManagerInstance.SaveEquipStateKey, false, "FAV_EQUIP_STATE_KEY")
endFunction

String function GetCustomControl(Int a_keyCode)

	Int[] groupHotkeys = SKI_FavoritesManagerInstance.GetGroupHotkeys()
	Int index = groupHotkeys.find(a_keyCode, 0)
	if index != -1
		return "Group " + (index + 1)
	endIf
	return ""
endFunction

; Skipped compiler generated GetState

function Apply3DItemXOffset()

	if _3DItemDisablePositioning
		utility.SetINIFloat("fInventory3DItemPosXWide:Interface", _fInventory3DItemPosXWide)
		utility.SetINIFloat("fInventory3DItemPosX:Interface", _fInventory3DItemPosX)
		utility.SetINIFloat("fMagic3DItemPosXWide:Interface", _fMagic3DItemPosXWide)
		utility.SetINIFloat("fMagic3DItemPosX:Interface", _fMagic3DItemPosX)
	else
		utility.SetINIFloat("fInventory3DItemPosXWide:Interface", _itemXBaseW + _3DItemXOffset)
		utility.SetINIFloat("fInventory3DItemPosX:Interface", _itemXBase + _3DItemXOffset)
		utility.SetINIFloat("fMagic3DItemPosXWide:Interface", _itemXBaseW + _3DItemXOffset)
		utility.SetINIFloat("fMagic3DItemPosX:Interface", _itemXBase + _3DItemXOffset)
	endIf
endFunction

function ApplySettings()

	_fInventory3DItemPosXWide = utility.GetINIFloat("fInventory3DItemPosXWide:Interface")
	_fInventory3DItemPosX = utility.GetINIFloat("fInventory3DItemPosX:Interface")
	_fMagic3DItemPosXWide = utility.GetINIFloat("fMagic3DItemPosXWide:Interface")
	_fMagic3DItemPosX = utility.GetINIFloat("fMagic3DItemPosX:Interface")
	_fInventory3DItemPosZWide = utility.GetINIFloat("fInventory3DItemPosZWide:Interface")
	_fInventory3DItemPosZ = utility.GetINIFloat("fInventory3DItemPosZ:Interface")
	_fMagic3DItemPosZWide = utility.GetINIFloat("fMagic3DItemPosZWide:Interface")
	_fMagic3DItemPosZ = utility.GetINIFloat("fMagic3DItemPosZ:Interface")
	_fInventory3DItemPosScaleWide = utility.GetINIFloat("fInventory3DItemPosScaleWide:Interface")
	_fMagic3DItemPosScaleWide = utility.GetINIFloat("fMagic3DItemPosScaleWide:Interface")
	_fInventory3DItemPosScale = utility.GetINIFloat("fInventory3DItemPosScale:Interface")
	_fMagic3DItemPosScale = utility.GetINIFloat("fMagic3DItemPosScale:Interface")
	Float h = utility.GetINIInt("iSize H:Display") as Float
	Float w = utility.GetINIInt("iSize W:Display") as Float
	Float ar = w / h
	if ar == 1.60000
		_itemXBaseW = -32.4583
	else
		_itemXBaseW = -29.1225
	endIf
	if ar == 1.25000
		_itemXBase = -41.6225
	else
		_itemXBase = -39.1225
	endIf
	Apply3DItemXOffset()
	Apply3DItemYOffset()
	Apply3DItemScale()
endFunction

Int function GetVersion()

	return 9
endFunction

function OnPageReset(String a_page)

	if a_page == ""
		LoadCustomContent("skyui/skyui_splash.swf", 0.000000, 0.000000)
		return 
	else
		UnloadCustomContent()
	endIf
	if a_page == "$General"
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$Item List", 0)
		AddTextOptionST("ITEMLIST_FONT_SIZE", "$Font Size", _sizes[_itemlistFontSizeIdx], 0)
		AddSliderOptionST("ITEMLIST_QUANTITY_MIN_COUNT", "$Quantity Menu Min. Count", _itemlistQuantityMinCount as Float, "{0}", 0)
		AddMenuOptionST("ITEMLIST_CATEGORY_ICON_THEME", "$Category Icon Theme", _categoryIconThemeShortNames[_categoryIconThemeIdx], 0)
		AddToggleOptionST("ITEMLIST_NO_ICON_COLORS", "$Disable Icon Colors", _itemlistNoIconColors, 0)
		AddEmptyOption()
		AddHeaderOption("$Active Effects HUD", 0)
		AddToggleOptionST("EFFECT_WIDGET_ENABLED", "$Enabled", SKI_ActiveEffectsWidgetInstance.Enabled, 0)
		AddTextOptionST("EFFECT_WIDGET_ICON_SIZE", "$Icon Size", _sizes[_effectWidgetIconSizeIdx], _effectWidgetFlags)
		AddSliderOptionST("EFFECT_WIDGET_MIN_TIME_LEFT", "$Minimum Time Left", SKI_ActiveEffectsWidgetInstance.MinimumTimeLeft as Float, "{0} s", _effectWidgetFlags)
		SetCursorPosition(1)
		AddHeaderOption("$Favorites Menu", 0)
		AddToggleOptionST("FAV_MENU_HELP_ENABLED", "$Show Button Help", SKI_FavoritesManagerInstance.ButtonHelpEnabled, 0)
		AddEmptyOption()
		Int ARMOR_FLAG = SKI_FavoritesManagerInstance.GROUP_FLAG_UNEQUIP_ARMOR
		Int HANDS_FLAG = SKI_FavoritesManagerInstance.GROUP_FLAG_UNEQUIP_HANDS
		AddHeaderOption("$Favorite Groups", 0)
		AddMenuOptionST("FAV_GROUP_SELECT", "", "$Group {" + (_favCurGroupIdx + 1) + "}", 0)
		AddToggleOptionST("FAV_GROUP_UNEQUIP_ARMOR", "$Unequip Armor", SKI_FavoritesManagerInstance.GetGroupFlag(_favCurGroupIdx, ARMOR_FLAG), 0)
		AddToggleOptionST("FAV_GROUP_UNEQUIP_HANDS", "$Unequip Hands", SKI_FavoritesManagerInstance.GetGroupFlag(_favCurGroupIdx, HANDS_FLAG), 0)
		AddEmptyOption()
		AddHeaderOption("Profile Settings:")
		AddTextOptionST("Config_Save", "FISS - User Profile", GetConfigSaveString(), 0)
		AddTextOptionST("Config_Load", "FISS - User Profile", GetConfigLoadString(), 0)
	elseIf a_page == "$Controls"
		Bool isGamepad = game.UsingGamepad()
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$Item List", 0)
		if !isGamepad
			AddKeyMapOptionST("SEARCH_KEY", "$Search", _searchKey, 0)
			AddKeyMapOptionST("SWITCH_TAB_KEY", "$Switch Tab", _switchTabKey, 0)
			AddKeyMapOptionST("EQUIP_MODE_KEY", "$Equip Mode", _equipModeKey, 0)
		else
			AddKeyMapOptionST("SEARCH_KEY", "$Search", _searchKey, OPTION_FLAG_DISABLED)
			AddKeyMapOptionST("SWITCH_TAB_BUTTON", "$Switch Tab", _switchTabButton, 0)
			AddKeyMapOptionST("PREV_COLUMN_BUTTON", "$Previous Column", _prevColumnButton, 0)
			AddKeyMapOptionST("NEXT_COLUMN_BUTTON", "$Next Column", _nextColumnButton, 0)
			AddKeyMapOptionST("SORT_ORDER_BUTTON", "$Order", _sortOrderButton, 0)
		endIf
		if !isGamepad
			AddEmptyOption()
			AddHeaderOption("$Favorites Menu", 0)
			AddKeyMapOptionST("FAV_GROUP_ADD_KEY", "{$Group}/{$Ungroup}", SKI_FavoritesManagerInstance.GroupAddKey, 0)
			AddKeyMapOptionST("FAV_GROUP_USE_KEY", "$Group Use", SKI_FavoritesManagerInstance.GroupUseKey, 0)
			AddKeyMapOptionST("FAV_SET_ICON_KEY", "$Set Group Icon", SKI_FavoritesManagerInstance.SetIconKey, 0)
			AddKeyMapOptionST("FAV_EQUIP_STATE_KEY", "$Save Equip State", SKI_FavoritesManagerInstance.SaveEquipStateKey, 0)
			AddKeyMapOptionST("FAV_TOGGLE_FOCUS", "$Toggle Focus", SKI_FavoritesManagerInstance.ToggleFocusKey, 0)
		endIf
		SetCursorPosition(1)
		Int[] groupHotkeys = SKI_FavoritesManagerInstance.GetGroupHotkeys()
		AddHeaderOption("$Favorite Groups", 0)
		AddKeyMapOptionST("FAV_GROUP_USE_HOTKEY1", "$Group {1}", groupHotkeys[0], OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("FAV_GROUP_USE_HOTKEY2", "$Group {2}", groupHotkeys[1], OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("FAV_GROUP_USE_HOTKEY3", "$Group {3}", groupHotkeys[2], OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("FAV_GROUP_USE_HOTKEY4", "$Group {4}", groupHotkeys[3], OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("FAV_GROUP_USE_HOTKEY5", "$Group {5}", groupHotkeys[4], OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("FAV_GROUP_USE_HOTKEY6", "$Group {6}", groupHotkeys[5], OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("FAV_GROUP_USE_HOTKEY7", "$Group {7}", groupHotkeys[6], OPTION_FLAG_WITH_UNMAP)
		AddKeyMapOptionST("FAV_GROUP_USE_HOTKEY8", "$Group {8}", groupHotkeys[7], OPTION_FLAG_WITH_UNMAP)
	elseIf a_page == "$Advanced"
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$3D Item", 0)
		AddSliderOptionST("XD_ITEM_XOFFSET", "$Horizontal Offset", _3DItemXOffset, "{0}", _3DItemFlags)
		AddSliderOptionST("XD_ITEM_YOFFSET", "$Vertical Offset", _3DItemYOffset, "{0}", _3DItemFlags)
		AddSliderOptionST("XD_ITEM_SCALE", "$Scale", _3DItemScale, "{1}", _3DItemFlags)
		AddToggleOptionST("XD_ITEM_POSITIONING", "$Disable Positioning", _3DItemDisablePositioning, 0)
		AddEmptyOption()
		AddHeaderOption("$Active Effects HUD", 0)
		AddTextOptionST("EFFECT_WIDGET_ORIENTATION", "$Orientation", _orientations[_effectWidgetOrientationIdx], _effectWidgetFlags)
		AddTextOptionST("EFFECT_WIDGET_HORIZONTAL_ANCHOR", "$Horizontal Anchor", _alignments[_effectWidgetHAnchorIdx], _effectWidgetFlags)
		AddTextOptionST("EFFECT_WIDGET_VERTICAL_ANCHOR", "$Vertical Anchor", _vertAlignments[_effectWidgetVAnchorIdx], _effectWidgetFlags)
		AddSliderOptionST("EFFECT_WIDGET_GROUP_COUNT", "$Icon Group Count", SKI_ActiveEffectsWidgetInstance.GroupEffectCount as Float, "{0}", _effectWidgetFlags)
		AddSliderOptionST("EFFECT_WIDGET_XOFFSET", "$Horizontal Offset", _effectWidgetXOffset, "{0}", _effectWidgetFlags)
		AddSliderOptionST("EFFECT_WIDGET_YOFFSET", "$Vertical Offset", _effectWidgetYOffset, "{0}", _effectWidgetFlags)
		SetCursorPosition(1)
		AddHeaderOption("$Item Card", 0)
		AddTextOptionST("ITEMCARD_ALIGN", "$Align", _alignments[_itemcardAlignIdx], 0)
		AddSliderOptionST("ITEMCARD_XOFFSET", "$Horizontal Offset", _itemcardXOffset, "{0}", 0)
		AddSliderOptionST("ITEMCARD_YOFFSET", "$Vertical Offset", _itemcardYOffset, "{0}", 0)
		AddEmptyOption()
		AddHeaderOption("$SWF Version Checking", 0)
		AddToggleOptionST("CHECK_MAP_MENU", "Map Menu", SKI_MainInstance.MapMenuCheckEnabled, 0)
		AddToggleOptionST("CHECK_FAVORITES_MENU", "Favorites Menu", SKI_MainInstance.FavoritesMenuCheckEnabled, 0)
		AddToggleOptionST("CHECK_INVENTORY_MENU", "Inventory Menu", SKI_MainInstance.InventoryMenuCheckEnabled, 0)
		AddToggleOptionST("CHECK_MAGIC_MENU", "Magic Menu", SKI_MainInstance.MagicMenuCheckEnabled, 0)
		AddToggleOptionST("CHECK_BARTER_MENU", "Barter Menu", SKI_MainInstance.BarterMenuCheckEnabled, 0)
		AddToggleOptionST("CHECK_CONTAINER_MENU", "Container Menu", SKI_MainInstance.ContainerMenuCheckEnabled, 0)
		AddToggleOptionST("CHECK_CRAFTING_MENU", "Crafting Menu", SKI_MainInstance.CraftingMenuCheckEnabled, 0)
		AddToggleOptionST("CHECK_GIFT_MENU", "Gift Menu", SKI_MainInstance.GiftMenuCheckEnabled, 0)		
	endIf
endFunction

state Config_Save

	Event OnSelectST()
	
		Begin_Config_Save()
	EndEvent

	Event OnHighlightST()

		SetInfoText("Save current settings to Config File (Requires FISS)")
	EndEvent
endState

state Config_Load

	Event OnSelectST()
		
		Begin_Config_Load()
	EndEvent

	Event OnHighlightST()

		SetInfoText("Load user settings from Config File (Requires FISS)")
	EndEvent
endState

String function GetConfigSaveString()
	
		if (Game.GetModByName("Fiss.esp") != 255)
			Status_Return = "Save Preset"
		else
			Status_Return = "FISS Not Found"
		endIf
	return Status_Return
endFunction	

String function GetConfigLoadString()

		if (Game.GetModByName("Fiss.esp") != 255)
			Status_Return = "Load Preset"
		else
			Status_Return = "FISS Not Found"
		endIf
	return Status_Return
endFunction	

function ApplyItemListFontSize()

	if _itemlistFontSizeIdx == 0
		SKI_SettingsManagerInstance.SetOverride("ListLayout$defaults$label$textFormat$size", "12")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$defaults$entry$textFormat$size", "13")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$vars$n_iconSize$value", "16")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$vars$a_textBorder$value", "<0, 0, 0.3, 0>")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$columns$equipColumn$indent", "-25")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$columns$equipColumn$border", "<0, 10, 2, 2>")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$columns$iconColumn$border", "<0, 3, 2, 2>")
	elseIf _itemlistFontSizeIdx == 1
		SKI_SettingsManagerInstance.SetOverride("ListLayout$defaults$label$textFormat$size", "12")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$defaults$entry$textFormat$size", "14")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$vars$n_iconSize$value", "18")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$vars$a_textBorder$value", "<0, 0, 1.1, 0>")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$columns$equipColumn$indent", "-28")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$columns$equipColumn$border", "<0, 10, 3, 3>")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$columns$iconColumn$border", "<0, 3, 3, 3>")
	else
		SKI_SettingsManagerInstance.SetOverride("ListLayout$defaults$label$textFormat$size", "14")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$defaults$entry$textFormat$size", "18")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$vars$n_iconSize$value", "20")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$vars$a_textBorder$value", "<0, 0, 0.4, 0>")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$columns$equipColumn$indent", "-30")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$columns$equipColumn$border", "<0, 10, 3.2, 3.2>")
		SKI_SettingsManagerInstance.SetOverride("ListLayout$columns$iconColumn$border", "<0, 4, 3.2, 3.2>")
	endIf
endFunction

;-- State -------------------------------------------
state XD_ITEM_POSITIONING

	function OnDefaultST()

		_3DItemDisablePositioning = false
		_3DItemFlags = OPTION_FLAG_NONE
		SetOptionFlagsST(_3DItemFlags, true, "XD_ITEM_XOFFSET")
		SetOptionFlagsST(_3DItemFlags, true, "XD_ITEM_YOFFSET")
		SetOptionFlagsST(_3DItemFlags, true, "XD_ITEM_SCALE")
		SetToggleOptionValueST(false, false, "")
		Apply3DItemXOffset()
		Apply3DItemYOffset()
		Apply3DItemScale()
	endFunction

	function OnSelectST()

		Bool newVal = !_3DItemDisablePositioning
		_3DItemDisablePositioning = newVal
		if newVal
			_3DItemFlags = OPTION_FLAG_DISABLED
		else
			_3DItemFlags = OPTION_FLAG_NONE
		endIf
		SetOptionFlagsST(_3DItemFlags, true, "XD_ITEM_XOFFSET")
		SetOptionFlagsST(_3DItemFlags, true, "XD_ITEM_YOFFSET")
		SetOptionFlagsST(_3DItemFlags, true, "XD_ITEM_SCALE")
		SetToggleOptionValueST(newVal, false, "")
		Apply3DItemXOffset()
		Apply3DItemYOffset()
		Apply3DItemScale()
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO4{$Off}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_USE_HOTKEY3

	function OnDefaultST()

		SetFavoritesGroupHotkey(2, 61, "", "")
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		SetFavoritesGroupHotkey(2, a_keyCode, a_conflictControl, a_conflictName)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{F3}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_USE_HOTKEY1

	function OnDefaultST()

		SetFavoritesGroupHotkey(0, 59, "", "")
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		SetFavoritesGroupHotkey(0, a_keyCode, a_conflictControl, a_conflictName)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{F1}")
	endFunction
endState

;-- State -------------------------------------------
state CHECK_CONTAINER_MENU

	function OnDefaultST()

		SKI_MainInstance.ContainerMenuCheckEnabled = true
		SetToggleOptionValueST(true, false, "")
	endFunction

	function OnSelectST()

		Bool newVal = !SKI_MainInstance.ContainerMenuCheckEnabled
		SKI_MainInstance.ContainerMenuCheckEnabled = newVal
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO3{$On}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_USE_HOTKEY5

	function OnDefaultST()

		SetFavoritesGroupHotkey(4, -1, "", "")
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		SetFavoritesGroupHotkey(4, a_keyCode, a_conflictControl, a_conflictName)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{$Off}")
	endFunction
endState

;-- State -------------------------------------------
state EFFECT_WIDGET_MIN_TIME_LEFT

	function OnSliderOpenST()

		SetSliderDialogStartValue(SKI_ActiveEffectsWidgetInstance.MinimumTimeLeft as Float)
		SetSliderDialogDefaultValue(180 as Float)
		SetSliderDialogRange(0 as Float, 600 as Float)
		SetSliderDialogInterval(10 as Float)
	endFunction

	function OnDefaultST()

		SKI_ActiveEffectsWidgetInstance.MinimumTimeLeft = 180
		SetSliderOptionValueST(180 as Float, "{0}", false, "")
	endFunction

	function OnSliderAcceptST(Float a_value)

		SKI_ActiveEffectsWidgetInstance.MinimumTimeLeft = a_value as Int
		SetSliderOptionValueST((a_value as Int) as Float, "{0} s", false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO5{180}")
	endFunction
endState

;-- State -------------------------------------------
state ITEMLIST_CATEGORY_ICON_THEME

	function OnMenuAcceptST(Int a_index)

		_categoryIconThemeIdx = a_index
		SetMenuOptionValueST(_categoryIconThemeShortNames[_categoryIconThemeIdx], false, "")
		SKI_SettingsManagerInstance.SetOverride("Appearance$icons$category$source", _categoryIconThemeValues[_categoryIconThemeIdx])
	endFunction

	function OnDefaultST()

		_categoryIconThemeIdx = 0
		SetTextOptionValueST(_categoryIconThemeShortNames[_categoryIconThemeIdx], false, "")
		SKI_SettingsManagerInstance.SetOverride("Appearance$icons$category$source", _categoryIconThemeValues[_categoryIconThemeIdx])
	endFunction

	function OnMenuOpenST()

		SetMenuDialogStartIndex(_categoryIconThemeIdx)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(_categoryIconThemeLongNames)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{" + _categoryIconThemeShortNames[0] + "}")
	endFunction
endState

;-- State -------------------------------------------
state EFFECT_WIDGET_ICON_SIZE

	function OnDefaultST()

		_effectWidgetIconSizeIdx = 1
		SKI_ActiveEffectsWidgetInstance.EffectSize = _effectWidgetIconSizeValues[_effectWidgetIconSizeIdx]
		SetTextOptionValueST(_sizes[_effectWidgetIconSizeIdx], false, "")
	endFunction

	function OnSelectST()

		if _effectWidgetIconSizeIdx < _sizes.length - 1
			_effectWidgetIconSizeIdx += 1
		else
			_effectWidgetIconSizeIdx = 0
		endIf
		SKI_ActiveEffectsWidgetInstance.EffectSize = _effectWidgetIconSizeValues[_effectWidgetIconSizeIdx]
		SetTextOptionValueST(_sizes[_effectWidgetIconSizeIdx], false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{" + _sizes[1] + "}")
	endFunction
endState

;-- State -------------------------------------------
state ITEMCARD_YOFFSET

	function OnSliderOpenST()

		SetSliderDialogStartValue(_itemcardYOffset)
		SetSliderDialogDefaultValue(0 as Float)
		SetSliderDialogRange(-1000 as Float, 1000 as Float)
		SetSliderDialogInterval(1 as Float)
	endFunction

	function OnDefaultST()

		_itemcardYOffset = 0.000000
		SetSliderOptionValueST(_itemcardYOffset, "{0}", false, "")
		SKI_SettingsManagerInstance.SetOverride("ItemInfo$itemcard$yOffset", _itemcardYOffset)
	endFunction

	function OnSliderAcceptST(Float a_value)

		_itemcardYOffset = a_value
		SetSliderOptionValueST(_itemcardYOffset, "{0}", false, "")
		SKI_SettingsManagerInstance.SetOverride("ItemInfo$itemcard$yOffset", _itemcardYOffset)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{0}")
	endFunction
endState

;-- State -------------------------------------------
state XD_ITEM_XOFFSET

	function OnSliderOpenST()

		SetSliderDialogStartValue(_3DItemXOffset)
		SetSliderDialogDefaultValue(0 as Float)
		SetSliderDialogRange(-128 as Float, 128 as Float)
		SetSliderDialogInterval(1 as Float)
	endFunction

	function OnDefaultST()

		_3DItemXOffset = 0.000000
		SetSliderOptionValueST(_3DItemXOffset, "{0}", false, "")
		Apply3DItemXOffset()
	endFunction

	function OnSliderAcceptST(Float a_value)

		_3DItemXOffset = a_value
		SetSliderOptionValueST(_3DItemXOffset, "{0}", false, "")
		Apply3DItemXOffset()
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{0}")
	endFunction
endState

;-- State -------------------------------------------
state EQUIP_MODE_KEY

	function OnDefaultST()

		_equipModeKey = 42
		SetKeyMapOptionValueST(_equipModeKey, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$equipMode", _equipModeKey)
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, false)
			return 
		endIf
		SwapItemListKey(a_keyCode, _equipModeKey)
		_equipModeKey = a_keyCode
		SetKeyMapOptionValueST(_equipModeKey, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$equipMode", _equipModeKey)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{Shift}")
	endFunction
endState

;-- State -------------------------------------------
state ITEMLIST_FONT_SIZE

	function OnDefaultST()

		_itemlistFontSizeIdx = 1
		SetTextOptionValueST(_sizes[_itemlistFontSizeIdx], false, "")
		ApplyItemListFontSize()
	endFunction

	function OnSelectST()

		if _itemlistFontSizeIdx < _sizes.length - 1
			_itemlistFontSizeIdx += 1
		else
			_itemlistFontSizeIdx = 0
		endIf
		SetTextOptionValueST(_sizes[_itemlistFontSizeIdx], false, "")
		ApplyItemListFontSize()
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{" + _sizes[1] + "}")
	endFunction
endState

;-- State -------------------------------------------
state CHECK_INVENTORY_MENU

	function OnDefaultST()

		SKI_MainInstance.InventoryMenuCheckEnabled = true
		SetToggleOptionValueST(true, false, "")
	endFunction

	function OnSelectST()

		Bool newVal = !SKI_MainInstance.InventoryMenuCheckEnabled
		SKI_MainInstance.InventoryMenuCheckEnabled = newVal
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO3{$On}")
	endFunction
endState

;-- State -------------------------------------------
state SORT_ORDER_BUTTON

	function OnDefaultST()

		_sortOrderButton = 272
		SetKeyMapOptionValueST(_sortOrderButton, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$sortOrder", _sortOrderButton)
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, true)
			return 
		endIf
		SwapItemListKey(a_keyCode, _sortOrderButton)
		_sortOrderButton = a_keyCode
		SetKeyMapOptionValueST(_sortOrderButton, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$sortOrder", _sortOrderButton)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{LS}")
	endFunction
endState

;-- State -------------------------------------------
state CHECK_CRAFTING_MENU

	function OnDefaultST()

		SKI_MainInstance.CraftingMenuCheckEnabled = true
		SetToggleOptionValueST(true, false, "")
	endFunction

	function OnSelectST()

		Bool newVal = !SKI_MainInstance.CraftingMenuCheckEnabled
		SKI_MainInstance.CraftingMenuCheckEnabled = newVal
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO3{$On}")
	endFunction
endState

;-- State -------------------------------------------
state ITEMLIST_NO_ICON_COLORS

	function OnDefaultST()

		_itemlistNoIconColors = false
		SetToggleOptionValueST(_itemlistNoIconColors, false, "")
		SKI_SettingsManagerInstance.SetOverride("Appearance$icons$item$noColor", _itemlistNoIconColors)
	endFunction

	function OnSelectST()

		_itemlistNoIconColors = !_itemlistNoIconColors
		SetToggleOptionValueST(_itemlistNoIconColors, false, "")
		SKI_SettingsManagerInstance.SetOverride("Appearance$icons$item$noColor", _itemlistNoIconColors)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{$Off}")
	endFunction
endState

;-- State -------------------------------------------
state CHECK_FAVORITES_MENU

	function OnDefaultST()

		SKI_MainInstance.FavoritesMenuCheckEnabled = true
		SetToggleOptionValueST(true, false, "")
	endFunction

	function OnSelectST()

		Bool newVal = !SKI_MainInstance.FavoritesMenuCheckEnabled
		SKI_MainInstance.FavoritesMenuCheckEnabled = newVal
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO3{$On}")
	endFunction
endState

;-- State -------------------------------------------
state EFFECT_WIDGET_HORIZONTAL_ANCHOR

	function OnDefaultST()

		_effectWidgetVAnchorIdx = 1
		SKI_ActiveEffectsWidgetInstance.X = _alignmentBaseOffsets[_effectWidgetHAnchorIdx] + _effectWidgetXOffset
		SetTextOptionValueST(_alignments[_effectWidgetHAnchorIdx], false, "")
	endFunction

	function OnSelectST()

		if _effectWidgetHAnchorIdx < _alignments.length - 1
			_effectWidgetHAnchorIdx += 1
		else
			_effectWidgetHAnchorIdx = 0
		endIf
		SKI_ActiveEffectsWidgetInstance.HAnchor = _alignmentValues[_effectWidgetHAnchorIdx]
		SKI_ActiveEffectsWidgetInstance.X = _alignmentBaseOffsets[_effectWidgetHAnchorIdx] + _effectWidgetXOffset
		SetTextOptionValueST(_alignments[_effectWidgetHAnchorIdx], false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{" + _alignments[1] + "}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_USE_HOTKEY4

	function OnDefaultST()

		SetFavoritesGroupHotkey(3, 62, "", "")
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		SetFavoritesGroupHotkey(3, a_keyCode, a_conflictControl, a_conflictName)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{F4}")
	endFunction
endState

;-- State -------------------------------------------
state EFFECT_WIDGET_VERTICAL_ANCHOR

	function OnDefaultST()

		_effectWidgetVAnchorIdx = 0
		SKI_ActiveEffectsWidgetInstance.Y = _vertAlignmentBaseOffsets[_effectWidgetVAnchorIdx] + _effectWidgetYOffset
		SetTextOptionValueST(_vertAlignments[_effectWidgetVAnchorIdx], false, "")
	endFunction

	function OnSelectST()

		if _effectWidgetVAnchorIdx < _vertAlignments.length - 1
			_effectWidgetVAnchorIdx += 1
		else
			_effectWidgetVAnchorIdx = 0
		endIf
		SKI_ActiveEffectsWidgetInstance.VAnchor = _vertAlignmentValues[_effectWidgetVAnchorIdx]
		SKI_ActiveEffectsWidgetInstance.Y = _vertAlignmentBaseOffsets[_effectWidgetVAnchorIdx] + _effectWidgetYOffset
		SetTextOptionValueST(_vertAlignments[_effectWidgetVAnchorIdx], false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{" + _vertAlignments[0] + "}")
	endFunction
endState

;-- State -------------------------------------------
state XD_ITEM_SCALE

	function OnSliderOpenST()

		SetSliderDialogStartValue(_3DItemScale)
		SetSliderDialogDefaultValue(1.50000)
		SetSliderDialogRange(0.500000, 5 as Float)
		SetSliderDialogInterval(0.100000)
	endFunction

	function OnDefaultST()

		_3DItemScale = 1.50000
		SetSliderOptionValueST(_3DItemScale, "{1}", false, "")
		Apply3DItemScale()
	endFunction

	function OnSliderAcceptST(Float a_value)

		_3DItemScale = a_value
		SetSliderOptionValueST(_3DItemScale, "{1}", false, "")
		Apply3DItemScale()
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{1.5}")
	endFunction
endState

;-- State -------------------------------------------
state PREV_COLUMN_BUTTON

	function OnDefaultST()

		_prevColumnButton = 274
		SetKeyMapOptionValueST(_prevColumnButton, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$prevColumn", _prevColumnButton)
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, true)
			return 
		endIf
		SwapItemListKey(a_keyCode, _prevColumnButton)
		_prevColumnButton = a_keyCode
		SetKeyMapOptionValueST(_prevColumnButton, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$prevColumn", _prevColumnButton)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{LB}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_EQUIP_STATE_KEY

	function OnDefaultST()

		SKI_FavoritesManagerInstance.SaveEquipStateKey = 20
		RefreshFavoriteHotkeys()
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, false)
			return 
		endIf
		SKI_FavoritesManagerInstance.SaveEquipStateKey = a_keyCode
		RefreshFavoriteHotkeys()
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{T}")
	endFunction
endState

;-- State -------------------------------------------
state EFFECT_WIDGET_XOFFSET

	function OnSliderOpenST()

		SetSliderDialogStartValue(_effectWidgetXOffset)
		SetSliderDialogDefaultValue(0 as Float)
		SetSliderDialogRange(-1280 as Float, 1280 as Float)
		SetSliderDialogInterval(1 as Float)
	endFunction

	function OnDefaultST()

		_effectWidgetXOffset = 0.000000
		SKI_ActiveEffectsWidgetInstance.X = _alignmentBaseOffsets[_effectWidgetHAnchorIdx] + _effectWidgetXOffset
		SetSliderOptionValueST(_effectWidgetXOffset, "{0}", false, "")
	endFunction

	function OnSliderAcceptST(Float a_value)

		_effectWidgetXOffset = a_value
		SKI_ActiveEffectsWidgetInstance.X = _alignmentBaseOffsets[_effectWidgetHAnchorIdx] + _effectWidgetXOffset
		SetSliderOptionValueST(_effectWidgetXOffset, "{0}", false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{0}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_UNEQUIP_HANDS

	function OnDefaultST()

		Int HANDS_FLAG = SKI_FavoritesManagerInstance.GROUP_FLAG_UNEQUIP_ARMOR
		SKI_FavoritesManagerInstance.SetGroupFlag(_favCurGroupIdx, HANDS_FLAG, false)
		SetToggleOptionValueST(false, false, "")
	endFunction

	function OnSelectST()

		Int HANDS_FLAG = SKI_FavoritesManagerInstance.GROUP_FLAG_UNEQUIP_HANDS
		Bool newVal = !SKI_FavoritesManagerInstance.GetGroupFlag(_favCurGroupIdx, HANDS_FLAG)
		SKI_FavoritesManagerInstance.SetGroupFlag(_favCurGroupIdx, HANDS_FLAG, newVal)
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO8{$Off}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_ADD_KEY

	function OnDefaultST()

		SKI_FavoritesManagerInstance.GroupAddKey = 33
		RefreshFavoriteHotkeys()
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, false)
			return 
		endIf
		SKI_FavoritesManagerInstance.GroupAddKey = a_keyCode
		RefreshFavoriteHotkeys()
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{F}")
	endFunction
endState

;-- State -------------------------------------------
state CHECK_MAGIC_MENU

	function OnDefaultST()

		SKI_MainInstance.MagicMenuCheckEnabled = true
		SetToggleOptionValueST(true, false, "")
	endFunction

	function OnSelectST()

		Bool newVal = !SKI_MainInstance.MagicMenuCheckEnabled
		SKI_MainInstance.MagicMenuCheckEnabled = newVal
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO3{$On}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_MENU_HELP_ENABLED

	function OnDefaultST()

		SKI_FavoritesManagerInstance.ButtonHelpEnabled = true
		SetToggleOptionValueST(true, false, "")
	endFunction

	function OnSelectST()

		Bool newVal = !SKI_FavoritesManagerInstance.ButtonHelpEnabled
		SKI_FavoritesManagerInstance.ButtonHelpEnabled = newVal
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{$On}")
	endFunction
endState

;-- State -------------------------------------------
state XD_ITEM_YOFFSET

	function OnSliderOpenST()

		SetSliderDialogStartValue(_3DItemYOffset)
		SetSliderDialogDefaultValue(0 as Float)
		SetSliderDialogRange(-128 as Float, 128 as Float)
		SetSliderDialogInterval(1 as Float)
	endFunction

	function OnDefaultST()

		_3DItemYOffset = 0.000000
		SetSliderOptionValueST(_3DItemYOffset, "{0}", false, "")
		Apply3DItemYOffset()
	endFunction

	function OnSliderAcceptST(Float a_value)

		_3DItemYOffset = a_value
		SetSliderOptionValueST(_3DItemYOffset, "{0}", false, "")
		Apply3DItemYOffset()
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{0}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_USE_HOTKEY2

	function OnDefaultST()

		SetFavoritesGroupHotkey(1, 60, "", "")
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		SetFavoritesGroupHotkey(1, a_keyCode, a_conflictControl, a_conflictName)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{F2}")
	endFunction
endState

;-- State -------------------------------------------
state SEARCH_KEY

	function OnDefaultST()

		_searchKey = 57
		SetKeyMapOptionValueST(_searchKey, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$search", _searchKey)
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, false)
			return 
		endIf
		SwapItemListKey(a_keyCode, _searchKey)
		_searchKey = a_keyCode
		SetKeyMapOptionValueST(_searchKey, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$search", _searchKey)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{Space}")
	endFunction
endState

;-- State -------------------------------------------
state CHECK_GIFT_MENU

	function OnDefaultST()

		SKI_MainInstance.GiftMenuCheckEnabled = true
		SetToggleOptionValueST(true, false, "")
	endFunction

	function OnSelectST()

		Bool newVal = !SKI_MainInstance.GiftMenuCheckEnabled
		SKI_MainInstance.GiftMenuCheckEnabled = newVal
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO3{$On}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_UNEQUIP_ARMOR

	function OnDefaultST()

		Int ARMOR_FLAG = SKI_FavoritesManagerInstance.GROUP_FLAG_UNEQUIP_ARMOR
		SKI_FavoritesManagerInstance.SetGroupFlag(_favCurGroupIdx, ARMOR_FLAG, false)
		SetToggleOptionValueST(false, false, "")
	endFunction

	function OnSelectST()

		Int ARMOR_FLAG = SKI_FavoritesManagerInstance.GROUP_FLAG_UNEQUIP_ARMOR
		Bool newVal = !SKI_FavoritesManagerInstance.GetGroupFlag(_favCurGroupIdx, ARMOR_FLAG)
		SKI_FavoritesManagerInstance.SetGroupFlag(_favCurGroupIdx, ARMOR_FLAG, newVal)
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO7{$Off}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_SELECT

	function OnMenuAcceptST(Int a_index)

		_favCurGroupIdx = a_index
		SetCurrentFavoriteGroup(_favCurGroupIdx)
		SetMenuOptionValueST(_favGroupNames[_favCurGroupIdx], false, "")
	endFunction

	function OnDefaultST()

		_favCurGroupIdx = 0
		SetCurrentFavoriteGroup(_favCurGroupIdx)
		SetTextOptionValueST((_favCurGroupIdx + 1), false, "")
	endFunction

	function OnMenuOpenST()

		SetMenuDialogStartIndex(_favCurGroupIdx)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(_favGroupNames)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO6")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_USE_HOTKEY7

	function OnDefaultST()

		SetFavoritesGroupHotkey(6, -1, "", "")
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		SetFavoritesGroupHotkey(6, a_keyCode, a_conflictControl, a_conflictName)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{$Off}")
	endFunction
endState

;-- State -------------------------------------------
state CHECK_BARTER_MENU

	function OnDefaultST()

		SKI_MainInstance.BarterMenuCheckEnabled = true
		SetToggleOptionValueST(true, false, "")
	endFunction

	function OnSelectST()

		Bool newVal = !SKI_MainInstance.BarterMenuCheckEnabled
		SKI_MainInstance.BarterMenuCheckEnabled = newVal
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO3{$On}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_TOGGLE_FOCUS

	function OnDefaultST()

		SKI_FavoritesManagerInstance.ToggleFocusKey = 57
		RefreshFavoriteHotkeys()
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, false)
			return 
		endIf
		SKI_FavoritesManagerInstance.ToggleFocusKey = a_keyCode
		RefreshFavoriteHotkeys()
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{Space}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_SET_ICON_KEY

	function OnDefaultST()

		SKI_FavoritesManagerInstance.SetIconKey = 56
		RefreshFavoriteHotkeys()
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, false)
			return 
		endIf
		SKI_FavoritesManagerInstance.SetIconKey = a_keyCode
		RefreshFavoriteHotkeys()
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{LAlt}")
	endFunction
endState

;-- State -------------------------------------------
state EFFECT_WIDGET_YOFFSET

	function OnSliderOpenST()

		SetSliderDialogStartValue(_effectWidgetYOffset)
		SetSliderDialogDefaultValue(0 as Float)
		SetSliderDialogRange(-720 as Float, 720 as Float)
		SetSliderDialogInterval(1 as Float)
	endFunction

	function OnDefaultST()

		_effectWidgetYOffset = 0.000000
		SKI_ActiveEffectsWidgetInstance.Y = _vertAlignmentBaseOffsets[_effectWidgetVAnchorIdx] + _effectWidgetYOffset
		SetSliderOptionValueST(_effectWidgetYOffset, "{0}", false, "")
	endFunction

	function OnSliderAcceptST(Float a_value)

		_effectWidgetYOffset = a_value
		SKI_ActiveEffectsWidgetInstance.Y = _vertAlignmentBaseOffsets[_effectWidgetVAnchorIdx] + _effectWidgetYOffset
		SetSliderOptionValueST(_effectWidgetYOffset, "{0}", false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{0}")
	endFunction
endState

;-- State -------------------------------------------
state ITEMLIST_QUANTITY_MIN_COUNT

	function OnSliderOpenST()

		SetSliderDialogStartValue(_itemlistQuantityMinCount as Float)
		SetSliderDialogDefaultValue(6 as Float)
		SetSliderDialogRange(0 as Float, 100 as Float)
		SetSliderDialogInterval(1 as Float)
	endFunction

	function OnDefaultST()

		_itemlistQuantityMinCount = 6
		SetSliderOptionValueST(_itemlistQuantityMinCount as Float, "{0}", false, "")
		SKI_SettingsManagerInstance.SetOverride("ItemList$quantityMenu$minCount", _itemlistQuantityMinCount)
	endFunction

	function OnSliderAcceptST(Float a_value)

		_itemlistQuantityMinCount = a_value as Int
		SetSliderOptionValueST(_itemlistQuantityMinCount as Float, "{0}", false, "")
		SKI_SettingsManagerInstance.SetOverride("ItemList$quantityMenu$minCount", _itemlistQuantityMinCount)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO2{6}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_USE_KEY

	function OnDefaultST()

		SKI_FavoritesManagerInstance.GroupUseKey = 19
		RefreshFavoriteHotkeys()
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, false)
			return 
		endIf
		SKI_FavoritesManagerInstance.GroupUseKey = a_keyCode
		RefreshFavoriteHotkeys()
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{R}")
	endFunction
endState

;-- State -------------------------------------------
state ITEMCARD_ALIGN

	function OnDefaultST()

		_itemcardAlignIdx = 2
		SKI_SettingsManagerInstance.SetOverride("ItemInfo$itemcard$align", _alignmentValues[_itemcardAlignIdx])
		SetTextOptionValueST(_alignments[_itemcardAlignIdx], false, "")
	endFunction

	function OnSelectST()

		if _itemcardAlignIdx < _alignments.length - 1
			_itemcardAlignIdx += 1
		else
			_itemcardAlignIdx = 0
		endIf
		SKI_SettingsManagerInstance.SetOverride("ItemInfo$itemcard$align", _alignmentValues[_itemcardAlignIdx])
		SetTextOptionValueST(_alignments[_itemcardAlignIdx], false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{" + _alignments[2] + "}")
	endFunction
endState

;-- State -------------------------------------------
state ITEMCARD_XOFFSET

	function OnSliderOpenST()

		SetSliderDialogStartValue(_itemcardXOffset)
		SetSliderDialogDefaultValue(0 as Float)
		SetSliderDialogRange(-1000 as Float, 1000 as Float)
		SetSliderDialogInterval(1 as Float)
	endFunction

	function OnDefaultST()

		_itemcardXOffset = 0.000000
		SetSliderOptionValueST(_itemcardXOffset, "{0}", false, "")
		SKI_SettingsManagerInstance.SetOverride("ItemInfo$itemcard$xOffset", _itemcardXOffset)
	endFunction

	function OnSliderAcceptST(Float a_value)

		_itemcardXOffset = a_value
		SetSliderOptionValueST(_itemcardXOffset, "{0}", false, "")
		SKI_SettingsManagerInstance.SetOverride("ItemInfo$itemcard$xOffset", _itemcardXOffset)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{0}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_USE_HOTKEY8

	function OnDefaultST()

		SetFavoritesGroupHotkey(7, -1, "", "")
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		SetFavoritesGroupHotkey(7, a_keyCode, a_conflictControl, a_conflictName)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{$Off}")
	endFunction
endState

;-- State -------------------------------------------
state EFFECT_WIDGET_ORIENTATION

	function OnDefaultST()

		_effectWidgetOrientationIdx = 1
		SKI_ActiveEffectsWidgetInstance.Orientation = _orientationValues[_effectWidgetOrientationIdx]
		SetTextOptionValueST(_orientations[_effectWidgetOrientationIdx], false, "")
	endFunction

	function OnSelectST()

		if _effectWidgetOrientationIdx < _orientations.length - 1
			_effectWidgetOrientationIdx += 1
		else
			_effectWidgetOrientationIdx = 0
		endIf
		SKI_ActiveEffectsWidgetInstance.Orientation = _orientationValues[_effectWidgetOrientationIdx]
		SetTextOptionValueST(_orientations[_effectWidgetOrientationIdx], false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{" + _orientations[1] + "}")
	endFunction
endState

;-- State -------------------------------------------
state CHECK_MAP_MENU

	function OnDefaultST()

		SKI_MainInstance.MapMenuCheckEnabled = true
		SetToggleOptionValueST(true, false, "")
	endFunction

	function OnSelectST()

		Bool newVal = !SKI_MainInstance.MapMenuCheckEnabled
		SKI_MainInstance.MapMenuCheckEnabled = newVal
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO3{$On}")
	endFunction
endState

;-- State -------------------------------------------
state EFFECT_WIDGET_GROUP_COUNT

	function OnSliderOpenST()

		SetSliderDialogStartValue(SKI_ActiveEffectsWidgetInstance.GroupEffectCount as Float)
		SetSliderDialogDefaultValue(8 as Float)
		SetSliderDialogRange(1 as Float, 16 as Float)
		SetSliderDialogInterval(1 as Float)
	endFunction

	function OnDefaultST()

		SKI_ActiveEffectsWidgetInstance.GroupEffectCount = 8
		SetSliderOptionValueST(8 as Float, "{0}", false, "")
	endFunction

	function OnSliderAcceptST(Float a_value)

		SKI_ActiveEffectsWidgetInstance.GroupEffectCount = a_value as Int
		SetSliderOptionValueST((a_value as Int) as Float, "{0}", false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{8}")
	endFunction
endState

;-- State -------------------------------------------
state NEXT_COLUMN_BUTTON

	function OnDefaultST()

		_nextColumnButton = 275
		SetKeyMapOptionValueST(_nextColumnButton, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$nextColumn", _nextColumnButton)
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, true)
			return 
		endIf
		SwapItemListKey(a_keyCode, _nextColumnButton)
		_nextColumnButton = a_keyCode
		SetKeyMapOptionValueST(_nextColumnButton, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$nextColumn", _nextColumnButton)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{RB}")
	endFunction
endState

;-- State -------------------------------------------
state SWITCH_TAB_BUTTON

	function OnDefaultST()

		_switchTabButton = 271
		SetKeyMapOptionValueST(_switchTabButton, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$switchTab", _switchTabButton)
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, true)
			return 
		endIf
		SwapItemListKey(a_keyCode, _switchTabButton)
		_switchTabButton = a_keyCode
		SetKeyMapOptionValueST(_switchTabButton, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$gamepad$switchTab", _switchTabButton)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{Back}")
	endFunction
endState

;-- State -------------------------------------------
state EFFECT_WIDGET_ENABLED

	function OnDefaultST()

		SKI_ActiveEffectsWidgetInstance.Enabled = true
		_effectWidgetFlags = OPTION_FLAG_NONE
		SetOptionFlagsST(_effectWidgetFlags, true, "EFFECT_WIDGET_ICON_SIZE")
		SetOptionFlagsST(_effectWidgetFlags, true, "EFFECT_WIDGET_MIN_TIME_LEFT")
		SetToggleOptionValueST(true, false, "")
	endFunction

	function OnSelectST()

		Bool newVal = !SKI_ActiveEffectsWidgetInstance.Enabled
		SKI_ActiveEffectsWidgetInstance.Enabled = newVal
		if newVal
			_effectWidgetFlags = OPTION_FLAG_NONE
		else
			_effectWidgetFlags = OPTION_FLAG_DISABLED
		endIf
		SetOptionFlagsST(_effectWidgetFlags, true, "EFFECT_WIDGET_ICON_SIZE")
		SetOptionFlagsST(_effectWidgetFlags, true, "EFFECT_WIDGET_MIN_TIME_LEFT")
		SetToggleOptionValueST(newVal, false, "")
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{$On}")
	endFunction
endState

;-- State -------------------------------------------
state FAV_GROUP_USE_HOTKEY6

	function OnDefaultST()

		SetFavoritesGroupHotkey(5, -1, "", "")
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		SetFavoritesGroupHotkey(5, a_keyCode, a_conflictControl, a_conflictName)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{$Off}")
	endFunction
endState

;-- State -------------------------------------------
state SWITCH_TAB_KEY

	function OnDefaultST()

		_switchTabKey = 56
		SetKeyMapOptionValueST(_switchTabKey, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$switchTab", _switchTabKey)
	endFunction

	function OnKeyMapChangeST(Int a_keyCode, String a_conflictControl, String a_conflictName)

		if !ValidateKey(a_keyCode, false)
			return 
		endIf
		SwapItemListKey(a_keyCode, _switchTabKey)
		_switchTabKey = a_keyCode
		SetKeyMapOptionValueST(_switchTabKey, false, "")
		SKI_SettingsManagerInstance.SetOverride("Input$controls$pc$switchTab", _switchTabKey)
	endFunction

	function OnHighlightST()

		SetInfoText("$SKI_INFO1{LAlt}")
	endFunction
endState
