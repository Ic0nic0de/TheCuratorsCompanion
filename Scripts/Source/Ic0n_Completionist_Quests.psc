scriptname Ic0n_Completionist_Quests extends quest

Ic0n_Completionist_MCM property MCM auto

Event _Build_Quests()

	if MCM._MCM_Page == "Main Quests" ;---------------COMPLETE (10)			
						
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ101", 			"I. Unbound", 							"Main Quests", 		"Ralof", 								"Escape Imperial custody and a dragon attack")
		MCM._Add_Quest_Data(false, 	10, 999,		"MQ102", 			"II. Before the Storm", 				"Main Quests", 		"Hadvar, Ralof", 						"Inform the Jarl of Whiterun about the dragon attack on Helgen")
		MCM._Add_Quest_Data(false, 	10, 999,		"MQ103", 			"III. Bleak Falls Barrow", 				"Main Quests", 		"Jarl Balgruuf the Greater", 			"Retrieve the Dragonstone from Bleak Falls Barrow")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ104", 			"IV. Dragon Rising", 					"Main Quests", 		"Farengar Secret-Fire", 				"Investigate a dragon sighting near Whiterun")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ105", 			"V. The Way of the Voice", 				"Main Quests", 		"Jarl Balgruuf the Greater", 			"Meet the Greybeards at High Hrothgar")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ105Ustengrav",	"VI. The Horn of Jurgen Windcaller", 	"Main Quests", 		"Arngeir", 								"Retrieve a Greybeard artifact from Ustengrav")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ106", 			"VII. A Blade in the Dark", 			"Main Quests", 		"Delphine", 							"Prove you are Dragonborn to Delphine by slaying the dragon Sahloknir")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ201", 			"VIII. Diplomatic Immunity", 			"Main Quests", 		"Delphine", 							"Infiltrate a party at the Thalmor Embassy")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ202", 			"IX. A Cornered Rat", 					"Main Quests", 		"Delphine", 							"Locate Esbern in Riften")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ203", 			"X. Alduin's Wall",						"Main Quests", 		"Esbern", 								"Locate the prophecy within Sky Haven Temple")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ204", 			"XI. The Throat of the World", 			"Main Quests", 		"Arngeir", 								"Receive a lesson from Paarthurnax at the Throat of the World")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ205", 			"XII. Elder Knowledge", 				"Main Quests", 		"Paarthurnax", 							"Recover an Elder Scroll to learn an Ancient Secret")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ206", 			"XIII. Alduin's Bane", 					"Main Quests", 		"Automatic Start", 						"Exploit the Time-Wound to learn Dragonrend and defeat Alduin at the Throat of the World")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ301", 			"XIV. The Fallen", 						"Main Quests", 		"Paarthurnax, Arngeir, Esbern", 		"Capture and interrogate an ally of Alduin")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ302", 			"XV. Season Unending", 					"Main Quests", 		"Jarl Balgruuf the Greater, Vignar Gray-Mane", 	"Enforce a ceasefire to secure Dragonsreach")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQPaarthurnax", 	"XVI. Paarthurnax", 					"Main Quests", 		"Esbern, Delphine",						"Deal with a potential threat")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ303", 			"XVII. The World-Eater's Eyrie", 		"Main Quests", 		"Odahviing",							"Battle through Skuldafn Temple to reach Alduin's portal to Sovngarde")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ304", 			"XVIII. Sovngarde", 					"Main Quests", 		"Automatic Start",						"Seek out Alduin within Sovngarde")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MQ305", 			"XIX. Dragonslayer", 					"Main Quests", 		"Hakon, Gormlaith, and Felldir",		"Put an end to the World-Eater")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseif MCM._MCM_Page == "Main Quests (DG)"
		
		MCM._Add_Quest_Data(false, 	10, 10,				"DLC1VQ01MiscObjective", 	"I. Dawnguard", 				"Main Quests (DG)", 		"City guard, Durak, or Agmaer", 	"Speak with the leader of the Dawnguard")
		MCM._Add_Quest_Data(false, 	10, 40,				"DLC1VQ01", 				"II. Awakening", 				"Main Quests (DG)", 		"Isran", 							"Find out what the vampires are looking for")
		MCM._Add_Quest_Data(false, 	5, 40,				"DLC1VQ02", 				"III. Bloodline", 				"Main Quests (DG)", 		"Serana", 							"Choose your side!")
		
		if MCM.DG_Faction_Choice == 1
			
			MCM._Add_Quest_Data(false, 	20, 70,			"DLC1HunterBaseIntro", 		"IV. A New Order", 				"Main Quests (DG)", 		"Isran", 							"Recruit Isran's old allies for the Dawnguard")
			MCM._Add_Quest_Data(false, 	5, 100,			"DLC1VQ03Hunter", 			"V. Prophet", 					"Main Quests (DG)", 		"Isran", 							"Find and rescue a Moth Priest from the vampires")
		
		elseif MCM.DG_Faction_Choice == 2 
			
			MCM._Add_Quest_Data(false, 	10, 60,			"DLC1VampireBaseIntro", 	"IV. The Bloodstone Chalice", 	"Main Quests (DG)", 		"Garan Marethi", 					"Fill the Bloodstone Chalice from the Bloodspring at Redwater Den")
			MCM._Add_Quest_Data(false, 	5, 130,			"DLC1VQ03Vampire", 			"V. Prophet", 					"Main Quests (DG)", 		"Lord Harkon", 						"Locate a Moth Priest for the vampires")
		
		endIf
		
		MCM._Add_Quest_Data(false, 	10, 100,			"DLC1VQ04", 				"VI. Chasing Echoes", 			"Main Quests (DG)", 		"Serana", 							"Explore Castle Volkihar")
		MCM._Add_Quest_Data(false, 	20, 30,				"DLC1VQElderHandler", 		"VII. Scroll Scouting", 		"Main Quests (DG)", 		"Dexion Evicus", 					"Obtain all three Elder Scrolls for Dexion Evicus")
		MCM._Add_Quest_Data(false, 	10, 140,			"DLC1VQ05", 				"VIII. Beyond Death", 			"Main Quests (DG)", 		"Serana",							"Search for Valerica in the Soul Cairn")
		MCM._Add_Quest_Data(false, 	10, 40,				"DLC1VQElder", 				"IX. Seeking Disclosure", 		"Main Quests (DG)", 		"Lord Harkon or Isran", 			"Bring the Elder Scrolls to Dexion")
		MCM._Add_Quest_Data(false, 	10, 70,				"DLC1VQ06", 				"X. Unseen Visions", 			"Main Quests (DG)", 		"Dexion Evicus", 					"Perform a ceremony to read the Elder Scroll")
		MCM._Add_Quest_Data(false, 	10, 150,			"DLC1VQ07", 				"XI. Touching the Sky", 		"Main Quests (DG)", 		"Serana", 							"Find and retrieve Auriel's Bow")
		MCM._Add_Quest_Data(false, 	10, 60,				"DLC1VQ08", 				"XII. Kindred Judgment", 		"Main Quests (DG)", 		"Serana", 							"Confront Lord Harkon")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	elseif MCM._MCM_Page == "Main Quests (CW)"
		
		if MCM.CW_Faction_Choice == 1

			MCM._Add_Quest_Data(false, 	-999, 999,		"CW01A", 	"I. Joining the Legion", 				"Main Quests (CW)", 		"Legate Rikke",		"Join the Imperial Legion")
			MCM._Add_Quest_Data(false, 	-999, 999,		"CW02A", 	"II. The Jagged Crown", 				"Main Quests (CW)", 		"Legate Rikke",		"Retrieve the Jagged Crown")
			MCM._Add_Quest_Data(false, 	-999, 999,		"CW03", 	"III. Message to Whiterun", 			"Main Quests (CW)", 		"General Tullius",	"Deliver message to Whiterun")
			
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"IV. Battle for Whiterun", 				"Main Quests (CW)", 		"General Tullius",	"Take Whiterun for the Imperial Legion")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"V. Reunification of Skyrim", 			"Main Quests (CW)", 		"General Tullius", 	"Reunite Skyrim for the Empire")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"VI. Battle for Windhelm", 				"Main Quests (CW)", 		"Legate Rikke",		"Take Windhelm and bring Ulfric to justice")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"A False Front", 						"Main Quests (CW)", 		"Legate Rikke",		"Deliver forged documents to Stormcloaks")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"Compelling Tribute", 					"Main Quests (CW)", 		"Legate Rikke",		"Gain intelligence on Stormcloaks")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"Rescue from Fort Kastav", 				"Main Quests (CW)", 		"Legate Rikke",		"Rescue prisoners and regain Winterhold")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Amol", 			"Main Quests (CW)", 		"Legate Rikke",		"Take Fort Amol")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Dunstad", 			"Main Quests (CW)", 		"Legate Rikke",		"Take Fort Dunstad")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Greenwall", 		"Main Quests (CW)", 		"Legate Rikke",		"Take Fort Greenwall")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Snowhawk", 		"Main Quests (CW)", 		"Legate Rikke",		"Take Fort Snowhawk")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Sungard", 			"Main Quests (CW)", 		"Legate Rikke",		"Take Fort Sungard")				
		
		elseif MCM.CW_Faction_Choice == 2 
		
			MCM._Add_Quest_Data(false, 	-999, 999,		"CW01B", 	"I. Joining the Stormcloaks", 			"Main Quests (CW)", 		"Ulfric Stormcloak",		"Join the Stormcloaks")
			MCM._Add_Quest_Data(false, 	-999, 999,		"CW02B", 	"II. The Jagged Crown", 				"Main Quests (CW)", 		"Galmar Stone-Fist",		"Retrieve the Jagged Crown")
			MCM._Add_Quest_Data(false, 	-999, 999,		"CW03", 	"III. Message to Whiterun", 			"Main Quests (CW)", 		"Ulfric Stormcloak",		"Deliver axe to Jarl of Whiterun")
			
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"IV. Battle for Whiterun", 				"Main Quests (CW)", 		"Ulfric Stormcloak",		"Take Whiterun for the Stormcloaks")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"V. Liberation of Skyrim", 				"Main Quests (CW)", 		"Ulfric Stormcloak",		"Drive the Imperials from Skyrim")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"VI. Battle for Solitude", 				"Main Quests (CW)", 		"Galmar Stone-Fist",		"Take solitude and push the Imperials out")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"A False Front", 						"Main Quests (CW)", 		"Galmar Stone-Fist",		"Deliver forged documents to Imperials")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"Compelling Tribute", 					"Main Quests (CW)", 		"Galmar Stone-Fist",		"Blackmail Talos worshipper")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"Rescue from Fort Neugrad", 			"Main Quests (CW)", 		"Galmar Stone-Fist",		"Take Fort Neugrad")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Dunstad", 			"Main Quests (CW)", 		"Galmar Stone-Fist",		"Take Fort Dunstad")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Greenwall", 		"Main Quests (CW)", 		"Galmar Stone-Fist",		"Take Fort Greenwall")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Hraggstad", 		"Main Quests (CW)", 		"Galmar Stone-Fist",		"Take Fort Hraggstad")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Kastav", 			"Main Quests (CW)", 		"Galmar Stone-Fist",		"Take Fort Kastav")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Snowhawk", 		"Main Quests (CW)", 		"Galmar Stone-Fist",		"Take Fort Snowhawk")
			MCM._Add_Quest_Data(true, 	-999, 999,		"", 		"The Battle for Fort Sungard", 			"Main Quests (CW)", 		"Galmar Stone-Fist",		"Take Fort Sungard")		
		
		endIf
		
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	elseif MCM._MCM_Page == "Main Quests (DB)"
	
		MCM._Add_Quest_Data(false, 	5, 30,			"DLC2MQ01",		"I. Dragonborn", 					"Main Quests (DB)", 	"Automatic (World Encounter)", 		"Travel to the island of Solstheim to find out what's happening there")
		MCM._Add_Quest_Data(false, 	5, 60,			"DLC2MQ02", 	"II. The Temple of Miraak", 		"Main Quests (DB)", 	"Frea", 							"Uncover the source of Miraak's power in the Temple of Miraak")
		MCM._Add_Quest_Data(false, 	10, 70,			"DLC2MQ03", 	"III. The Fate of the Skaal", 		"Main Quests (DB)", 	"Frea", 							"Find a way to free the citizens of Skaal Village")
		MCM._Add_Quest_Data(false, 	5, 5,			"DLC2MQ03B", 	"IV. Cleansing the Stones", 		"Main Quests (DB)", 	"Storn Crag-Strider", 				"Use the Bend Will shout to cleanse each of the remaining All-Maker Stones")
		MCM._Add_Quest_Data(false,  10, 500,		"DLC2MQ04", 	"V. The Path of Knowledge", 		"Main Quests (DB)", 	"Storn Crag-Strider", 				"Discover the locations of the Black Books in order to stop Miraak")
		MCM._Add_Quest_Data(false, 	10, 500,		"DLC2MQ05", 	"VI. The Gardener of Men", 			"Main Quests (DB)", 	"Black Book: Epistolary Acumen", 	"Travel to the realm of Hermaeus Mora to learn the rest of Bend Will")
		MCM._Add_Quest_Data(false, 	10, 400,		"DLC2MQ06", 	"VII. At the Summit of Apocrypha", 	"Main Quests (DB)", 	"Frea", 							"Confront Miraak at the summit of Apocrypha and defeat him once and for all")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	elseIf MCM._MCM_Page == "Whiterun Quests"
		
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformWhiterunQuest04", 		"Andurs' Arkay Amulet", 		"Whiterun Quests", 		"Andurs", 							"Retrieve Andurs' Amulet of Arkay from the catacombs")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformWhiterunQuest02", 		"Argonian Ale Extraction", 		"Whiterun Quests", 		"Brenuin", 							"Steal the bottle of Argonian Ale for Brenuin")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformWhiterunQuest01", 		"Bullying Braith", 				"Whiterun Quests", 		"Lars Battle-Born", 				"Convince Braith to stop bullying Lars")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformWhiterunQuest03", 		"Greatsword for a Great Man", 	"Whiterun Quests", 		"Adrianne Avenicci", 				"Deliver the Jarls sword to Proventus Avenicci")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS08", 						"In My Time Of Need", 			"Whiterun Quests", 		"Alik'r Warriors", 					"Find the Redguard woman hiding out in Whiterun")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS09", 						"Missing In Action", 			"Whiterun Quests", 		"Fralia Gray-Mane", 				"Rescue Thorald Gray-Mane from the Thalmor")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformWhiterunQuest05", 		"Salt for Arcadia", 			"Whiterun Quests", 		"Farengar Secret-Fire", 			"Deliver some Frost Salts to Arcadia for Farengar")
		MCM._Add_Quest_Data(false, 	-999, 1,		"dunSleepingTreeCampQST", 		"Sleeping Tree Cave", 			"Whiterun Quests", 		"Read note from Ulag's corpse", 	"Speak to Ysolda about the Sleeping Tree Sap")
		MCM._Add_Quest_Data(false, 	-999, 999,		"T03", 							"The Blessings of Nature", 		"Whiterun Quests", 		"Danica Pure-Spring", 				"Restore the Gildergreen for Danica")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA08", 						"The Whispering Door", 			"Whiterun Quests", 		"Jarl Balgruuf", 					"Investigate the whispering door within Dragonsreach")

		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"A Few Words With You", 	"Whiterun Quests", 	"Carlotta Valentia", 		"Talk to Mikael in the Bannered Mare for Carlotta")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Collect Firewood", 		"Whiterun Quests", 	"Hulda", 					"Get paid to collect firewood")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dungeon Delving", 			"Whiterun Quests", 	"Amren", 					"Hunt down the bandits and retrieve Amren's family sword")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Prove your worth", 		"Whiterun Quests", 	"Uthgerd the Unbroken", 	"Fight Uthgerd the Unbroken and prove your worth")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a Septim", 			"Whiterun Quests", 	"Brenuin", 					"Give a septim to a beggar")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Rare Gifts", 				"Whiterun Quests", 	"Ysolda", 					"Retrieve a Mammoth Tusk for Ysolda")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Thane of Whiterun", 		"Whiterun Quests", 	"Jarl of Whiterun", 		"Become the Thane of Whiterun")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Falkreath Quests"
	
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA03", 					"A Daedra's Best Friend", 				"Falkreath Quests", 		"Barbas",				"Help Barbas reunite with his master")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformFalkreathQuest03", "Dark Ancestor", 						"Falkreath Quests", 		"Dengeir of Stuhn",		"Kill Vighar")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA05", 					"Ill Met By Moonlight", 				"Falkreath Quests", 		"Mathies, Sinding",		"Hunt in the name of the Daedric Prince, Hircine")
		MCM._Add_Quest_Data(false, 	-999, 999,		"Favor154", 				"Kill the Bandit Leader (Siddgeir)", 	"Falkreath Quests", 		"Jarl Siddgeir",		"Kill the bandit leader")

		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Collect Firewood", 	"Falkreath Quests", 		"Hert",						"Get paid to collect firewood")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Delivery", 			"Falkreath Quests", 		"Thadgeir",					"Deliver Berit's Ashes to Runil")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dungeon Delving", 		"Falkreath Quests", 		"Runil",					"Retrieve Runil's Journal")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops", 		"Falkreath Quests", 		"Mathies",					"Get paid to harvest crops")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Rare Gifts", 			"Falkreath Quests", 		"Siddgeir",					"Retrieve some Black-Briar Mead for the Jarl")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Some Light Theft", 	"Falkreath Quests", 		"Dengeir of Stuhn",			"Steal a Private Letter for Dengeir of Stuhn")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Thane of Falkreath", 	"Falkreath Quests", 		"Jarl of Falkreath",		"Become the Thane of Falkreath")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Riften Quests"
	
		MCM._Add_Quest_Data(false, 	20, 20,			"FreeformRiften19", 		"Bloody Nose", 				"Riften Quests", 			"Hofgrir Horse-Crusher",		"Defeat Hofgrir in a fist fight")
		MCM._Add_Quest_Data(false, 	20, 30,			"FreeformRiften16", 		"Bring It!", 				"Riften Quests", 			"Harrald",						"Deliver the sword to Harrald")
		MCM._Add_Quest_Data(false, 	20, 70,			"FreeformRiften11", 		"Caught Red Handed", 		"Riften Quests", 			"Svana Far-Shield",				"Retrieve Haelga's 3 Marks of Dibella")
		MCM._Add_Quest_Data(false, 	20, 30,			"FreeformRiften08", 		"Distant Memories", 		"Riften Quests", 			"Brand-Shei",					"Help Brand-Shei uncover his past")
		MCM._Add_Quest_Data(false, 	20, 60,			"FreeformRiften04", 		"Few and Far Between", 		"Riften Quests", 			"Ingun Black-Briar",			"Retrieve the ingredients for Ingun Black-Briar")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformRiften09", 		"Grimsever's Return", 		"Riften Quests", 			"Mjoll the Lioness",			"Retrieve Mjoll's sword, Grimsever")
		MCM._Add_Quest_Data(false, 	20, 20,			"FreeformRiften12", 		"Helping Hand", 			"Riften Quests", 			"Wujeeta",						"Help Wujeeta cure her skooma addiction")
		MCM._Add_Quest_Data(false, 	20, 60,			"FreeformRiften14", 		"Hunt and Gather", 			"Riften Quests", 			"Wylandriah",					"Retrieve Wylandriah's misplaced items")
		MCM._Add_Quest_Data(false, 	20, 20,			"FreeformRiften07", 		"Ice Cold", 				"Riften Quests", 			"Marise Aravel",				"Retrieve 5 Ice Wraith Teeth")
		MCM._Add_Quest_Data(false, 	20, 30,			"FreeformRiften13", 		"Pilgrimage", 				"Riften Quests", 			"Alessandra",					"Help Alessandra make peace with her dead father")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS03", 					"Promises to Keep", 		"Riften Quests", 			"Louis Letrush",				"Help get a horse from Sibbi Black-Briar")
		MCM._Add_Quest_Data(false, 	20, 60,			"FreeformRiften18", 		"Ringmaker", 				"Riften Quests", 			"Madesi",						"Retrieve some ingredients for Madesi")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformRiften06", 		"Sealing the Deal", 		"Riften Quests", 			"Talen-Jei",					"Retrieve 3 Flawless Amethysts")
		MCM._Add_Quest_Data(false, 	20, 20,			"FreeformRiften15", 		"Special Delivery", 		"Riften Quests", 			"Bolli",						"Deliver the agreement to Markarth")
		MCM._Add_Quest_Data(false, 	20, 30,			"FreeformRiften05", 		"Spread the Love", 			"Riften Quests", 			"Dinya Balu",					"Distribute religious literature to the citizens of Riften")
		MCM._Add_Quest_Data(false, 	-999, 30,		"FreeformRiften22", 		"Stabilized", 				"Riften Quests", 			"Shadr",						"Help Shadr clear his debt")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformRiften10", 		"Stoking the Flames", 		"Riften Quests", 			"Balimund",						"Retrieve 10 Fire Salts")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformRiften01", 		"Supply and Demand", 		"Riften Quests", 			"Read note (Shipment's Ready)",	"Clear Cragslane Cavern")
		MCM._Add_Quest_Data(false, 	-999, 20,		"FreeformRiftenThane", 		"Thane of Riften", 			"Riften Quests", 			"Jarl of Riften",				"Become the Thane of the Rift")		
		MCM._Add_Quest_Data(false, 	-999, 30,		"RelationshipMarriage", 	"The Bonds of Matrimony", 	"Riften Quests", 			"Maramal", 						"Find someone to marry")
		MCM._Add_Quest_Data(false, 	-999, 999,		"t02", 						"The Book of Love", 		"Riften Quests", 			"Dinya Balu",					"Spread love throughout Skyrim")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformRiften02", 		"The Lover's Requital", 	"Riften Quests", 			"Sibbi Black-Briar",			"Help Sibbi Black-Briar locate his fiancee")
		MCM._Add_Quest_Data(false, 	-999, 50,		"FreeformRiften20", 		"The Raid", 				"Riften Quests", 			"Wujeeta",						"Help to stop the skooma trade in Riften")
		MCM._Add_Quest_Data(false, 	20, 30,			"FreeformRiften17", 		"Truth Ore Consequences", 	"Riften Quests", 			"Hafjorg",						"Retrieve an ore sample")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformRiften03", 		"Under the Table", 			"Riften Quests", 			"Romlyn Dreth",					"Deliver the smuggled keg to Ivarstead")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS04", 					"Unfathomable Depths", 		"Riften Quests", 			"From-Deepest-Fathoms",			"Uncover memories of the Dwemer")
		MCM._Add_Quest_Data(false, 	-999, 30,		"FreeformValdDebt", 		"Vald's Debt", 				"Riften Quests", 			"Automatic Start",				"Retrieve the Quill of Germination")
		
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a Septim I", 		"Riften Quests", 	"Edda",		"Give a septim to a beggar")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a Septim II", 	"Riften Quests", 	"Snilf",	"Give a septim to a beggar")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Windhelm Quests"
	
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS11", 				"Blood on the Ice", 			"Windhelm Quests", 		"Windhelm Guard", 		"Investigate the murders in Windhelm")
		MCM._Add_Quest_Data(false, 	-999, 10,		"FreeformWindhelmA", 	"Delivery", 					"Windhelm Quests", 		"Hillevi Cruel-Sea", 	"Deliver a bottle of Nightshade Extract to Wuunferth the Unliving")
		MCM._Add_Quest_Data(false, 	-999, 150,		"MQ201Malborn",			"Find the Thalmor Assassin", 	"Windhelm Quests", 		"Malborn", 				"Kill the Thalmor assassin for Malborn")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS12b", 				"Repairing the Phial", 			"Windhelm Quests", 		"Quintus Navale", 		"Repair the White Phial")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS10", 				"Rise in the East", 			"Windhelm Quests", 		"Orthus Endario", 		"Assist the East Empire Company with pirates")
		MCM._Add_Quest_Data(false, 	-999, 999,		"Favor019", 			"That Was Always There", 		"Windhelm Quests", 		"Revyn Sadri",			"Retrieve Viola's ring")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS12", 				"The White Phial", 				"Windhelm Quests", 		"Nurelion", 			"Retrieve the White Phial")



		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"A Few Words With You", 	"Windhelm Quests", 		"Scouts-Many-Marshes", 			"Talk to Torbjorn Shatter-Shield for Scouts-Many-Marshes")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Some Light Theft", 		"Windhelm Quests", 		"Stands-In-Shallows", 			"Steal a bottle of Double-Distilled Skooma for Stands-In-Shallows")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Rare Gifts", 				"Windhelm Quests", 		"Torbjorn Shatter-Shield", 		"Retrieve the Amulet of Arkay")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a drink",				"Windhelm Quests", 		"Torbjorn Shatter-Shield", 		"Buy a drink for a drunk")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Kill the Bandit Leader", 	"Windhelm Quests", 		"Brunwulf Free-Winter", 		"Kill the bandit leader")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harsh Master", 			"Windhelm Quests", 		"Kjar", 						"Deal with a runaway crew member")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Thane of Eastmarch", 		"Windhelm Quests", 		"Jarl of Windhelm", 			"Become the Thane of Eastmarch")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Prove your worth", 		"Windhelm Quests", 		"Rolff Stone-Fist", 			"Fight Rolff Stone-Fist and prove your worth")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dungeon Delving I", 		"Windhelm Quests", 		"Oengul War-Anvil", 			"Retrieve Queen Freydis's Sword")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dungeon Delving II", 		"Windhelm Quests", 		"Shahvee", 						"Retrieve Shahvee's Amulet of Zenithar")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Delivery", 				"Windhelm Quests", 		"Adonato Leotelli", 			"Deliver Adonato's book to Giraud")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a Septim I", 			"Windhelm Quests", 		"Angrenor Once-Honored", 		"Give a septim to a beggar")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a Septim II", 		"Windhelm Quests", 		"Silda the Unseen", 			"Give a septim to a beggar")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Dawnstar Quests"
	
		MCM._Add_Quest_Data(false, 	-999, 999,		"Favor153", 				"Kill the Giant", 		"Dawnstar Quests", 		"Jarl Skald", 			"Kill the Giant")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA07", 					"Pieces of the Past", 	"Dawnstar Quests", 		"Silus Vesuius", 		"Retrieve the pieces of Mehrune's Razor")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA16", 					"Waking Nightmare",		"Dawnstar Quests", 		"Erandur", 				"Relieve the people of Dawnstar from Vaermina's curse")
		MCM._Add_Quest_Data(false, 	-999, 15,		"FreeformShipsDawnstar", 	"Salty Sea-Dogs",		"Dawnstar Quests", 		"Captain Wayfinder", 	"Retrieve the Void Salts")
		
		
		
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dungeon Delving", 			"Dawnstar Quests", 		"Frida", 				"Retrieve the Ring of Pure Mixtures")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a drink", 			"Dawnstar Quests", 		"Karl", 				"Buy a drink for a drunk")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Rare Gifts", 				"Dawnstar Quests", 		"Rustleif", 			"Retrieve the book 'Night Falls on Sentinel'")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Thane of the Pale", 		"Dawnstar Quests", 		"Jarl of Dawnstar", 	"Become the Thane of the Pale")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Mine Ore I", 				"Dawnstar Quests", 		"Beitild", 				"Get paid to mine ore")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Mine Ore II", 				"Dawnstar Quests", 		"Leigelf",				"Get paid to mine ore")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Markarth Quests"
	
		MCM._Add_Quest_Data(false, 	-999, 10,		"FreeformMarkarthJ", 		"Bothela's Discreet Delivery", 		"Markarth Quests", 		"Bothela",				"Deliver Stallion's Potion")
		MCM._Add_Quest_Data(false, 	-999, 10,		"WIAddItem07",				"Buy Dwarven artifact",				"Markarth Quests", 		"Courier",				"Bring a Dwarven Artifact to Calcelmo")
		MCM._Add_Quest_Data(false, 	-999, 10,		"FreeformMarkarthN", 		"Coated in Blood", 					"Markarth Quests", 		"Moth gro-Bagol",		"Retrieve a Daedra Heart")
		MCM._Add_Quest_Data(false, 	-999, 10,		"FreeformMarkarthD", 		"Delivery to Calcelmo", 			"Markarth Quests", 		"Kerah", 				"Deliver the ring to Calcelmo")
		MCM._Add_Quest_Data(false, 	-999, 999,		"Favor151", 				"Kill the Forsworn Leader", 		"Markarth Quests", 		"Jarl Igmund", 			"Kill the Forsworn Leader")
		MCM._Add_Quest_Data(false, 	-999, 15,		"FreeformMarkarthE", 		"Lisbet's Missing Shipment", 		"Markarth Quests", 		"Lisbet", 				"Retrieve the Dibella Statue")
		MCM._Add_Quest_Data(false, 	-999, 15,		"FreeformMarkarthO", 		"Nimhe, the Poisoned One", 			"Markarth Quests", 		"Calcelmo", 			"Kill the giant spider")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS02", 					"No One Escapes Cidhna Mine", 		"Markarth Quests", 		"Automatic Start", 		"Escape from Cidhna Mine")
		MCM._Add_Quest_Data(false, 	-999, 15,		"FreeformMarkarthM", 		"Search and Seizure", 				"Markarth Quests", 		"Ondolemar",			"Find evidence of a Talos worshipper for the Thalmor")
		MCM._Add_Quest_Data(false, 	-999, 10,		"FreeformMarkarthL", 		"Skilled Apprenticeship", 			"Markarth Quests", 		"Ghorza gra-Bagol", 	"Retrieve the book 'Last Scabbard of Akrash' for Ghorza gra-Bagol")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS01", 					"The Forsworn Conspiracy", 			"Markarth Quests", 		"Eltrys", 				"Investigate the murder in Markarth")
		MCM._Add_Quest_Data(false, 	-999, 100,		"T01DegaineFavor", 			"The Heart of Dibella I", 			"Markarth Quests", 		"Degaine", 				"Steal the statue from the Temple of Dibella")
		MCM._Add_Quest_Data(false, 	-999, 999,		"T01", 						"The Heart of Dibella II", 			"Markarth Quests", 		"Hamal", 				"Help find the next Sybil for the Temple of Dibella")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA10", 					"The House of Horrors", 			"Markarth Quests", 		"Vigilant Tyranus", 	"Help Molag Bal take revenge")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunNchuandZelQst", 		"The Lost Expedition", 				"Markarth Quests", 		"Alethius's journal", 	"Recover the journals from the expedition in Nchuand-Zel")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA11Intro", 				"The Taste of Death (Intro)", 		"Markarth Quests", 		"Brother Verulus", 		"Investigate the Hall of the Dead")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA11", 					"The Taste of Death", 				"Markarth Quests", 		"Eola", 				"Prepare a feast for the Lady of Decay")
		
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"A Few Words With You", 	"Markarth Quests", 		"Omluag", 				"Talk to Mulush gro-Shugurz for Omluag")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Delivery", 				"Markarth Quests", 		"Banning", 				"Deliver the spiced beef to Voada")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dungeon Delving", 			"Markarth Quests", 		"Jarl Igmund", 			"Retrieve Hrolfdir's Shield")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Prove your worth", 		"Markarth Quests", 		"Cosnach", 				"Fight Cosnach and prove your worth")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a Septim", 			"Markarth Quests", 		"Degaine", 				"Give a septim to a beggar")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a drink I", 			"Markarth Quests", 		"Degaine", 				"Buy a drink for a drunk")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a drink II", 			"Markarth Quests", 		"Cosnach", 				"Buy a drink for a drunk")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Thane of the Reach",		"Markarth Quests", 		"Jarl of Markarth", 	"Become the Thane of the Reach")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Morthal Quests"

		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformMorthalA", 	"Falion's Secret", 			"Morthal Quests", 		"Follow Falion at 1:00 AM",		"Investigate Falion's activities at night")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformMorthalB", 	"For the Good of Morthal", 	"Morthal Quests", 		"Gorm (while away from Jarl)", 	"Deliver the letter to Captain Aldis")
		MCM._Add_Quest_Data(false, 	20, 999,		"MS14", 				"Laid to Rest", 			"Morthal Quests", 		"Jonna, Morthal Guards", 		"Investigate the house fire")


		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Collect Firewood I", 		"Morthal Quests", 		"Hroggar", 					"Get paid to collect firewood")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Collect Firewood II", 		"Morthal Quests", 		"Jorgen", 					"Get paid to collect firewood")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Delivery", 				"Morthal Quests", 		"Idgrod the Younger", 		"Deliver Idgrod's Note to Danica Pure-Spring in Whiterun")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Prove your worth", 		"Morthal Quests", 		"Benor", 					"Fight Benor and prove your worth")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Rare Gifts", 				"Morthal Quests", 		"Lami", 					"Retrieve the book 'Song of the Alchemists'")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Thane of Hjaalmarch", 		"Morthal Quests", 		"Jarl of Morthal", 			"Become the Thane of Hjaalmarch")
		
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	
	elseIf MCM._MCM_Page == "Solitude Quests"
	

		MCM._Add_Quest_Data(false, 	-999, 10,		"SolitudeFreeform04", 		"Delivery (Sorex)", 		"Solitude Quests",  		"Sorex Vinius",			"Deliver rum to Falk Firebeard")
		MCM._Add_Quest_Data(false, 	-999, 20,		"SolitudeFreeform07", 		"Elisif's Tribute", 		"Solitude Quests",  		"Elisif the Fair", 		"Deliver Torygg's War Horn to Shrine of Talos")
		MCM._Add_Quest_Data(false, 	-999, 999,		"BardsCollegeLute", 		"Finn's Lute", 				"Solitude Quests",  		"Inge Six Fingers", 	"Retrieve Finn's Lute")
		MCM._Add_Quest_Data(false, 	-999, 20,		"SolitudeFreeform02", 		"Fit for a Jarl", 			"Solitude Quests",  		"Taarie", 				"Model clothes for Elisif the Fair")
		MCM._Add_Quest_Data(false, 	-999, 999,		"CW01AOutfitImperial", 		"Get Outfitted", 			"Solitude Quests",  		"General Tullius", 		"Get a free set of armor")
		MCM._Add_Quest_Data(false, 	-999, 999,		"Favor109", 				"Kill the Vampire", 		"Solitude Quests",  		"Sybille Stentor", 		"Assault a vampire lair")
		MCM._Add_Quest_Data(false, 	-999, 225,		"MS07",						"Lights Out!", 				"Solitude Quests",  		"Jaree-Ra", 			"Help run a cargo ship aground")
		MCM._Add_Quest_Data(false, 	-999, 999,		"SolitudeFreeform01", 		"No News is Good News", 	"Solitude Quests",  		"Angeline Morrard", 	"Find information on Angeline's daughter")
		MCM._Add_Quest_Data(false, 	-999, 999,		"BardsCollegeFlute", 		"Pantea's Flute", 			"Solitude Quests",  		"Pantea Ateia", 		"Retrieve flute for Pantea")
		MCM._Add_Quest_Data(false, 	-999, 999,		"SolitudeFreeform03", 		"Return to Grace", 			"Solitude Quests",  		"Svari", 				"Convince Greta to go to temple")
		MCM._Add_Quest_Data(false, 	-999, 999,		"BardsCollegeDrum", 		"Rjorn's Drum", 			"Solitude Quests",  		"Giraud Gemane", 		"Retrieve drum for Giraud")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS05", 					"Tending the Flames", 		"Solitude Quests",  		"Viarmo", 				"Become a member of the Bards College")
		MCM._Add_Quest_Data(false, 	50, 999,		"MS06Start", 				"The Man Who Cried Wolf", 	"Solitude Quests",  		"Falk Firebeard", 		"Investigate Wolfskull Cave")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA15", 					"The Mind of Madness", 		"Solitude Quests",  		"Dervenin", 			"Solve mystery of Pelagius Wing")
		MCM._Add_Quest_Data(false, 	-999, 20,		"SolitudeFreeform06", 		"The Spiced Wine", 			"Solitude Quests",  		"Evette San", 			"Retrieve spices from Vittoria")
		MCM._Add_Quest_Data(false, 	50, 150,		"MS06", 					"The Wolf Queen Awakened",	"Solitude Quests",  		"Falk Firebeard", 		"Potema must be stopped")

		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"A Few Words With You", 	"Solitude Quests",  		"Octieve San", 				"Talk to Irnskar Ironhand for Octieve San")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dungeon Delving", 			"Solitude Quests",  		"Noster Eagle-Eye", 		"Retrieve Noster's Helmet")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Kill the Bandit Leader", 	"Solitude Quests",  		"Ahtar", 					"Kill the bandit leader")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a septim I", 			"Solitude Quests",  		"Dervenin", 				"Give a septim to a beggar")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a septim II", 		"Solitude Quests",  		"Noster Eagle-Eye", 		"Give a septim to a beggar")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a septim III", 		"Solitude Quests",  		"Svari", 					"Give a septim to a beggar")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Rare Gifts", 				"Solitude Quests",  		"Captain Aldis", 			"Retrieve the book 'The Mirror'")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Thane of Haafingar", 		"Solitude Quests",  		"Jarl of Solitude", 		"Become the Thane of Haafingar")
		
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Winterhold Quests"

		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformWinterholdC", 		"Drowned Sorrows", 		"Winterhold Quests", 		"Dagur", 	"Find Ranmir's lost love")
		
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"A Few Words With You", 	"Winterhold Quests", 		"Haran", 					"Talk to Ranmir for Haran")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dungeon Delving", 			"Winterhold Quests", 		"Jarl Korir", 				"Retrieve the Helm of Winterhold")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Have a drink", 			"Winterhold Quests", 		"Razelan", 					"Buy a drink for a drunk")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Some Light Theft", 		"Winterhold Quests", 		"Malur Seloth", 			"Steal the Staff of Arcane Authority for Malur Seloth")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Thane of Winterhold",		"Winterhold Quests", 		"Jarl of Winterhold", 		"Become the Thane of Winterhold")
		
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Misc Town Quests"
	
		MCM._Add_Quest_Data(false, 	-999, 15,		"FreeformDragonBridge01", 	"(Dragon Bridge) Dragon's Breath Mead", 	"Misc Town Quests", 		"Olda",					"Retrieve some Dragon's Breath Mead for Olda")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformIvarstead04", 		"(Ivarstead) Climb the Steps", 				"Misc Town Quests", 		"Klimmek",				"Deliver goods to High Hrothgar for Klimmek")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformIvarstead03",		"(Ivarstead) Grin and Bear It", 			"Misc Town Quests", 		"Temba Wide-Arm",		"Hunt 10 bears and Return their Pelts to Temba Wide-Arm")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformIvarstead01", 		"(Ivarstead) Lifting the Shroud", 			"Misc Town Quests", 		"Wilhelm",				"Investigate the strange happenings at Shroud Hearth Barrow")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformIvarstead02", 		"(Ivarstead) The Straw that Broke", 		"Misc Town Quests", 		"Narfi",				"Investigate Narfi's troubles")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformRiverwood01", 		"(Riverwood) A Lovely Letter", 				"Misc Town Quests", 		"Sven, Faendal",		"Resolve the Riverwood love triangle")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MS13",						"(Riverwood) The Golden Claw", 				"Misc Town Quests", 		"Lucan Valerius",		"Retrieve the Golden Claw from Bleak Falls Barrow")
		MCM._Add_Quest_Data(false, 	-999, 999,		"RoriksteadFreeform", 		"(Rorikstead) Erik the Slayer", 			"Misc Town Quests", 		"Erik",					"Help Erik become an adventurer")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformShorsStone01", 	"(Shor's Stone) Mine or Yours", 			"Misc Town Quests", 		"Filnjar",				"Clear Redbelly Mine of spiders")
		MCM._Add_Quest_Data(false, 	20, 30,			"FreeformShorsStone02", 	"(Shor's Stone) Special Delivery", 			"Misc Town Quests", 		"Sylgja",				"Deliver the letters to Darkwater Crossing")
		
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"(Dragon Bridge) Collect Firewood", 	"Misc Town Quests", 		"Horgeir",				"Get paid to collect firewood")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"(Dragon Bridge) Harvest Crops", 		"Misc Town Quests", 		"Azzada Lylvieve",		"Get paid to harvest crops")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"(Ivarstead) Collect Firewood", 		"Misc Town Quests", 		"Temba Wide-Arm",		"Get paid to collect firewood")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"(Ivarstead) Harvest Crops", 			"Misc Town Quests", 		"Boti",					"Get paid to harvest crops")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"(Ivarstead) Have a Septim", 			"Misc Town Quests", 		"Narfi",				"Give a septim to a beggar")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"(Riverwood) Collect Firewood", 		"Misc Town Quests", 		"Hod",					"Get paid to collect firewood")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"(Riverwood) Have a Drink", 			"Misc Town Quests", 		"Embry",				"Buy a drink for a drunk")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"(Rorikstead) Harvest Crops I", 		"Misc Town Quests", 		"Reldith",				"Get paid to harvest crops")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"(Rorikstead) Harvest Crops II", 		"Misc Town Quests", 		"Lemkil",				"Get paid to harvest crops")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Companions"
	
		MCM._Add_Quest_Data(false, 	10, 999,		"C00", 	"I. Take Up Arms", 					"Companions", 		"Various",					"Join the Companions")
		MCM._Add_Quest_Data(false, 	-999, 999,		"C01", 	"II. Proving Honor", 				"Companions", 		"Skjor",					"Retrieve fragment of Wuuthrad")
		MCM._Add_Quest_Data(false, 	-999, 999,		"C03", 	"III. The Silver Hand", 			"Companions", 		"Skjor",					"Clear Gallows Rock")
		MCM._Add_Quest_Data(false, 	-999, 999,		"C04", 	"IV. Blood's Honor", 				"Companions", 		"Kodlak Whitemane",			"Kill Glenmoril Witch")
		MCM._Add_Quest_Data(false, 	-999, 999,		"C05", 	"V. Purity of Revenge", 			"Companions", 		"Vilkas",					"Wipe out the Silver Hand")
		MCM._Add_Quest_Data(false, 	-999, 999,		"C06",	"VI. Glory of the Dead", 			"Companions", 		"Vilkas",					"Cleanse Kodlak's spirit")
		
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Animal Extermination (Beast)", 	"Companions", 		"Aela the Huntress",		"Kill the invading beast")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Animal Extermination (Den)", 		"Companions", 		"Aela the Huntress",		"Clear the beast den")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dragon Seekers", 					"Companions", 		"Farkas, Vilkas",			"Kill the dragon")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Escaped Criminal", 				"Companions", 		"Skjor, Vilkas",			"Kill the escaped criminal")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Family Heirloom", 					"Companions", 		"Skjor, Vilkas",			"Retrieve the family heirloom")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Hired Muscle",						"Companions", 		"Farkas",					"Bring the citizen back in line")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Purity", 							"Companions", 		"Farkas, Vilkas",			"Help the Companion give up beasthood")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Rescue Mission", 					"Companions", 		"Skjor, Vilkas",			"Rescue the kidnapped citizen")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Retrieval", 						"Companions", 		"Aela the Huntress",		"Retrieve the fragment of Wuuthrad")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Stealing Plans", 					"Companions", 		"Aela the Huntress",		"Retrieve info on the Silver Hand HQ")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Striking the Heart", 				"Companions", 		"Aela the Huntress",		"Kill the Silver Hand leader")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Totems of Hircine", 				"Companions", 		"Aela the Huntress",		"Retrieve the Totem of Hircine")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Trouble in Skyrim", 				"Companions", 		"Farkas",					"Clear the troublesome area")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "College of Winterhold"
	
		MCM._Add_Quest_Data(false, 	-999, 999,		"MG01", 				"I. First Lessons", 				"College of Winterhold", 		"Faralda",				"Join College of Winterhold")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MG02", 				"II. Under Saarthal", 				"College of Winterhold", 		"Tolfdir",				"Investigate Saarthal")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MG03", 				"III. Hitting the Books", 			"College of Winterhold", 		"Savos Aren",			"Retrieve books")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MG04", 				"IV. Good Intentions", 				"College of Winterhold", 		"Tolfdir",				"Speak to Augur of Dunlain")
		MCM._Add_Quest_Data(false, 	-999, 999,		"mg06", 				"V. Revealing the Unseen", 			"College of Winterhold", 		"Mirabelle Ervine",		"Lean location of Staff of Magnus")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MG05", 				"VI. Containment", 					"College of Winterhold", 		"Automatic Start",		"Deal with Eye of Magnus aftermath")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MG07", 				"VII. The Staff of Magnus", 		"College of Winterhold", 		"Mirabelle Ervine",		"Retrieve Staff of Magnus")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MG08", 				"VIII. The Eye of Magnus", 			"College of Winterhold", 		"Automatic Start",		"Take back the college")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRitual05", 			"Alteration Ritual Spell", 			"College of Winterhold", 		"Tolfdir",				"Retrieve dragon heartscales")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRArniel01", 			"Arniel's Endeavor I", 				"College of Winterhold", 		"Arniel Gane",			"Uncover an ancient Dwemer secret")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRArniel02", 			"Arniel's Endeavor II", 			"College of Winterhold", 		"Arniel Gane",			"Uncover an ancient Dwemer secret")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRArniel03", 			"Arniel's Endeavor III", 			"College of Winterhold", 		"Arniel Gane",			"Uncover an ancient Dwemer secret")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRArniel04", 			"Arniel's Endeavor IV", 			"College of Winterhold", 		"Arniel Gane",			"Uncover an ancient Dwemer secret")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRAppBrelyna01", 		"Brelyna's Practice", 				"College of Winterhold", 		"Brelyna Maryon",		"Let Brelyna practice spells on you")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRitual03", 			"Conjuration Ritual Spell", 		"College of Winterhold", 		"Phinis Gestor",		"Summon unbound Daedra")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRitual01", 			"Destruction Ritual Spell",			"College of Winterhold", 		"Faralda",				"Learn powerful Destruction spell")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunMidden01QST", 		"Forgotten Names", 					"College of Winterhold", 		"World Encounter",		"Summon the Dremora pirate, Velehk Sain\n NOTE: Mark complete manually, this quest does not appear in the journal")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRitual02", 			"Illusion Ritual Spell", 			"College of Winterhold", 		"Drevis Neloren",		"Retrieve books on Illusion")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRAppJzargo01", 		"J'zargo's Experiment", 			"College of Winterhold", 		"J'zargo",				"Help J'zargo test new spell")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRAppOnmund01", 		"Onmund's Request", 				"College of Winterhold", 		"Onmund",				"Retrieve Onmund's amulet from Enthir")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGR02", 				"Out of Balance", 					"College of Winterhold", 		"Drevis Neloren",		"Cleanse magic focal points")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRejoinQuest", 		"Rejoining the College", 			"College of Winterhold", 		"Automatic Start",		"Rejoin college after breaking rules")
		MCM._Add_Quest_Data(false, 	-999, 999,		"MGRitual04", 			"Restoration Ritual Spell", 		"College of Winterhold", 		"Colette Marence",		"Retrieve Augur of Dunlain")


		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Aftershock", 					"College of Winterhold", 		"Tolfdir",					"Contain rupture caused by Eye of Magnus")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Enchanting Pick-Up", 			"College of Winterhold", 		"Sergius Turrianus",		"Retrieve item for enchanting")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Fetch me that Book!", 			"College of Winterhold", 		"Urag gro-Shub",			"Retrieve book for Urag gro-Shub")	
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Restocking Soul Gems", 		"College of Winterhold", 		"Sergius Turrianus",		"Help Serius stock soul gems")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Shalidor's Insights", 			"College of Winterhold", 		"Urag gro-Shub",			"Retrieve Shalidor's Insights")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Tolfdir the Absent-Minded", 	"College of Winterhold", 		"Tolfdir",					"Retrieve Tolfdir's missing alembic")
		
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Thieves Guild"
	
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG00", 		"I. A Chance Arrangement", 				"Thieves Guild", 		"Brynjolf",						"Steal Madesi's ring")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG01", 		"II. Taking Care of Business", 			"Thieves Guild", 		"Brynjolf",						"Collect debts")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG02", 		"III. Loud and Clear", 					"Thieves Guild", 		"Brynjolf",						"Send a message to a former Thieves Guild client")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG03", 		"IV. Dampened Spirits", 				"Thieves Guild", 		"Brynjolf, Maven Black-Briar",	"Put Maven Black-Briar's competition out of business")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG04", 		"V. Scoundrel's Folly", 				"Thieves Guild", 		"Mercer Frey",					"Squeeze a reluctant informer for information")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG05", 		"VI. Speaking With Silence", 			"Thieves Guild", 		"Mercer Frey",					"Track down the Dunmer behind the Guild's misfortunes")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG06", 		"VII. Hard Answers (lvl'd item)", 		"Thieves Guild", 		"Enthir",						"Help translate Gallus's journal")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG07", 		"VIII. The Pursuit (lvl'd item)",		"Thieves Guild", 		"Brynjolf",						"Break into Mercer Frey's house and search for clues")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG08A", 		"IX. Trinity Restored (lvl'd item)", 	"Thieves Guild", 		"Karliah",						"Become one of the Nightingales (best reward at lvl 32+)")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG08B",		"X. Blindsighted (lvl'd item)", 		"Thieves Guild", 		"Brynjolf",						"Stop Mercer Frey")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG09", 		"XI. Darkness Returns", 				"Thieves Guild", 		"Karliah",						"Walk the Pilgrim's Path and return the Skeleton Key to its rightful place")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TGLeadership", "XII. Under New Management", 			"Thieves Guild", 		"Brynjolf",						"Become the Guildmaster of the Thieves Guild")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TG02B", 				"Meet the Family", 				"Thieves Guild", 		"Brynjolf",						"Speak with some of the members of the Thieves Guild and pick up your gear")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TGCrown", 				"No Stone Unturned", 			"Thieves Guild", 		"Unusual Gem",					"Find the 24 gems to restore the Crown of Barenziah")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TGCrownMisc", 			"No Stone Unturned (Intro)", 	"Thieves Guild", 		"Unusual Gem",					"Find the 24 gems to restore the Crown of Barenziah")
		MCM._Add_Quest_Data(false, 	-999, 80,		"TGLarceny", 			"The Litany of Larceny",		"Thieves Guild", 		"Delvin Mallory",				"Find items for Delvin Mallory")
		MCM._Add_Quest_Data(false, 	-999, 30,		"TGFenceCaravan", 		"Caravan Fence Quest", 			"Thieves Guild", 		"Tonilia",						"Deliver moon sugar to Ri'saad")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformRiften21", 	"Toying With The Dead", 		"Thieves Guild", 		"Vekel the Man",				"Retrieve necromancer's journals")	
		
		MCM._Add_Quest_Data(false, 	-999, 999,		"TGTQ03", 	"Imitation Amnesty", 	"Thieves Guild", 		"Delvin Mallory",				"Help get a convicted prisoner released from jail")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TGTQ01", 	"Silver Lining", 		"Thieves Guild", 		"Delvin Mallory",				"Recover a stolen silver mold for a silversmith")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TGTQ04", 	"Summerset Shadows",	"Thieves Guild", 		"Delvin Mallory",				"Remove a rival guild from the picture")
		MCM._Add_Quest_Data(false, 	-999, 999,		"TGTQ02", 	"The Dainty Sload", 	"Thieves Guild", 		"Delvin Mallory",				"Frame a ship's captain to get revenge for a jilted merchant")
		
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Reparations", 			"Thieves Guild", 		"Break Thieves Guild rules",	"Make reparations for breaking the Thieves Guild rules")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"The Bedlam Job", 		"Thieves Guild", 		"Delvin Mallory",				"Steal a set amount of gold's worth of items")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"The Burglary Job", 	"Thieves Guild", 		"Vex",							"Steal a special item from a wealthy home")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"The Fishing Job", 		"Thieves Guild", 		"Delvin Mallory",				"Steal an item out of a target's pocket")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"The Heist Job", 		"Thieves Guild", 		"Vex",							"Steal a particular item from a store")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"The Numbers Job", 		"Thieves Guild", 		"Delvin Mallory",				"Alter the business ledger of a store")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"The Shill Job", 		"Thieves Guild", 		"Vex",							"Place an item as evidence inside a wealthy home")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"The Sweep Job", 		"Thieves Guild", 		"Vex",							"Steal three specific valuable items from a wealthy house")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Dark Brotherhood"
	
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB01", 		"I. Innocence Lost",  					"Dark Brotherhood", 		"Aventus Aretino",				"Help an orphaned child avoid being returned to a sadistic caretaker")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB01Misc", 	"II. Delayed Burial",  					"Dark Brotherhood", 		"Cicero",						"Convince an unwilling farmer to help fix a stranded jester's broken wagon wheel")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB02", 		"III. With Friends Like These",  		"Dark Brotherhood", 		"Sleep after Innocence Lost",	"Repay your debt to the Family, and show you are willing to kill on command")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB02a", 		"IV. Sanctuary",  						"Dark Brotherhood", 		"Astrid",						"Pick up your first contracts as a Brotherhood member")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB03", 		"V. Mourning Never Comes",  			"Dark Brotherhood", 		"Astrid",						"Help Muiri get her revenge")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB04", 		"VI. Whispers in the Dark", 			"Dark Brotherhood", 		"Astrid",						"Spy on the Night Mother's keeper to see if he is planning sabotage against the Brotherhood")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB04a", 		"VII. The Silence Has Been Broken",  	"Dark Brotherhood", 		"Astrid",						"Meet Amaund Motierre inside Volunruud and learn who he wants assassinated")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB05", 		"VIII. Bound Until Death",  			"Dark Brotherhood", 		"Astrid",						"Assassinate Vittoria Vici at her own wedding")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB06", 		"IX. Breaching Security",  				"Dark Brotherhood", 		"Astrid",						"Assassinate and frame the son of a high-ranking Imperial guard")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB07", 		"X. The Cure for Madness",  			"Dark Brotherhood", 		"Gabriella",					"Confront the traitor among the Dark Brotherhood")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB08", 		"XI. Recipe for Disaster",  			"Dark Brotherhood", 		"Astrid",						"Assume the identity of the famous Gourmet in an effort to assassinate the Emperor")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB09", 		"XII. To Kill an Empire",  				"Dark Brotherhood", 		"Astrid",						"Attempt to assassinate the Emperor while disguised as the Gourmet")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB10", 		"XIII. Death Incarnate",  				"Dark Brotherhood", 		"Automatic Start",				"Assist Brotherhood members in the fight against the Penitus Oculatus assault")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DB11", 		"XIV. Hail Sithis!",  					"Dark Brotherhood", 		"Night Mother",					"One of the biggest contracts in Brotherhood history is yours to fulfill")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBDestroy", 	"Destroy the Dark Brotherhood!",  		"Dark Brotherhood", 		"Automatic Start",				"Finish the Dark Brotherhood and rid Skyrim of their kind!")
		
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract09", 		"Kill Agnis",  				"Dark Brotherhood", 		"Nazir",						"Assassinate Agnis to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract08", 		"Kill Anoriath",  			"Dark Brotherhood", 		"Nazir",						"Assassinate Anoriath to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract03", 		"Kill Beitild",  			"Dark Brotherhood", 		"Nazir",						"Assassinate Beitild to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract06", 		"Kill Deekus",  			"Dark Brotherhood", 		"Nazir",						"Assassinate Deekus to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract02", 		"Kill Ennodius Papius",  	"Dark Brotherhood", 		"Nazir",						"Assassinate Ennodius Papius to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract11", 		"Kill Helvard",  			"Dark Brotherhood", 		"Nazir",						"Assassinate Helvard to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract04", 		"Kill Hern",  				"Dark Brotherhood", 		"Nazir",						"Assassinate Hern to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract05", 		"Kill Lurbuk",  			"Dark Brotherhood", 		"Nazir",						"Assassinate Lurbuk to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract10", 		"Kill Maluril",  			"Dark Brotherhood", 		"Nazir",						"Assassinate Maluril to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract07", 		"Kill Ma'randru-jo",  		"Dark Brotherhood", 		"Nazir",						"Assassinate Ma'randru-jo to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract01", 		"Kill Narfi",  				"Dark Brotherhood", 		"Nazir",						"Assassinate Narfi to complete a Dark Brotherhood contract")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBSideContract12", 		"Kill Safia",  				"Dark Brotherhood", 		"Nazir",						"Assassinate Safia to complete a Dark Brotherhood contract")
		
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBOlavaReadingTreasureObjective", 		"Locate the Assassin of Old",  			"Dark Brotherhood", 		"Olava the Feeble",		"Find the Dark Brotherhood Assassin")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBTortureTreasureMiscObjective1", 		"Take the Hidden Treasure I", 			"Dark Brotherhood", 		"Torture Victims",		"Torture the Brotherhood's prisoners for treasure")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBTortureTreasureMiscObjective2", 		"Take the Hidden Treasure II",  		"Dark Brotherhood", 		"Torture Victims",		"Torture the Brotherhood's prisoners for treasure")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBTortureTreasureMiscObjective3", 		"Take the Hidden Treasure III",  		"Dark Brotherhood", 		"Torture Victims",		"Torture the Brotherhood's prisoners for treasure")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DBTortureTreasureMiscObjective4", 		"Take the Hidden Treasure IV",  		"Dark Brotherhood", 		"Torture Victims",		"Torture the Brotherhood's prisoners for treasure")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DarkBrotherhoodSanctuaryRepair", 		"Where You Hang Your Enemy's Head",  	"Dark Brotherhood", 		"Nazir",				"Restore the Dark Brotherhood's sanctuary")

		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Honor Thy Family",					"Dark Brotherhood", 		"Attack member of Dark Brotherhood",	"Regain the trust of your fellow Assassins")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"The Dark Brotherhood Forever", 	"Dark Brotherhood", 		"Night Mother",							"Yet another child has prayed to their mother")
		
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Dungeon Quests"
	
		MCM._Add_Quest_Data(false, 	-999, 100,		"dunAngarvundeQST", 		"Angarvunde", 							"Dungeon Quests", 		"Medresi Dran",					"Retrieve the treasure of Angarvunde\n Location: Angarvunde")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunAnsilvundQST", 			"Ansilvund", 							"Dungeon Quests", 		"Automatic Start", 				"Kill Lu'ah Al-Skaven\n Location: Ansilvund")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunBlindCliffQST",			"The Affairs of Hagravens", 			"Dungeon Quests", 		"Melka", 						"Help Melka reclaim the tower\n Location: Blind Cliff Bastion")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunDarklightQST", 			"Repentance", 							"Dungeon Quests", 		"Illia", 						"Prevent Silvia from transforming into a hargraven\n Location: Darklight Tower")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunForelhostQST", 			"Siege on the Dragon Cult", 			"Dungeon Quests", 		"Captain Valmir", 				"Kill Rahgot\n Location: Forelhost")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunFrostflowAbyssQST", 	"Frostflow Abyss", 						"Dungeon Quests", 		"Automatic Start", 				"Investigate Frostflow Lighthouse\n Location: Frostflow Lighthouse")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunFrostmereCryptQST", 	"The Pale Lady", 						"Dungeon Quests", 		"Automatic Start",				"Investigate Frostmere Crypt\n Location: Frostmere Crypt")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunHighGateRuinsQST", 		"A Scroll For Anska",					"Dungeon Quests", 		"Anska", 						"Help Anska trace her roots in High Gate Ruins\n Location: High Gate Ruins")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunHillgrundsTombQST", 	"Ancestral Worship", 					"Dungeon Quests", 		"Golldir", 						"Prevent necromancer from defiling tomb\n Location: Hillgrund's Tomb")
		MCM._Add_Quest_Data(false, 	-999, 80,		"dunIronbindQST", 			"Coming of Age", 						"Dungeon Quests", 		"Salma", 						"Help adventurers retrieve their riches\n Location: Ironbind Barrow")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunLiarsRetreatQST", 		"Liar's Retreat", 						"Dungeon Quests", 		"Automatic Start", 				"Retrieve the Longhammer from a fallen bandit\n Location: Liar's Retreat\n NOTE: Mark complete manually, this quest does not appear in the journal")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunMistwatchQST", 			"Mistwatch", 							"Dungeon Quests", 		"Christer", 					"Help Christer locate his wife\n Location: Mistwatch")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunNilheimQST", 			"Telrav's Request", 					"Dungeon Quests", 		"Telrav", 						"Escort Telrav back to Nilheim\n Location: Nilheim")
		MCM._Add_Quest_Data(false, 	-999, 10,		"dunRagnvaldQST", 			"Ragnvald", 							"Dungeon Quests", 		"Otar", 						"Investigate Ragnvald\n Location: Ragnvald")
		MCM._Add_Quest_Data(false, 	-999, 22,		"dunRebelsCairnQST", 		"Rebel's Cairn", 						"Dungeon Quests", 		"The Legend of Red Eagle", 		"Retrieve Red Eagle's sword\n Location: Red Eagle Redoubt")
		MCM._Add_Quest_Data(false, 	-999, 39,		"dunRobbersGorgeQST", 		"Robber's Gorge", 						"Dungeon Quests", 		"Automatic Start", 				"Retrieve treasure of Robber's Gorge\n Location: Robber's Gorge")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunSouthfringeQST", 		"The Savior of Selveni Nethri",			"Dungeon Quests", 		"Selveni Nethri", 				"Help Selveni escape Southfringe Sanctum\n Location: Southfringe Sanctum")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunTrevasWatchQST", 		"Infiltration", 						"Dungeon Quests", 		"Stalleo", 						"Help take back Treva's Watch\n Location: Treva's Watch")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunValthumeQST", 			"Evil in Waiting", 						"Dungeon Quests", 		"Automatic Start", 				"Seal away an ancient evil\n Location: Valthume")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunVolskyggeQST", 			"Volskygge", 							"Dungeon Quests", 		"Automatic Start",				"Climb your way to the evil of Volskygge\n Location: Volskygge\n NOTE: Mark complete manually, this quest does not appear in the journal")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunVolunruudQST", 			"Silenced Tongues", 					"Dungeon Quests", 		"Heddic's Volunruud Notes",		"Unlock burial chamber of Kvenel\n Location: Volunruud")
		MCM._Add_Quest_Data(false, 	-999, 99,		"dunYngolBarrowQST", 		"Yngol's Barrow", 						"Dungeon Quests", 		"Birna",						"Retrieve treasure of Yngol Barrow\n Location: Yngol's Barrow")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	elseIf MCM._MCM_Page == "Misc Quests"

		MCM._Add_Quest_Data(false, 	-999, 15,		"FreeformCaravansA", 						"Amulet of the Moon", 				"Misc Quests", 		"Kharjo", 							"Retrieve the Moon Amulet\n Location: Khajit Caravan")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DarkwaterCrossingDerkeethusRescueQuest", 	"Extracting an Argonian", 			"Misc Quests", 		"World Encounter", 					"Rescue Derkeethus\n Location: Darkwater Crossing")
		MCM._Add_Quest_Data(false, 	-999, 10,		"FreeformDushnikhYalA", 					"Gharol's Message", 				"Misc Quests", 		"Gharol", 							"Deliver Gharol's sword to Lash\n Location: Dushnikh Yal")
		MCM._Add_Quest_Data(false, 	-999, 999,		"dunHunterQST",								"Kyne's Sacred Trials", 			"Misc Quests", 		"Froki Whetted-Blade", 				"Participate in Kyne's sacred trials\n Location: Froki's Shack")
		MCM._Add_Quest_Data(false, 	-999, 20,		"FavorOrcsIntro", 							"The Forgemaster's Fingers", 		"Misc Quests", 		"Orc Strongholds",					"Retrieve The Forgemaster's Fingers\n Location: Any orc stronghold")
		MCM._Add_Quest_Data(false, 	15, 999,		"FreeformHeartwoodMill", 					"Flight or Fight", 					"Misc Quests", 		"Grosta", 							"Help Grosta locate her husband\n Location: Heartwood Mill")
		MCM._Add_Quest_Data(false, 	-999, 10,		"FreeformHighHrothgarA", 					"The Words of Power", 				"Misc Quests", 		"Arngeir", 							"Learn the Word of Power from a word wall\n Location: High Hrothgar")
		MCM._Add_Quest_Data(false, 	-999, 35,		"FreeformKarthwastenA", 					"Sanuarach Mine", 					"Misc Quests", 		"Ainethach, Atar", 					"Settle a dispute over Sanuarach Mine\n Location: Karthwasten")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformKolskeggrA", 						"Kolskeggr Mine", 					"Misc Quests", 		"Pavo Attius, Skaggi Scar-Face", 	"Clear the Forsworn from the mine\n Location: Kolskeggr Mine")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformKynesgroveA", 						"Dravynea's Frost Salts", 			"Misc Quests", 		"Dravynea the Stoneweaver", 		"Retrieve some Frost Salts for Dravynea\n Location: Kynesgrove")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA06", 									"The Cursed Tribe", 				"Misc Quests", 		"Atub", 							"Lift the curse on Orcs of Largashbur\n Location: Largashbur")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformMerryfairFarm", 					"Bow to the Master", 				"Misc Quests", 		"Dravin Llanith", 					"Retrieve the stolen bow\n Location: Merryfair Farm")
		MCM._Add_Quest_Data(false, 	-999, 50,		"dunMossMotherQST", 						"Moss Mother Cavern", 				"Misc Quests", 		"Valdr", 							"Help a hunter avenge his companions\n Location: Moss Mother Cavern")
		MCM._Add_Quest_Data(false, 	-999, 20,		"FreeformOldHroldanB", 						"The Ghost of Old Hroldan", 		"Misc Quests", 		"Eydis", 							"Retrieve Hjalti's Sword\n Location: Old Hroldan Inn")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA02", 									"Boethiah's Calling", 				"Misc Quests", 		"Automatic Start", 					"Become Boethiah's champion\n Location: Sacellum of Boethiah")
		MCM._Add_Quest_Data(false, 	-999, 10,		"FreeformSalviusFarmA", 					"Rogatus's Letter", 				"Misc Quests", 		"Rogatus Salvius", 					"Deliver a letter to the farmer's son\n Location: Salvius Farmhouse")
		MCM._Add_Quest_Data(false, 	20, 999,		"FreeformSarethiFarm", 						"Smooth Jazbay", 					"Misc Quests", 		"Avrusa Sarethi", 					"Retrieve 20 Jazbay Grapes for Avrusa\n Location: Sarethi Farm")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA04", 									"Discerning the Transmundane", 		"Misc Quests", 		"Septimus Signus",					"Investigate the Dwemer lockbox\n Location: Septimus Signus's Outpost")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA01", 									"The Black Star", 					"Misc Quests", 		"Aranea Ienith", 					"Find and repair Azura's Star\n Location: Shrine of Azura")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA13", 									"The Only Cure", 					"Misc Quests", 		"Kesh the Clean", 					"Kill the apostate worshipper\n Location: Shrine of Peryite")
		MCM._Add_Quest_Data(false, 	-999, 20,		"FreeformSoljundsSinkholeA", 				"Soljund's Sinkhole", 				"Misc Quests", 		"Perth", 							"Clear the Draugr from the mine\n Location: Soljund's Sinkhole")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DA09", 									"The Break of Dawn", 				"Misc Quests", 		"Meridia's Beacon", 				"Clean Meridia's temple\n Location: Statue to Meridia")
		MCM._Add_Quest_Data(false, 	-999, 999,		"FreeformStonehillsA", 						"Payment Delivery", 				"Misc Quests", 		"Pactur",							"Notify Thane Bryling that the shipment will be arriving soon\n Location: Stonehills")
		MCM._Add_Quest_Data(false, 	5, 150,			"DA14", 									"A Night To Remember", 				"Misc Quests", 		"Sam Guevenne", 					"Find your lost friend, Sam, as you recover from a bad hangover\n Location: Various Inns")
		MCM._Add_Quest_Data(false, 	-999, 150,		"dunGauldursonQST", 						"Forbidden Legend", 				"Misc Quests", 		"Various", 							"Investigate the forgotten Gauldur Legend\n Location: Various")

		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"A Few Words with You", 		"Misc Quests", 		"Iddra",										"Talk to Roggi Knot-Beard for Iddra\n Location: Braidwood Inn")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Bounty: Bandit Boss", 			"Misc Quests", 		"Any inkeeper, jarl, or hold steward",			"Kill bandit boss")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Bounty: Dragon", 				"Misc Quests",		"Any inkeeper, jarl, or hold steward",			"Kill dragon")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Bounty: Giant", 				"Misc Quests", 		"Any inkeeper, jarl, or hold steward", 			"Kill giant")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Bounty: Forsworn", 			"Misc Quests", 		"Any inkeeper or hold steward in the Reach",	"Kill forsworn leader")	
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Collect Firewood I", 			"Misc Quests", 		"Aeri", 				"Get paid to collect firewood\n Location: Anga's Mill")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Collect Firewood II", 			"Misc Quests", 		"Grosta", 				"Get paid to collect firewood\n Location: Heartwood Mill")	
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Collect Firewood III", 		"Misc Quests", 		"Ganna Uriel",			"Get paid to collect firewood\n Location: Kynesgrove")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Collect Firewood IV", 			"Misc Quests", 		"Gilfre", 				"Get paid to collect firewood\n Location: Mixwater Mill")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Collect Firewood V", 			"Misc Quests", 		"Hjorunn", 				"Get paid to collect firewood\n Location: Solitude Sawmill")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Delivery I", 					"Misc Quests", 		"Aeri", 				"Deliver Aeri's Note to Skald\n Location: Anga's Mill")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Delivery II", 					"Misc Quests", 		"Sondas Drenim",		"Deliver Sondas's Note to Quintus Navale\n Location: Goldenrock Mine")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dragon Hunting", 				"Misc Quests", 		"Esbern",				"Kill a dragon at its lair\n Location: Sky Haven Temple")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dragon Research", 				"Misc Quests", 		"Esbern",				"Help Esbern complete his research on dragons\n Location: Sky Haven Temple")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Dungeon Delving", 				"Misc Quests", 		"Roggi Knot-Beard",		"Retrieve Roggi's Ancestral Shield\n Location: Kynesgrove")	
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops I", 				"Misc Quests", 		"Alfhild Battle-Born",	"Get paid to harvest crops\n Location: Battle-Born Farm")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops II", 			"Misc Quests", 		"Bolfrida Brandy-Mug",	"Get paid to harvest crops\n Location: Brandy-Mug Farm")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops III", 			"Misc Quests", 		"Belyn Hlaalu", 		"Get paid to harvest crops\n Location: Hlaalu Farm")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops IV", 			"Misc Quests", 		"Tulvur",				"Get paid to harvest crops\n Location: Hollyfrost Farm")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops V", 				"Misc Quests", 		"Katla",				"Get paid to harvest crops\n Location: Katla's Farm")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops VI", 			"Misc Quests", 		"Synda Llanith",		"Get paid to harvest crops\n Location: Merryfair Farm")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops VII", 			"Misc Quests", 		"Severio Pelagia",		"Get paid to harvest crops\n Location: Pelagia Farm")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops VIII", 			"Misc Quests", 		"Vigdis Salvius",		"Get paid to harvest crops\n Location: Salvius Farm")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops IX", 			"Misc Quests", 		"Avrusa Sarethi",		"Get paid to harvest crops\n Location: Sarethi Farm")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Harvest Crops X", 				"Misc Quests", 		"Addvild",				"Get paid to harvest crops\n Location: Snow-Shod Farm")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Hide and Seek", 				"Misc Quests", 		"Children", 			"Play a round of Hide and Seek with some children in town\n Location: Any City")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Kill the Bandit Leader", 		"Misc Quests", 		"Annekke Crag-Jumper",	"Kill the bandit leader\n Location: Darkwater Crossing")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Mine Ore (Orc Strongholds)", 	"Misc Quests", 		"Various", 				"Get paid to mine ore\n Location: Dushnikh Yal, Mor Khazgur, Narzulbur")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Mine Ore (Mines)", 			"Misc Quests", 		"Various", 				"Get paid to mine ore\n Location: Goldenrock Mine, Kolskeggr Mine, Left Hand Mine, Whistling Mine, Stonehills")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Mine Ore (Towns)", 			"Misc Quests", 		"Various", 				"Get paid to mine ore\n Location: Kynesgrove, Shor's Stone, Soljund's Sinkhole")	
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Prove your worth I", 			"Misc Quests", 		"Chief Burguk", 		"Fight Chief Burguk and prove your worth\n Location: Dushnikh Yal")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Prove your worth II", 			"Misc Quests", 		"Chief Larak", 			"Fight Chief Larak and prove your worth\n Location: Mor Khazgur")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Prove your worth III", 		"Misc Quests", 		"Chief Mauhulakh", 		"Fight Chief Mauhulakh and prove your worth\n Location: Narzulbur")	
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Tag, you're it!", 				"Misc Quests", 		"Children", 			"Play a round of Tag with the children of a city\n Location: Any City")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Wizard Duel", 					"Misc Quests", 		"World Encounter", 		"Fend off and defeat a challenger\n Location: Any City")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	elseIf MCM._MCM_Page == "Dawnguard"
		
		MCM._Add_Quest_Data(false, 	10, 20,		"DLC1HunterBaseStage2", 	"Bolstering the Ranks", 	"Dawnguard", 	"Find Florentius Baenius and recruit him into the Dawnguard", "Sorine Jurard")
		
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Ancient Technology", 		"Dawnguard", 		"Sorine Jurard", 		"Retrieve Dwemer schematics to improve technology for the Dawnguard")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Cleansing Light", 			"Dawnguard", 		"Gunmar", 				"Kill the boss of a vampire lair")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Hide and Seek", 			"Dawnguard", 		"Gunmar", 				"Kill a vampire masquerading as a citizen")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Hunting the Monster", 		"Dawnguard", 		"Gunmar", 				"Destroy the vampire target")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"A Jarl's Justice", 		"Dawnguard", 		"Isran", 				"Kill a vampire masquerading as a Visiting Advisor")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Lost Relic", 				"Dawnguard", 		"Florentius Baenius", 	"Retrieve a relic of the original Dawnguard")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Preemptive Strike", 		"Dawnguard", 		"Gunmar", 				"Destroy the vampire before it turns its allies")
		MCM._Add_Quest_Data(true, 	-999, 999,		"", 	"Rescue", 					"Dawnguard", 		"Florentius Baenius", 	"Rescue a victim from vampires")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	elseIf MCM._MCM_Page == "Vampires"
		
		MCM._Add_Quest_Data(false, 	10, 100,		"DLC1RV06", 	"The Gift",						"Vampires", 		"Vingalmo", 							"Turn your spouse into a creature of the night")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DLC1RV08", 	"Rings of Blood Magic", 		"Vampires", 		"Feran Sadri", 							"Retrieve the Ring of the Erudite and the Ring of The Beast")
		MCM._Add_Quest_Data(false, 	-999, 999,		"DLC1RV09", 	"Amulets of Night Power", 		"Vampires", 		"Feran Sadri", 							"Retrieve the Amulets of Night Power")
		MCM._Add_Quest_Data(false, 	10, 100,		"DLC1RV10", 	"Destroying the Dawnguard", 	"Vampires", 		"Garan Marethi or Fura Bloodmouth", 	"Kill the Dawnguard leaders")

		MCM._Add_Quest_Data(true, 	-999, 999, 		"", 	"Ancient Power", 				"Vampires", 	"Feran Sadri", 								"Retrieve vampire parts from varied locations around Skyrim")
		MCM._Add_Quest_Data(true, 	-999, 999, 		"", 	"Culling the Beast",			"Vampires", 	"Fura Bloodmouth or Garan Marethi", 		"Kill the thin-blooded vampires")
		MCM._Add_Quest_Data(true, 	-999, 999, 		"", 	"Deceiving the Herd",			"Vampires", 	"Feran Sadri", 								"Frame the Dawnguard for murder")
		MCM._Add_Quest_Data(true, 	-999, 999, 		"", 	"The Hunt", 					"Vampires", 	"Fura Bloodmouth or Garan Marethi", 		"Kill the Dawnguard spy")
		MCM._Add_Quest_Data(true, 	-999, 999, 		"", 	"New Allegiances", 				"Vampires", 	"Vingalmo", 								"Turn the target into a vampire")
		MCM._Add_Quest_Data(true, 	-999, 999, 		"", 	"Protecting the Bloodline", 	"Vampires", 	"Fura Bloodmouth or Garan Marethi", 		"Destroy a vampire before it turns its allies")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
	elseIf MCM._MCM_Page == "Misc Quests (DG)"
		
		MCM._Add_Quest_Data(false, 	30, 50,		"DLC1VQDragon", 				"Learn a shout", 				"Misc Quests (DG)", 		"Durnehviir",					"Learn a dragon shout from Durnehviir")
		MCM._Add_Quest_Data(false, 	20, 20,		"DLC1VQFVBooks", 				"Forgotten Vale Books Quest", 	"Misc Quests (DG)", 		"Urag gro-Shub", 				"Bring the Ancient Falmer Tome to Urag gro-Shub")
		MCM._Add_Quest_Data(false, 	20, 30,		"DLC1VQSaint", 					"Impatience of a Saint", 		"Misc Quests (DG)", 		"Soul of Jiub", 				"Collect the ten missing pages of Saint Jiub's Opus")
		MCM._Add_Quest_Data(false, 	100, 220,	"DLC1LD", 						"Lost to the Ages", 			"Misc Quests (DG)", 		"Read The Aetherium Wars", 		"Search for the Dwemer's Aetherium Forge")
		MCM._Add_Quest_Data(false, 	20, 150,	"DLC01SoulCairnHorseQuest2", 	"Soul Cairn Horse Quest", 		"Misc Quests (DG)", 		"Distraught Soul", 				"Find Arvak's skull")
		MCM._Add_Quest_Data(false, 	10, 20,		"DLC1Surgery", 					"Surgery", 						"Misc Quests (DG)", 		"Face Sculptor", 				"Change your appearance")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	elseIf MCM._MCM_Page == "Raven Rock Quests"
	
		MCM._Add_Quest_Data(false, 	15, 25,		"DLC2RR03Intro", 	"An Axe to Find", 			"Raven Rock Quests", 	"Glover Mallory",	 	"Retrieve an ancient Nordic pickaxe for Glover Mallory")
		MCM._Add_Quest_Data(false, 	20, 30,		"DLC2RRFavor03", 	"Clean Sweep", 				"Raven Rock Quests", 	"Elder Othreloth", 		"Clear the Temple Ancestral Tomb of ash spawn")
		MCM._Add_Quest_Data(false, 	20, 30,		"DLC2RRFavor06", 	"Feeding the Addiction", 	"Raven Rock Quests", 	"Bralsa Drel", 			"Convince an innkeeper to let a drunken miner get back to the bar")
		MCM._Add_Quest_Data(false, 	20, 20,		"DLC2RRFavor02",	"Fetch the Netch", 			"Raven Rock Quests", 	"Milore Ienth", 		"Obtain five samples of netch jelly for Milore Ienth")
		MCM._Add_Quest_Data(false, 	20, 30,		"DLC2RRFavor07", 	"First Edition", 			"Raven Rock Quests", 	"Cindiri Arano", 		"Locate an important folio for Cindiri Arano")
		MCM._Add_Quest_Data(false, 	15, 50,		"DLC2RR03", 		"The Final Descent", 		"Raven Rock Quests", 	"Crescius Caerellius", 	"Find out what happened to the great-grandfather of Crescius Caerellius")
		MCM._Add_Quest_Data(false, 	20, 30,		"DLC2RRFavor04", 	"It's All In The Taste", 	"Raven Rock Quests", 	"Geldis Sadri", 		"Distribute Sadri's Sujamma to the citizens of Raven Rock")
		MCM._Add_Quest_Data(false, 	30, 130,	"DLC2RR01", 		"March of the Dead", 		"Raven Rock Quests", 	"Captain Veleth", 		"Stop the ash spawn attacks on Raven Rock")
		MCM._Add_Quest_Data(false, 	10, 20,		"DLC2TGQuest",		"Paid in Full", 			"Raven Rock Quests",	 "Glover Mallory", 		"Recover the bonemold formula for Glover Mallory")
		MCM._Add_Quest_Data(false, 	20, 20,		"DLC2RRFavor05", 	"Pain in the Necklace", 	"Raven Rock Quests", 	"Fethis Alor", 			"Find East Empire pendants for Fethis Alor")
		MCM._Add_Quest_Data(false, 	20, 30,		"DLC2RRFavor01", 	"Recipe for Distraction", 	"Raven Rock Quests", 	"Captain Veleth", 		"Locate a hidden stash of Emberbrand Wine for Captain Veleth in Raven Rock")
		MCM._Add_Quest_Data(false, 	10, 110,	"DLC2RR02", 		"Served Cold", 				"Raven Rock Quests", 	"Captain Veleth", 		"Save Councilor Morvayn from an assassination plot")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	elseIf MCM._MCM_Page == "Skaal Village Quests"
	
		MCM._Add_Quest_Data(false, 	20, 30,		"DLC2SkaalVillageFreeform2",	"Convincing Nikulas", 			"Skaal Village Quests", 		"Edla", 				"Counsel a young Skaal on the dangers of life as an adventurer")
		MCM._Add_Quest_Data(false, 	10, 20,		"DLC2WB01", 					"Filial Bonds", 				"Skaal Village Quests", 		"Wulf Wild-Blood", 		"Find Wulf Wild-Blood's brother, Torkild, who may have become a werebear")
		MCM._Add_Quest_Data(false, 	10, 50,		"DLC2SV01", 					"Lost Legacy", 					"Skaal Village Quests", 		"Tharstan", 			"Travel to Vahlok's Tomb and defeat Vahlok the Jailor")
		MCM._Add_Quest_Data(false, 	10, 30,		"DLC2SV02", 					"A New Source of Stalhrim", 	"Skaal Village Quests", 		"Deor Woodcutter", 		"Find a blacksmith missing from Skaal Village")
		MCM._Add_Quest_Data(false, 	10, 20,		"DLC2SkaalVillageFreeform1", 	"A favor for Morwen", 			"Skaal Village Quests", 		"Morwen", 				"Take Bera's necklace to Runil in Falkreath")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	elseIf MCM._MCM_Page == "Tel Mithryn Quests"
	
		MCM._Add_Quest_Data(false, 100, 200, 	"DLC2TTR7",	 	"Azra's Staffs", 				"Tel Mithryn Quests", 		"Neloth", 				"Retrieve a staff made by Azra Nightwielder for Master Neloth")
		MCM._Add_Quest_Data(false, 100, 200, 	"DLC2TTR5", 	"Briarheart Necropsy", 			"Tel Mithryn Quests", 		"Neloth", 				"Examine a Briarheart for Neloth")
		MCM._Add_Quest_Data(false, 100, 200, 	"DLC2TTR4a", 	"Experimental Subject (A)", 	"Tel Mithryn Quests", 		"Neloth", 				"Help Neloth by being a test subject in his experiment")
		MCM._Add_Quest_Data(false, 100, 100, 	"DLC2TTR4b",	"Experimental Subject (B)", 	"Tel Mithryn Quests", 		"Neloth", 				"Help Neloth by being a test subject in his experiment")
		MCM._Add_Quest_Data(false, 100, 200, 	"DLC2TTF1", 	"From the Ashes", 				"Tel Mithryn Quests", 		"Talvas Fathryon", 		"Help Talvas Fathryon by killing an ash guardian")
		MCM._Add_Quest_Data(false, 100, 400, 	"DLC2TTF2", 	"Healing a House", 				"Tel Mithryn Quests", 		"Elynea Mothren",		"Help Elynea Mothren repair the tower of Tel Mithryn")
		MCM._Add_Quest_Data(false, 100, 200, 	"DLC2TTR2", 	"Heart Stones", 				"Tel Mithryn Quests", 		"Neloth", 				"Find a heart stone for Neloth")
		MCM._Add_Quest_Data(false, -999, 999, 	"DLC2TTR8", 	"Hunting and Gathering", 		"Tel Mithryn Quests", 		"Elynea Mothren",		"Collect a rare alchemy ingredient for Elynea Mothren")
		MCM._Add_Quest_Data(false, 100, 200, 	"DLC2TTR1", 	"Lost Knowledge", 				"Tel Mithryn Quests", 		"Neloth", 				"Retrieve the Black Books for Neloth")
		MCM._Add_Quest_Data(false, 100, 200, 	"DLC2TT1b", 	"A New Debt", 					"Tel Mithryn Quests", 		"Mogrul", 				"Help Drovas Relvi with his debt to Mogrul")
		MCM._Add_Quest_Data(false, 100, 500, 	"DLC2TT2", 		"Old Friends", 					"Tel Mithryn Quests", 		"Neloth", 				"Find the source of attacks on Tel Mithryn")
		MCM._Add_Quest_Data(false, 150, 400, 	"DLC2TT1", 		"Reluctant Steward", 			"Tel Mithryn Quests", 		"Neloth", 				"Find a new steward for Neloth in Raven Rock")
		MCM._Add_Quest_Data(false, 100, 200, 	"DLC2TTR3a", 	"Telvanni Research", 			"Tel Mithryn Quests", 		"Neloth", 				"Extract a sample from an ash spawn for Neloth's research")
		MCM._Add_Quest_Data(false, 100, 200, 	"DLC2TTR3b", 	"Wind and Sand", 				"Tel Mithryn Quests", 		"Neloth", 				"Retrieve a copy of Wind and Sand for Neloth")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
	elseIf MCM._MCM_Page == "Thirsk Quests"
	
		MCM._Add_Quest_Data(false, 10, 40, 		"DLC2MH02", 				"The Chief of Thirsk Hall", 		"Thirsk Quests", 		"Riekling Chief", 					"Help out a Riekling Chief at Thirsk Mead Hall")
		MCM._Add_Quest_Data(false, 10, 10, 		"DLC2ThirskFFElmusBack", 	"Elmus Favor Quest (berries)",		"Thirsk Quests", 		"Elmus", 							"Retrieve some juniper berries for Elmus")
		MCM._Add_Quest_Data(false, 10, 10, 		"DLC2ThirskFFElmus", 		"Elmus Favor Quest (mead)", 		"Thirsk Quests", 		"Elmus", 							"Retrieve one bottle of Ashfire Mead for Elmus")
		MCM._Add_Quest_Data(false, 10, 10, 		"DLC2ThirskFFHalbarn", 		"Halbarn Favor Quest", 				"Thirsk Quests", 		"Halbarn Iron-Fur", 				"Find some crafting materials for Halbarn Iron-Fur")
		MCM._Add_Quest_Data(false, 10, 10, 		"DLC2ThirskFFHilund", 		"Hilund Favor Quest", 				"Thirsk Quests", 		"Hilund", 							"Find fifty Riekling spears for Hilund")
		MCM._Add_Quest_Data(false, 10, 40, 		"DLC2MH01", 				"Retaking Thirsk", 					"Thirsk Quests", 		"Bujold the Unworthy", 				"Help Bujold the Unworthy retake Thirsk Mead Hall")
		MCM._Add_Quest_Data(false, -999, 999, 	"DLC2MHMisc", 				"Thirsk Rumors", 					"Thirsk Quests", 		"Automatic (World Encounter)", 		"Investigate Thirsk Mead Hall and the exiled Nords")

