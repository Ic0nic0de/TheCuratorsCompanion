scriptname Ic0n_TeachEnchantment_Maintenance extends referencealias

formlist property _EnchantmentList auto  

event onplayerloadgame()

	int _Index = _EnchantmentList.getsize()
	while _index
		_index -= 1
     	_EnchantmentList.getat(_index).setplayerknows(true)
	endwhile
endevent