;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	elseIf MCM._MCM_Page == "Misc Quests (DB)"
	
		MCM._Add_Quest_Data(false, 29, 90, 		"DLC2dunHaknirTreasureQST", 	"Deathbrand", 					"Misc Quests (DB)", 	"Read the book (Deathbrand)", 	"Find the treasure of Haknir Death-Brand")
		MCM._Add_Quest_Data(false, 10, 100, 	"DLC2EbonyWarriorQuest", 		"The Ebony Warrior", 			"Misc Quests (DB)", 	"Automatic (Reach level 80)", 	"Locate and defeat the Ebony Warrior")
		MCM._Add_Quest_Data(false, -999, 999, 	"DLC2dunHrodulf", 				"Hrodulf's Madness", 			"Misc Quests (DB)", 	"Automatic (World Encounter)",	"Uncover the secret of Hrodulf's House (Completionist: Mark complete manually)")
		MCM._Add_Quest_Data(false, 10, 10, 		"DLC2KagrumezQST", 				"The Kagrumez Gauntlet", 		"Misc Quests (DB)", 	"Automatic (World Encounter)",	"Survive the Kagrumez trials to claim a unique prize")
		MCM._Add_Quest_Data(false, -999, 999, 	"DLC2dunKarstaagQST",			"Summoning Karstaag", 			"Misc Quests (DB)", 	"Automatic (World Encounter)",	"Summon and defeat Karstaag (Completionist: Mark complete manually)")
		MCM._Add_Quest_Data(false, 40, 475, 	"DLC2dunKolbjornQST", 			"Unearthed", 					"Misc Quests (DB)", 	"Ralis Sedarys",				"Assist Ralis Sedarys in his search for the relics of Ahzidal in Kolbjorn Barrow")

		MCM._Add_Quest_Data(false, 10, 10, 		"DLC2BlackBook03Quest", 		"Black Book: Untold Legends", 			"Misc Quests (DB)", 	"The Black Book", 	"Learn the Black Book's hidden knowledge")
		MCM._Add_Quest_Data(false, 10, 10, 		"DLC2BlackBook04Quest", 		"Black Book: The Winds of Change",		"Misc Quests (DB)", 	"The Black Book", 	"Learn the Black Book's hidden knowledge")	
		MCM._Add_Quest_Data(false, 10, 10,		"DLC2BlackBook05Quest", 		"Black Book: The Sallow Regent", 		"Misc Quests (DB)", 	"The Black Book", 	"Learn the Black Book's hidden knowledge")		
		MCM._Add_Quest_Data(false, 10, 10, 		"DLC2BlackBook06Quest", 		"Black Book: Filament and Filigree", 	"Misc Quests (DB)", 	"The Black Book", 	"Learn the Black Book's hidden knowledge")
		MCM._Add_Quest_Data(false, 10, 10, 		"DLC2BlackBook07Quest", 		"Black Book: The Hidden Twilight", 		"Misc Quests (DB)", 	"The Black Book", 	"Learn the Black Book's hidden knowledge")
		
	endIf
endEvent

