local languages = {
	en = "English",
	lv = "Latviešu",
	ru = "Русский",
}

local translation = {
	["weapon1"] = {
		en = "VKS", 
		lv = "VKS",
		ru = "VKS"
	},
	["weapon2"] = {
		en = "DMR", 
		lv = "DMR",
		ru = "DMR"
	},
	["weapon3"] = {
		en = "CZ 550", 
		lv = "CZ 550",
		ru = "CZ 550"
	},
	["weapon4"] = {
		en = "SVD Dragunov Camo", 
		lv = "SVD Dragunov Camo",
		ru = "SVD Dragunov Camo"
	},
	["weapon5"] = {
		en = "M24", 
		lv = "M24",
		ru = "M24"
	},
	["weapon6"] = {
		en = "AKS Gold", 
		lv = "Zelta AKS",
		ru = "Золотой AKS"
	},
	["weapon7"] = {
		en = "Winchester 1866", 
		lv = "Vinčesteris 1866",
		ru = "Винчестер 1866"
	},
	["weapon8"] = {
		en = "Crossbow", 
		lv = "Arbaleta Loks",
		ru = "Арбалет"
	},
	["weapon9"] = {
		en = "AKS-74U", 
		lv = "AKS-74U",
		ru = "AKS-74U"
	},
	["weapon10"] = {
		en = "AK-107", 
		lv = "AK-107",
		ru = "AK-107"
	},
	["weapon11"] = {
		en = "M4A1 Holo", 
		lv = "M4A1 Holo",
		ru = "M4A1 Holo"
	},
	["weapon12"] = {
		en = "MK 48 CCO", 
		lv = "MK 48 CCO",
		ru = "MK 48 CCO"
	},
	["weapon13"] = {
		en = "RPK", 
		lv = "RPK",
		ru = "RPK"
	},
	["weapon14"] = {
		en = "SA-58V ACOG", 
		lv = "SA-58V ACOG",
		ru = "SA-58V ACOG"
	},
	["weapon15"] = {
		en = "Saiga 12K", 
		lv = "Saiga 12K",
		ru = "Saiga 12K"
	},
	["weapon16"] = {
		en = "Grenade", 
		lv = "Granāta",
		ru = "Граната"
	},
	["weapon17"] = {
		en = "Machete", 
		lv = "Mačete",
		ru = "Мачете"
	},
	["weapon18"] = {
		en = "MP5A5", 
		lv = "MP5A5",
		ru = "MP5A5"
	},
	["weapon19"] = {
		en = "Revolver", 
		lv = "Revolveris",
		ru = "Револьвер"
	},
	["weapon20"] = {
		en = "Micro UZI", 
		lv = "Mikro UZI",
		ru = "Micro UZI"
	},
	["weapon21"] = {
		en = "M1911", 
		lv = "M1911",
		ru = "M1911"
	},
	["weapon22"] = {
		en = "Hatchet", 
		lv = "Cirvis",
		ru = "Топор"
	},
	["weapon23"] = {
		en = "M9 SD", 
		lv = "M9 Klusinātājs",
		ru = "M9 Глушитель"
	},
	["weapon24"] = {
		en = "Hunting Knife", 
		lv = "Medību Nazis",
		ru = "Охотничий нож"
	},
	["weapon25"] = {
		en = "G17", 
		lv = "G17",
		ru = "G17"
	},
	["weapon26"] = {
		en = "Baseball Bat", 
		lv = "Beisbola Nūja",
		ru = "Бейсбольная бита"
	},
	["weapon27"] = {
		en = "Shovel", 
		lv = "Lāpsta",
		ru = "Лопата"
	},
	["weapon28"] = {
		en = "Binoculars", 
		lv = "Binoklis",
		ru = "Бинокль"
	},

	["mag1"] = {
		en = "_45ACP Mag", 
		lv = "_45ACP Munīcija",
		ru = "_45ACP Обойма"
	},
	["mag1description"] = {
		en = "Suitable for weapons\n  G17\n  M9 SD\n  M1911", 
		lv = "Derīgs priekš ieročiem\n  G17\n  M9 SD\n  M1911",
		ru = "Подходит для таких оружий\n  G17\n  M9 SD\n  M1911"
	},
	["mag2"] = {
		en = "_45ACP Clip", 
		lv = "_45ACP Klip",
		ru = "_45ACP Обойма"
	},
	["mag2description"] = {
		en = "Suitable for weapons\n  Revolver", 
		lv = "Derīgs priekš ieročiem\n  Revolveris",
		ru = "Подходит для таких оружий\n  Револьвер"
	},
	["mag3"] = {
		en = "5_45x39 Mag", 
		lv = "5_45x39 Munīcija",
		ru = "5_45x39 Обойма"
	},
	["mag3description"] = {
		en = "Suitable for weapons\n  Micro UZI\n  MP5A5", 
		lv = "Derīgs priekš ieročiem\n  Mikro UZI\n  MP5A5",
		ru = "Подходит для таких оружий\n  Micro UZI\n  MP5A5"
	},
	["mag4"] = {
		en = "7_62 Mag", 
		lv = "7_62 Munīcija",
		ru = "7_62 Обойма"
	},
	["mag4description"] = {
		en = "Suitable for weapons\n  SA-58V ACOG\n  AK-107\n  AKS-74U\n  AKS Gold", 
		lv = "Derīgs priekš ieročiem\n  SA-58V ACOG\n  AK-107\n  AKS-74U\n  Zelta AKS",
		ru = "Подходит для таких оружий\n  SA-58V ACOG\n  AK-107\n  AKS-74U\n  Золотой AKS"
	},
	["mag5"] = {
		en = "7_62x39 Mag", 
		lv = "7_62x39 Munīcija",
		ru = "7_62x39 Обойма"
	},
	["mag5description"] = {
		en = "Suitable for weapons\n  M4A1 Holo", 
		lv = "Derīgs priekš ieročiem\n  M4A1 Holo",
		ru = "Подходит для таких оружий\n  M4A1 Holo"
	},
	["mag6"] = {
		en = "5_56Box Mag", 
		lv = "5_56Box Munīcija",
		ru = "7_62x39 Обойма"
	},
	["mag6description"] = {
		en = "Suitable for weapons\n  MK 48 CCO\n  RPK", 
		lv = "Derīgs priekš ieročiem\n  MK 48 CCO\n  RPK",
		ru = "Подходит для таких оружий\n  MK 48 CCO\n  RPK"
	},
	["mag7"] = {
		en = "_10 Bullets", 
		lv = "_10 Lodes",
		ru = "_10 Патроны"
	},
	["mag7description"] = {
		en = "Suitable for weapons\n  Winchester 1866\n  Saiga 12K", 
		lv = "Derīgs priekš ieročiem\n  Vinčesteris 1866\n  Saiga 12K",
		ru = "Подходит для таких оружий\n  Винчестер 1866\n  Saiga 12K"
	},
	["mag8"] = {
		en = "_300 Bullets", 
		lv = "_300 Lodes",
		ru = "_300 Патроны"
	},
	["mag8description"] = {
		en = "Suitable for weapons\n  CZ 550\n  SVD Dragunov Camo\n  M24", 
		lv = "Derīgs priekš ieročiem\n  CZ 550\n  SVD Dragunov Camo\n  M24",
		ru = "Подходит для таких оружий\n  CZ 550\n  SVD Dragunov Camo\n  M24"
	},
	["mag9"] = {
		en = "Bolt", 
		lv = "Būlta",
		ru = "Стрела"
	},
	["mag9description"] = {
		en = "Suitable for weapons\n  Crossbow", 
		lv = "Derīgs priekš ieročiem\n  Arbalets",
		ru = "Подходит для таких оружий\n Арбалет"
	},
	["mag10"] = {
		en = "_303 Bullets", 
		lv = "_303 Lodes",
		ru = "_303 Патроны"
	},
	["mag10description"] = {
		en = "Suitable for weapons\n  VKS\n  DMR", 
		lv = "Derīgs priekš ieročiem\n  VKS\n  DMR",
		ru = "Подходит для таких оружий\n  VKS\n  DMR"
	},

	["item1"] = {
		en = "Wood Pile", 
		lv = "Koku Čupa",
		ru = "Куча дров"
	},
	["item2"] = {
		en = "Wire Fence", 
		lv = "Vadu Sēta",
		ru = "Колючая проволока"
	},
	["item3"] = {
		en = "Tent", 
		lv = "Telts",
		ru = "Палатка"
	},
	["item4"] = {
		en = "Safe", 
		lv = "Seifs",
		ru = "Сейф"
	},
	["item5"] = {
		en = "Roadflare [Red]", 
		lv = "Ceļa Uzliesmojums [Sarkans]",
		ru = "Сигнальная ракета [Красный]"
	},
	["item6"] = {
		en = "Trash", 
		lv = "Musars",
		ru = "Мусор"
	},
	["item7"] = {
		en = "C4", 
		lv = "C4",
		ru = "C4"
	},
	["item8"] = {
		en = "Supply Signal", 
		lv = "Piegādes Signāls",
		ru = "Сигнал поставки"
	},
	["item9"] = {
		en = "Full Gas Canister", 
		lv = "Pilna Benzīn Kana",
		ru = "Наполненная канистра"
	},
	["item10"] = {
		en = "Empty Gas Canister", 
		lv = "Tukša Benzīn Kana",
		ru = "Пустая канистра"
	},
	["item11"] = {
		en = "Roadflare [Green]", 
		lv = "Ceļa Uzliesmojums [Zaļš]",
		ru = "Сигнальная ракета [Зеленый]"
	},
	["item12"] = {
		en = "Roadflare [Blue]", 
		lv = "Ceļa Uzliesmojums [Zils]",
		ru = "Сигнальная ракета [Синий]"
	},
	["item13"] = {
		en = "Mine", 
		lv = "Mīna",
		ru = "Мина"
	},
	["item14"] = {
		en = "Key", 
		lv = "Atslēga",
		ru = "Ключ"
	},

	["clothing1"] = {
		en = "Ghillie Suit", 
		lv = "Snaipera Uzvelks",
		ru = "Снайперский камуфляж"
	},
	["clothing2"] = {
		en = "Camouflage Clothing", 
		lv = "Armīnieka Drēbes",
		ru = "Армейский камуфляж"
	},
	["clothing3"] = {
		en = "Civilian Clothing", 
		lv = "Iedzīvotāja Drēbes",
		ru = "Гражданская одежда"
	},
	["clothing4"] = {
		en = "Survivor Clothing [Brown]", 
		lv = "Izdzīvotāja Drēbes [Brūnas]",
		ru = "Одежда выжившего [Коричневый]"
	},
	["clothing5"] = {
		en = "Survivor Clothing [Grey]", 
		lv = "Izdzīvotāja Drēbes [Pelēkas]",
		ru = "Одежда выжившего [Серый]"
	},
	["clothing6"] = {
		en = "Survivor Clothing [Black]", 
		lv = "Izdzīvotāja Drēbes [Melnas]",
		ru = "Одежда выжившего [Черный]"
	},

	--[[
	["currency1"] = {
		en = "Briefcase [Gold]", 
		lv = "Koferis [Zelts]",
		ru = ""
	},
	["currency2"] = {
		en = "Briefcase [Silver]", 
		lv = "Koferis [Sudrabs]",
		ru = ""
	},
	["currency3"] = {
		en = "Briefcase [Copper]", 
		lv = "Koferis [Varš]",
		ru = ""
	},
	]]--

	["vehiclepart1"] = {
		en = "Engine", 
		lv = "Dzinējs",
		ru = "Двигатель"
	},
	["vehiclepart2"] = {
		en = "Rotor", 
		lv = "Turbīnas Rats",
		ru = "Ротор"
	},
	["vehiclepart3"] = {
		en = "Tire", 
		lv = "Riepa",
		ru = "Колесо"
	},
	["vehiclepart4"] = {
		en = "Tank Parts", 
		lv = "Degvielas Tvertne",
		ru = "Бензобак"
	},
	["vehiclepart5"] = {
		en = "Scrap Metal", 
		lv = "Metāllūžņi",
		ru = "Металлолом"
	},

	["medicine1"] = {
		en = "Large Medic Kit", 
		lv = "Lielā Aptieciņa",
		ru = "Больщая Аптечка"
	},
	["medicine2"] = {
		en = "Medic Kit", 
		lv = "Aptieciņa",
		ru = "Аптечка"
	},
	["medicine3"] = {
		en = "Small Medic Kit", 
		lv = "Mazā Aptieciņa",
		ru = "Маленькая Аптечка"
	},
	["medicine4"] = {
		en = "Heat Pack", 
		lv = "Siltumu Paka",
		ru = "Грелка"
	},
	["medicine5"] = {
		en = "Bandage", 
		lv = "Binde",
		ru = "Бинт"
	},
	["medicine6"] = {
		en = "Painkiller", 
		lv = "Pretsāpju Līdzeklis",
		ru = "Болеутоляющее"
	},
	["medicine7"] = {
		en = "Blood Bag", 
		lv = "Asins Paka",
		ru = "Пакет крови"
	},
	["medicine8"] = {
		en = "Morphine", 
		lv = "Morfīns",
		ru = "Морфий"
	},

	["fooditem1"] = {
		en = "Water Bottle", 
		lv = "Ūdens Pudele",
		ru = "Фляга"
	},
	["fooditem2"] = {
		en = "Empty Water Bottle", 
		lv = "Tukša Ūdens Pudele",
		ru = "Пустая фляга"
	},
	["fooditem3"] = {
		en = "Pasta Can", 
		lv = "Pastu Kana",
		ru = "Банка макарон"
	},
	["fooditem4"] = {
		en = "Beans Can", 
		lv = "Pupu Kana",
		ru = "Банка бобов"
	},
	["fooditem5"] = {
		en = "Burger", 
		lv = "Burgeris",
		ru = "Гамбургер"
	},
	["fooditem6"] = {
		en = "Milk", 
		lv = "Piens",
		ru = "Молоко"
	},
	["fooditem7"] = {
		en = "Soda Can", 
		lv = "Sodas Kana",
		ru = "Банка соды"
	},
	["fooditem8"] = {
		en = "Empty Soda Can", 
		lv = "Tukša Sodas Kana",
		ru = "Пустая банка соды"
	},
	["fooditem9"] = {
		en = "Pizza", 
		lv = "Pica",
		ru = "Пицца"
	},
	["fooditem10"] = {
		en = "Cooked Meat", 
		lv = "Uzcepta Gaļa",
		ru = "Жареное мясо"
	},
	["fooditem11"] = {
		en = "Raw Meat", 
		lv = "Jēla Gaļa",
		ru = "Сырое мясо"
	},

	["toolbelt1"] = {
		en = "Map", 
		lv = "Karte",
		ru = "Карта"
	},
	["toolbelt2"] = {
		en = "GPS", 
		lv = "Navigācija",
		ru = "GPS"
	},
	["toolbelt3"] = {
		en = "Watch", 
		lv = "Pūlkstenis",
		ru = "Часы"
	},
	["toolbelt4"] = {
		en = "Toolbox", 
		lv = "Instrumentu Kaste",
		ru = "Инструменты"
	},
	["toolbelt5"] = {
		en = "Box of Matches", 
		lv = "Sērkoku Kaste",
		ru = "Спички"
	},
	["toolbelt6"] = {
		en = "Infrared Goggles", 
		lv = "Infrasarkanās Brilles",
		ru = "Инфокрасные очки"
	},
	["toolbelt7"] = {
		en = "Night Vision Goggles", 
		lv = "Nakts Redzamības Brilles",
		ru = "Очки ночного видения"
	},
	["toolbelt8"] = {
		en = "Radio Device", 
		lv = "Radio Ierīce",
		ru = "Рация"
	},
	["toolbelt9"] = {
		en = "Advanced Toolbox", 
		lv = "Advancēta Instrumentu Kaste",
		ru = "Расширенный набор инструментов"
	},

	["vehiclehudtext1"] = {
		en = "ENGINE", 
		lv = "DZINĒJS",
		ru = "ДВИГАТЕЛЬ"
	},
	["vehiclehudtext2"] = {
		en = "ROTOR", 
		lv = "TURBĪNAS RATS",
		ru = "РОТОР"
	},
	["vehiclehudtext3"] = {
		en = "TIRE", 
		lv = "RIEPA",
		ru = "КОЛЕСО"
	},
	["vehiclehudtext4"] = {
		en = "TANK PARTS", 
		lv = "DEGVIELAS TVERTNE",
		ru = "БЕНЗОБАК"
	},
	["vehiclehudtext5"] = {
		en = "SCRAP METAL", 
		lv = "METĀLLŪŽŅI",
		ru = "МЕТАЛЛОЛОМ"
	},
	--[[
	["vehiclehudtext6"] = {
		en = "Fuel:", 
		lv = "Benzīns:",
		ru = ""
	},
	]]

	["logintext"] = {
		en = "has logged in!", 
		lv = "pieslēdzās!",
		ru = "вошел в систему!"
	},
	["jointext"] = {
		en = "joined the game", 
		lv = "pievienojās spēlē",
		ru = "присоединился к игре"
	},
	["leavetext"] = {
		en = "left the game", 
		lv = "atvienojās no spēles",
		ru = "покинул игру"
	},
	["changenicktext"] = {
		en = "is now known as", 
		lv = "ir tagad zināms kā",
		ru = "известен как"
	},

	["inventoryactiontext1"] = {
		en = "Arm Primary Weapon", 
		lv = "Uzvilkt Primāro Ieroci",
		ru = "Взять в руки"
	},
	["inventoryactiontext2"] = {
		en = "Unarm Primary Weapon", 
		lv = "Novilkt Primāro Ieroci",
		ru = "Убрать из рук"
	},
	["inventoryactiontext3"] = {
		en = "Arm Secondary Weapon", 
		lv = "Uzvilkt Sekundāro Ieroci",
		ru = "Взять в руки"
	},
	["inventoryactiontext4"] = {
		en = "Unarm Secondary Weapon", 
		lv = "Novilkt Sekundāro Ieroci",
		ru = "Убрать из рук"
	},
	["inventoryactiontext5"] = {
		en = "Arm Special Weapon", 
		lv = "Uzvilkt Speciālo Ieroci",
		ru = "Взять в руки"
	},
	["inventoryactiontext6"] = {
		en = "Unarm Special Weapon", 
		lv = "Novilkt Speciālo Ieroci",
		ru = "Убрать из рук"
	},
	["inventoryactiontext7"] = {
		en = "Drink", 
		lv = "Dzert",
		ru = "Попить"
	},
	["inventoryactiontext8"] = {
		en = "Eat", 
		lv = "Ēst",
		ru = "Съесть"
	},
	["inventoryactiontext9"] = {
		en = "Bandage yourself", 
		lv = "Aptīt bindi ap sevi",
		ru = "Опбинтовать себья"
	},
	["inventoryactiontext10"] = {
		en = "Place", 
		lv = "Uzlikt",
		ru = "Надеть"
	},
	["inventoryactiontext11"] = {
		en = "Use", 
		lv = "Lietot",
		ru = "Использовать"
	},
	["inventoryactiontext12"] = {
		en = "Build a wire fence", 
		lv = "Uzcelt vadu sētu",
		ru = "поставить Колючую проволоку"
	},
	["inventoryactiontext13"] = {
		en = "Pitch a tent", 
		lv = "Uzlikt telti",
		ru = "поставить палатку"
	},
	["inventoryactiontext14"] = {
		en = "Build a safe", 
		lv = "Uzlikt seifu",
		ru = "поставить сейф"
	},
	["inventoryactiontext15"] = {
		en = "Put clothes on", 
		lv = "Uzvilkt drēbes",
		ru = "Надеть"
	},
	["inventoryactiontext16"] = {
		en = "Fill bottle up", 
		lv = "Piepildīt pudeli",
		ru = "Наполнить"
	},
	["inventoryactiontext17"] = {
		en = "Call Airdrop", 
		lv = "Izsaukt Airdropu",
		ru = "Вызвать Airdrop"
	},
	["inventoryactiontext18"] = {
		en = "Equip Backpack", 
		lv = "Uzvilkt Somu",
		ru = "Надеть рюкзак"
	},
	["inventoryactiontext19"] = {
		en = "Make a Fire", 
		lv = "Uztaisīt Ugunskuru",
		ru = "Зделать костер"
	},
	["inventoryactiontext20"] = {
		en = "Set GPS channel", 
		lv = "Uzlikt Navigācijas staciju",
		ru = "Поставить GPS волну"
	},
	["inventoryactiontext21"] = {
		en = "Set Radio channel", 
		lv = "Uzlikt Radio staciju",
		ru = ""
	},
	["inventorytext1"] = {
		en = "SLOTS", 
		lv = "VIETA",
		ru = "СЛОТЫ"
	},
	["inventorydescription1"] = {
		en = "Damage", 
		lv = "Stiprums",
		ru = "Урон"
	},

	--[[ netiek izmantots
	["inventorydescription2"] = {
		en = "Knife for hunting", 
		lv = "Nazis priekš medīšanas",
		ru = ""
	},
	["inventorydescription3"] = {
		en = "Just a sharp Hatchet", 
		lv = "Ass cirvis",
		ru = ""
	},
	["inventorydescription4"] = {
		en = "get some faces beaten up", 
		lv = "stipra nūja",
		ru = ""
	},
	["inventorydescription5"] = {
		en = "can be used to bury bodies", 
		lv = "var tikt izmantots lai apglabātu līķus",
		ru = ""
	},
	]]--

	["inventorydescription6"] = {
		en = "Can view long distances", 
		lv = "Var skatīties lielus attālumus",
		ru = "Можно наблюдать большие дистанции"
	},
	--[[
	["inventorydescription7"] = {
		en = "Ammunition for gun", 
		lv = "Munīcija priekš ieroča",
		ru = ""
	},
	]]--
	["inventorydescription8"] = {
		en = "Clean Water", 
		lv = "Tīrs Ūdens",
		ru = "Чистая вода"
	},
	["inventorydescription9"] = {
		en = "Eatable Pasta", 
		lv = "Ēdama Pasta",
		ru = "Съедобная паста"
	},
	["inventorydescription10"] = {
		en = "Fresh Food", 
		lv = "Svaigs Ēdiens",
		ru = "Свежая еда"
	},
	["inventorydescription11"] = {
		en = "Unopened Soda", 
		lv = "Neatvērta Soda",
		ru = "Неоткрытая сода"
	},
	["inventorydescription12"] = {
		en = "Fresh Milk", 
		lv = "Svaigs Piens",
		ru = "Свежее молоко"
	},
	["inventorydescription13"] = {
		en = "Fresh Steak", 
		lv = "Svaigs Steiks",
		ru = "Свежий стейк"
	},
	["inventorydescription14"] = {
		en = "Stack of wood", 
		lv = "Čupa ar pagalēm",
		ru = "Куча дров"
	},
	["inventorydescription15"] = {
		en = "Can stop bleeding", 
		lv = "Var apstādināt asiņošanu",
		ru = "Может остановить кровотечение"
	},
	["inventorydescription16"] = {
		en = "Lights up road", 
		lv = "Iededzina ceļu",
		ru = "Подсветка дороги"
	},
	["inventorydescription17"] = {
		en = "Can store gas", 
		lv = "Kana lai uzturētu benzīnu",
		ru = "Может хранить бензин"
	},
	["inventorydescription18"] = {
		en = "Fresh Gas", 
		lv = "Svaigs benzīns",
		ru = "Свежий бензин"
	},
	["inventorydescription19"] = {
		en = "Restores lost blood", 
		lv = "Atgriež pazudušās asinis",
		ru = "Восстанавливает потерянную кровь"
	},
	["inventorydescription20"] = {
		en = "Worms you up", 
		lv = "Sasildina tevi",
		ru = "Согреет вас"
	},
	["inventorydescription21"] = {
		en = "Removes pain", 
		lv = "Noņem sāpes",
		ru = "Снежает боль"
	},
	["inventorydescription22"] = {
		en = "Restores broken bones", 
		lv = "Salabo beigtus kaulus",
		ru = "Восстанавливает сломанные кости"
	},
	["inventorydescription23"] = {
		en = "Can restore blood for other players", 
		lv = "Var atgriest asinis priekš citiem spēlētājiem",
		ru = "Может восстановить кровь для других игроков"
	},
	["inventorydescription24"] = {
		en = "Fence that can be placed", 
		lv = "Sēta kas var tikt uzlikta",
		ru = "Забор, который можно разместить где вы хотите"
	},
	["inventorydescription25"] = {
		en = "Very dangerous explosive", 
		lv = "Ļoti bīstama sprāgstviela",
		ru = "Очень опасное взрывчатое вещество"
	},
	["inventorydescription26"] = {
		en = "Can be cooked", 
		lv = "Var tikt uzcepta",
		ru = "Можно пожарить"
	},
	["inventorydescription27"] = {
		en = "Part of a vehicle\nToolbox required to install", 
		lv = "Detaļa no mašīnas\nInstrumenta kaste nepieciešams lai ienstalētu",
		ru = "Часть транспортного средства\nНужны Инструменты"
	},
	["inventorydescription28"] = {
		en = "Can be used as storage", 
		lv = "Var tikt izmantots kā noliktava",
		ru = "Можно использоваться как хранилище"
	},
	["inventorydescription29"] = {
		en = "Lockable Safe with Pin Code", 
		lv = "Aizstaisāms seifs ar pin kodu",
		ru = "Блокируемый сейф с PIN-кодом"
	},
	["inventorydescription30"] = {
		en = "Fresh Clothes", 
		lv = "Svaigas Drēbes",
		ru = "Свежая одежда"
	},
	["inventorydescription31"] = {
		en = "Can be filled with water", 
		lv = "Var tikt piepildīts ar ūdeni",
		ru = "Можно наполнить водой"
	},
	["inventorydescription32"] = {
		en = "Unusable item", 
		lv = "Neizmantojama manta",
		ru = "нелзя пользоваться"
	},
	["inventorydescription33"] = {
		en = "Unusable item", 
		lv = "Neizmantojama manta",
		ru = "нелзя пользоваться"
	},
	--[[
	["inventorydescription34"] = {
		en = "Game Currency - Tier 1", 
		lv = "Spēles valūta - Tier 1",
		ru = ""
	},
	["inventorydescription35"] = {
		en = "Game Currency - Tier 2", 
		lv = "Spēles valūta - Tier 2",
		ru = ""
	},
	["inventorydescription36"] = {
		en = "Game Currency - Tier 3", 
		lv = "Spēles valūta - Tier 3",
		ru = ""
	},
	]]--
	["inventorydescription37"] = {
		en = "Blows up locked storages", 
		lv = "Uzspridzina aizstaisāmus seifus",
		ru = "Взрывает заблокированные хранилища"
	},
	["inventorydescription38"] = {
		en = "Want some high tier loot? Use this", 
		lv = "Gribi labas mantas? Izmanto šito",
		ru = "Хочешь хорощие вещи? Пользуйсья етим"
	},
	["inventorydescription39"] = {
		en = "Slots: 12", 
		lv = "Sloti: 12",
		ru = "Слоты: 12"
	},
	["inventorydescription40"] = {
		en = "Slots: 16", 
		lv = "Sloti: 16",
		ru = "Слоты: 16"
	},
	["inventorydescription41"] = {
		en = "Slots: 24", 
		lv = "Sloti: 24",
		ru = "Слоты: 24"
	},
	["inventorydescription42"] = {
		en = "Slots: 36", 
		lv = "Sloti: 36",
		ru = "Слоты: 36"
	},
	["inventorydescription43"] = {
		en = "Goggles for night", 
		lv = "Brilles priekš nakts",
		ru = "очки ночного видения"
	},
	["inventorydescription44"] = {
		en = "Goggles for pros", 
		lv = "Brilles priekš profiņiem",
		ru = "Очки для профессионалов"
	},
	["inventorydescription45"] = {
		en = "Shows your location", 
		lv = "Rāda tavu lokāciju",
		ru = "Показывает ваше местоположение"
	},
	["inventorydescription46"] = {
		en = "Lights up wood", 
		lv = "Uzliesmo koku",
		ru = "поджигает дерево"
	},
	["inventorydescription47"] = {
		en = "Shows time", 
		lv = "Rāda laiku",
		ru = "Показывает время"
	},
	["inventorydescription48"] = {
		en = "For technical things", 
		lv = "Priekš Tehnikas",
		ru = "Для технических вещей"
	},
	["inventorydescription49"] = {
		en = "no use yet\nbut if you somehow got this, then you're a total cheater. :D", 
		lv = "nav mērķa vēl, bet ja tu dabuji šito mantu kaut kā, tad tu toč esi čīteris. :D",
		ru = "nav mērķa vēl, bet ja tu dabuji šito mantu kaut kā, tad tu toč esi čīteris. :D"
	},
	["inventorydescription50"] = {
		en = "Find other survivors", 
		lv = "Atrodi citus izdzīvojošos",
		ru = "Найди других выживших"
	},
	["inventorydescription51"] = {
		en = "Slots: 48", 
		lv = "Sloti: 48",
		ru = "Слоты: 48"
	},
	["inventorydescription52"] = {
		en = "Capacity", 
		lv = "Vieta",
		ru = "Вместимость"
	},
	["inventorydescription53"] = {
		en = "Vehicle Damage", 
		lv = "Mašīnas Bojājumi",
		ru = "Повреждения машины"
	},
	["inventorydescription54"] = {
		en = "Fire Rate", 
		lv = "Šaušanas Ātrums",
		ru = "Скорострельность"
	},
	["inventorydescription55"] = {
		en = "Very Fast", 
		lv = "Ļoti Ātrs",
		ru = "Очень быстро"
	},
	["inventorydescription56"] = {
		en = "Fast", 
		lv = "Ātrs",
		ru = "Быстро"
	},
	["inventorydescription57"] = {
		en = "Medium", 
		lv = "Vidējs",
		ru = "Средний"
	},
	["inventorydescription58"] = {
		en = "Slow", 
		lv = "Lēns",
		ru = ""
	},
	["inventorydescription59"] = {
		en = "Very Slow", 
		lv = "Ļoti Lēns",
		ru = "Медленный"
	},
	["inventorydescription60"] = {
		en = "Statistics", 
		lv = "Statistika",
		ru = "Статистика"
	},
	["inventorydescription61"] = {
		en = "Noise", 
		lv = "Skaļums",
		ru = "Шум"
	},
	["inventorydescription62"] = {
		en = "Very High", 
		lv = "Ļoti Augsts",
		ru = "Очень высокий"
	},
	["inventorydescription63"] = {
		en = "High", 
		lv = "Augsts",
		ru = "Высокая"
	},
	["inventorydescription64"] = {
		en = "Low", 
		lv = "Zems",
		ru = "Низкий"
	},
	["inventorydescription65"] = {
		en = "Slots: 63", 
		lv = "Sloti: 63",
		ru = "Слоты: 63"
	},
	["inventorydescription66"] = {
		en = "Slots: 72", 
		lv = "Sloti: 72",
		ru = "Слоты: 72"
	},
	["inventorydescription67"] = {
		en = "Locks/Unlocks Vehicle", 
		lv = "Aizslēdz/Atslēdz Mašīnu",
		ru = ""
	},

	["deathtext1"] = {
		en = "You are dead!\nRespawning in", 
		lv = "Tu esi miris!\nAtdzīvosies pēc",
		ru = "Ты умер!\nВозрождение через"
	},
	["deathtext2"] = {
		en = "seconds", 
		lv = "sekundēm",
		ru = "секунд"
	},
	["deathtext3"] = {
		en = "spawning...", 
		lv = "atdzīvojamies...",
		ru = "Возрождение..."
	},

	["deadplayertext1"] = {
		en = "is dead. Cause of death:", 
		lv = "ir miris. Nāves iemesls:",
		ru = "мертв. Причина смерти:"
	},
	["deadplayertext2"] = {
		en = "Unknown", 
		lv = "Nezināms",
		ru = "Неизвестный"
	},
	["deadplayertext3"] = {
		en = "Time of death:", 
		lv = "Nāves laiks:",
		ru = "Время смерти:"
	},
	["deadanimaltext"] = {
		en = "This animal was killed around", 
		lv = "Šis dzīvnieks bija nogalināts ap",
		ru = "Это животное было убито в"
	},
	["deadzombietext"] = {
		en = "Looks like it's finally dead. Estimated time of death:", 
		lv = "Izskatās ka beidzot viņš ir miris. Apmērais laiks no nāves:",
		ru = "Похоже, он наконец то мертв. Расчетное время смерти:"
	},
	["zombiename"] = {
		en = "Zombie", 
		lv = "Zombijs",
		ru = "Зомби"
	},
	["clocktext"] = {
		en = "o'clock", 
		lv = "pūlkstens",
		ru = "часов"
	},

	["helicrash"] = {
		en = "Helicrash", 
		lv = "Avarējis Heli",
		ru = "Упал вертолет"
	},
	["hospitalbox"] = {
		en = "Hospitalbox", 
		lv = "Slimnīcaskaste",
		ru = "Медицинский ящик"
	},

	["clientinfotext2"] = {
		en = "No mags left for this weapon!", 
		lv = "Nav vairāk ložu priekš šī ieroča!",
		ru = "Нет патронов!"
	},
	["clientinfotext3"] = {
		en = "You consumed", 
		lv = "Tu izlietoji",
		ru = "Вы потребляете"
	},
	["clientinfotext4"] = {
		en = "You filled", 
		lv = "Tu piepildiji",
		ru = "Ты наполнил"
	},
	["clientinfotext5"] = {
		en = "You must be in water!", 
		lv = "Tev ir jābūt ūdenī!",
		ru = "Вы должны быть в воде!"
	},
	["clientinfotext6"] = {
		en = "You cooked", 
		lv = "Tu uzcepi",
		ru = "Вы приготовили"
	},
	["clientinfotext7"] = {
		en = "You don't have Radio Device!", 
		lv = "Tev nav Radio Ierīce!",
		ru = "У вас нет радио!"
	},
	["clientinfotext8"] = {
		en = "I'm too cold, I have to worm up!", 
		lv = "Man ir pārāk auksti, Man vajag uzsildīties!",
		ru = "Мне слишком холодно, мне нужно разогреться!"
	},
	["clientinfotext9"] = {
		en = "I'm trembling, I need Painkiller!", 
		lv = "Es trīcu, Man vajag sāpes mazinātāju!",
		ru = "Я дрожу, мне нужны обезбаливаюшие!"
	},
	["clientinfotext10"] = {
		en = "I'm starving, I need something to eat!", 
		lv = "Esmu izsalcis, Man vajag kaut ko paēst!",
		ru = "Я голоден, мне нужно что-нибудь поесть!"
	},
	["clientinfotext11"] = {
		en = "I'm thirsty, I need some water!", 
		lv = "Esmu izslāpis, Man vajag ūdeni!",
		ru = "Я хочу пить, мне нужна вода!"
	},
	["clientinfotext12"] = {
		en = "I'm bleeding, I have to use bandage!", 
		lv = "Es asiņoju, Man vajag bindi!",
		ru = "У меня кровотечение, мне нужен бинт!"
	},
	["clientinfotext13"] = {
		en = "Fuel tank is full!", 
		lv = "Benzīn tanks ir pilns!",
		ru = "Топливный бак заполнен!"
	},
	["clientinfotext14"] = {
		en = "Gas filled into vehicle!", 
		lv = "Benzīns iepildīts mašīnā!",
		ru = "Топливо заполнено в транспортное средство!"
	},
	["clientinfotext15"] = {
		en = "Loot is full!", 
		lv = "Loots ir pilns!",
		ru = "Тут нету места!"
	},
	["clientinfotext16"] = {
		en = "Inventory is full!", 
		lv = "Inventārs ir pilns!",
		ru = "Инвентарь заполнен!"
	},
	["clientinfotext17"] = {
		en = "You can't do another thing while being in this action!", 
		lv = "Tu nevari darīt citu lietu kāmēr dari šo darbību!",
		ru = "Вы не можете делать другое дело, находясь в этом действии!"
	},
	["clientinfotext18"] = {
		en = "You installed", 
		lv = "Tu ienstalēji",
		ru = "Ты установил"
	},
	["clientinfotext19"] = {
		en = "into vehicle", 
		lv = "mašīnā",
		ru = "в мащину"
	},
	["clientinfotext20"] = {
		en = "You removed", 
		lv = "Tu noņēmi",
		ru = "Ты снял"
	},
	["clientinfotext21"] = {
		en = "from vehicle", 
		lv = "no mašīnas",
		ru = "с мащины"
	},
	["clientinfotext22"] = {
		en = "Wait... You can't move while looting!", 
		lv = "Pagaidi... Tu nedrīksti kustēties kāmēr cel mantas!",
		ru = "Подождите ... Вы не можете двигаться!"
	},
	["clientinfotext23"] = {
		en = "Safe Installed", 
		lv = "Seifs Ienstalēts",
		ru = "Сейф установлен"
	},
	["clientinfotext24"] = {
		en = "Access Granted", 
		lv = "Pieeja Atļauta",
		ru = "Доступ разрешен"
	},
	["clientinfotext25"] = {
		en = "Access Denied", 
		lv = "Pieeja Neatļauta",
		ru = "Доступ закрыт"
	},
	["clientinfotext26"] = {
		en = "Placed", 
		lv = "Uzlikts",
		ru = "Поставлен"
	},
	["clientinfotext27"] = {
		en = "Code Changed", 
		lv = "Kods Nomainīts",
		ru = "Код изменен "
	},
	["clientinfotext28"] = {
		en = "Airdrop Incoming!", 
		lv = "Airdrops Pienāk!",
		ru = "Входящий Airdrop!"
	},
	["clientinfotext29"] = {
		en = "I'm too hot, I have to сщщд down!", 
		lv = "Man ir pārāk karsti, Man vajag nosildīties!",
		ru = "Мне слишком жарко, мне нужно остыть!"
	},
	["clientinfotext30"] = {
		en = "Press 'K' to toggle the engine!", 
		lv = "Spied 'K' lai ieslēgtu/izslēgtu dzinēju!",
		ru = "Нажмите «K», чтобы включить двигатель!"
	},
	["clientinfotext31"] = {
		en = "Fuel tank is empty!", 
		lv = "Benzīn bāka ir tukša!",
		ru = "Топливный бак пуст!"
	},
	["clientinfotext32"] = {
		en = "Rotor is missing!", 
		lv = "Turbīnas Rats pietrūkst!",
		ru = "Ротор отсутствует!"
	},
	["clientinfotext33"] = {
		en = "Engine missing!", 
		lv = "Dzinējs pietrūkst!",
		ru = "Двигатель отсутствует!"
	},
	["clientinfotext34"] = {
		en = "Some Scrap Metal is missing!", 
		lv = "Metāllūžņi pietrūkst!",
		ru = "Некоторый металлолом отсутствует!"
	},
	["clientinfotext35"] = {
		en = "Some Tires are missing!", 
		lv = "Dažas Riepas pietrūkst!",
		ru = "Некоторые шины отсутствуют!"
	},
	["clientinfotext36"] = {
		en = "Engine started!", 
		lv = "Dzinējs iedarbināts!",
		ru = "Двигатель запущен!"
	},
	["clientinfotext37"] = {
		en = "Engine stopped!", 
		lv = "Dzinējs izslēgts!",
		ru = "Двигатель остановлен!"
	},
	["clientinfotext38"] = {
		en = "is already in repair!", 
		lv = "tiek jau labots!",
		ru = "уже ремонтируется!"
	},
	["clientinfotext39"] = {
		en = "Started to repair", 
		lv = "Sāki labot",
		ru = "Начался ремонт"
	},
	["clientinfotext40"] = {
		en = "You repaired", 
		lv = "Tu salaboji",
		ru = "Вы отремонтировали"
	},
	["clientinfotext41"] = {
		en = "You can't chat that fast!", 
		lv = "Tu nevari čatot tik ātri!",
		ru = "Вы не можете так быстро общаться!"
	},
	["clientinfotext42"] = {
		en = "Vehicle repair has been cancelled!", 
		lv = "Mašīnas labošana tika atcelta!",
		ru = "Ремонт автомобиля отменен!"
	},
	["clientinfotext43"] = {
		en = "You are muted!", 
		lv = "Tu esi nomutots!",
		ru = "Вы отключены!"
	},
	["clientinfotext44"] = {
		en = "You can't open/close that fast!", 
		lv = "Tu nevari atvērt/aizvērt tik ātri!",
		ru = "Вы не можете быстро открывать / закрывать это!"
	},
	["menuclienttext1"] = {
		en = "Take", 
		lv = "Paņemt",
		ru = "Взять"
	},
	["menuclienttext2"] = {
		en = "Gear", 
		lv = "Loots",
		ru = "Лут"
	},
	["menuclienttext3"] = {
		en = "Refill Gas", 
		lv = "Uzpildīt Benzīnu",
		ru = "Наполнить топливо"
	},
	["menuclienttext4"] = {
		en = "Repair", 
		lv = "Salabot",
		ru = "Починить"
	},
	["menuclienttext5"] = {
		en = "Install Parts", 
		lv = "Ienstalēt Detaļas",
		ru = "Установить детали"
	},
	["menuclienttext6"] = {
		en = "Remove Parts", 
		lv = "Noņemt Detaļas",
		ru = "Удалить детали"
	},
	["menuclienttext7"] = {
		en = "Press 'J' to access the Gear!", 
		lv = "Spied 'J' lai atvērtu šo Lootu!",
		ru = "Нажмите «J», чтобы открыть!"
	},
	["menuclienttext8"] = {
		en = "Press 'J' to access the Safe!", 
		lv = "Spied 'J' lai atvērtu šo Seifu!",
		ru = "Нажмите «J», чтобы открыть сейф!"
	},
	["menuclienttext9"] = {
		en = "Enter code to access the Safe!", 
		lv = "Ievadi kodu lai atvērtu šo Seifu!",
		ru = "Введите код"
	},
	["menuclienttext10"] = {
		en = "Press 'J' to access the Airdrop!", 
		lv = "Spied 'J' lai atvērtu šo Airdropu",
		ru = "Нажмите «J», чтобы открыть!"
	},
	["menuclienttext11"] = {
		en = "Airdrop", 
		lv = "Airdrops",
		ru = "Airdrop"
	},
	["menuclienttext12"] = {
		en = "Open", 
		lv = "Atvērt",
		ru = "Открыть"
	},
	["menuclienttext13"] = {
		en = "Raided Safe", 
		lv = "Izreidots Seifs",
		ru = "Взломанный сейф"
	},
	["menuclienttext14"] = {
		en = "Remove Tent", 
		lv = "Noņemt Telti",
		ru = "Удалить палатку"
	},
	["menuclienttext15"] = {
		en = "Enter Code", 
		lv = "Ievadīt Kodu",
		ru = "Введите код"
	},
	["menuclienttext16"] = {
		en = "Place", 
		lv = "Uzlikt",
		ru = "Поставить"
	},
	["menuclienttext17"] = {
		en = "Change Code", 
		lv = "Nomainīt Kodu",
		ru = "Поменять код"
	},
	["menuclienttext18"] = {
		en = "Remove Safe", 
		lv = "Noņemt Seifu",
		ru = "Убрать сейф"
	},
	["menuclienttext19"] = {
		en = "Give",
		lv = "Iedot",
		ru = "Дать"
	},
	["menuclienttext20"] = {
		en = "Check Body",
		lv = "Pārbaudīt Līķi",
		ru = "Проверить труп"
	},
	["menuclienttext21"] = {
		en = "Bury Body",
		lv = "Noglabāt Līķi",
		ru = "Похоронить труп"
	},
	["menuclienttext22"] = {
		en = "Cook",
		lv = "Uzcept",
		ru = "Жарить"
	},
	["menuclienttext23"] = {
		en = "Refill",
		lv = "Uzpildīt",
		ru = "Пополнение"
	},
	["menuclienttext24"] = {
		en = "Remove",
		lv = "Noņemt",
		ru = "Убрать"
	},
	["menuclienttext25"] = {
		en = "REQUIRE:",
		lv = "VAJADZĪGS:",
		ru = "ТРЕБУЕТСЯ:"
	},
	["menuclienttext26"] = {
		en = "Gas Station",
		lv = "Gāzes Stacija",
		ru = "Бензоколонка"
	},
	["menuclienttext27"] = {
		en = "Water Station",
		lv = "Ūdens Stacija",
		ru = "Водная станция"
	},
	["menuclienttext28"] = {
		en = "Fire Place",
		lv = "Ugunskurs",
		ru = "Костер"
	},
	["menuclienttext29"] = {
		en = "Item Pickup",
		lv = "Itemu Pacelšana",
		ru = "Перевозка предметов"
	},
	["menuclienttext30"] = {
		en = "Press",
		lv = "Spied",
		ru = "Нажми"
	},
	["menuclienttext31"] = {
		en = "to refill",
		lv = "lai uzpildītu",
		ru = "чтобы пополнять"
	},
	["menuclienttext32"] = {
		en = "to remove",
		lv = "lai noņemtu",
		ru = "чтобы убрать"
	},
	["menuclienttext33"] = {
		en = "to cook",
		lv = "lai uzceptu",
		ru = "чтобы пожарить"
	},
	["menuclienttext34"] = {
		en = "to pick this item up",
		lv = "lai paceltu šo itemu",
		ru = "чтобы поднять"
	},
	["menuclienttext35"] = {
		en = "Press 'E' to detonate this mine!",
		lv = "Spied 'E' lai atmīnētu šo mīnu!",
		ru = "Нажмите «E», чтобы взорвать мину!"
	},
	["menuclienttext36"] = {
		en = "Detonate",
		lv = "Atmīnēt",
		ru = "Детонировать"
	},
	["menuclienttext37"] = {
		en = "Mine",
		lv = "Mīna",
		ru = "Мина"
	},
	["menuclienttext38"] = {
		en = "You don't have that item!",
		lv = "Tev nav tā itema!",
		ru = "У вас нет этого предмета!"
	},

	["pingfailtext"] = {
		en = "Your ping is over 450!", 
		lv = "Tavs pings ir pāri 450!",
		ru = "Ваш пинг составляет более 450!"
	},

	["waskilledtext1"] = {
		en = "was killed by", 
		lv = "tika nogalināts no",
		ru = "был убит"
	},
	["waskilledtext2"] = {
		en = "was killed", 
		lv = "tika nogalināts",
		ru = "был убит"
	},

	["statname1"] = {
		en = "Zombies killed", 
		lv = "Nogalinātie zombiji",
		ru = "Зомби убито"
	},
	["statname2"] = {
		en = "Headshots", 
		lv = "Galvā nogalināti",
		ru = "В голову"
	},
	["statname3"] = {
		en = "Murders", 
		lv = "Slepkavības",
		ru = "Убийства"
	},
	["statname4"] = {
		en = "Bandits killed", 
		lv = "Bandīti nogalināti",
		ru = "Бандиты убиты"
	},
	["statname5"] = {
		en = "Blood", 
		lv = "Asinis",
		ru = "Кровь"
	},
	["statname6"] = {
		en = "Temperature", 
		lv = "Temperatūra",
		ru = "Температура"
	},
	["statname7"] = {
		en = "Humanity", 
		lv = "Cilvēciba",
		ru = "Человечество"
	},
	["statname8"] = {
		en = "Alive time", 
		lv = "Dzīves laiks",
		ru = "Прожито"
	},
	["statname9"] = {
		en = "Ping", 
		lv = "Pings",
		ru = "Пинг"
	},
	["scoreboard1"] = {
		en = "Player", 
		lv = "Spēlētājs",
		ru = "Игрок"
	},
	["scoreboard2"] = {
		en = "Players", 
		lv = "Spēlētāji",
		ru = "Игроки"
	},
	["scoreboard3"] = {
		en = "*Hold 'RMB' to toggle cursor", 
		lv = "*Turi 'RMB' lai ieslēgtu peli",
		ru = "* Удерживайте «RMB» для включения курсора"
	},
	["scoreboard4"] = {
		en = " #", 
		lv = " #",
		ru = " №"
	},

	["newbiehelp1"] = {
		en = "Press 'F1' to create team", 
		lv = "Spied 'F1' lai izveidotu komandu",
		ru = "Нажмите «F1», чтобы создать команду"
	},
	["newbiehelp2"] = {
		en = "Press 'F2' to open settings panel", 
		lv = "Spied 'F2' lai atvērtu opcijas paneli",
		ru = "Нажмите «F2», чтобы открыть панель настроек"
	},
	["newbiehelp3"] = {
		en = "Press 'J' to open inventory", 
		lv = "Spied 'J' lai atvērtu inventāru",
		ru = "Нажмите «J», чтобы открыть инвентарь."
	},
	["newbiehelp4"] = {
		en = "Press 'X' to global chat", 
		lv = "Spied 'X' lai čatotu globāliski",
		ru = "Нажмите «X» для глобального чата"
	},
	["newbiehelp5"] = {
		en = "Press 'T' to local chat", 
		lv = "Spied 'T' lai čatotu vietējiem",
		ru = "Нажмите «T» для локального чата"
	},
	["newbiehelp6"] = {
		en = "Press 'Y' to team chat", 
		lv = "Spied 'Y' lai čatotu komandai",
		ru = "Нажмите «Y» для чата с командой"
	},
	["newbiehelp7"] = {
		en = "Press 'U' to radio chat (radio device required)", 
		lv = "Spied 'U' lai čatotu pa radio (radio ierīce nepieciešama)",
		ru = "Нажмите «U» для чата по радио"
	},
	["newbiehelp8"] = {
		en = "Press 'L' to prone", 
		lv = "Spied 'L' lai apgūltos",
		ru = "Нажмите «L», чтобы лечь "
	},
	["newbiehelp9"] = {
		en = "Press ',' to sit", 
		lv = "Spied ',' lai apsēstos ",
		ru = "Нажмите «,», чтобы сесть"
	},
	["newbiehelp10"] = {
		en = "Press '.' to show hands", 
		lv = "Spied '.' lai parādītu rokas",
		ru = "Нажмите '.' чтобы показывать руки"
	},
	["newbiehelp11"] = {
		en = "Press ';' to shout friendly", 
		lv = "Spied ';' lai bļautu draudzīgs",
		ru = "Нажмите ';' чтобы кричать дружелюбно"
	},

	["hint1"] = {
		en = "Right click on 'GPS' to set a specific channel", 
		lv = "Uzpied otro peles pogu uz 'Navigācijas' lai nomainītu staciju",
		ru = "Щелкните правой кнопкой мыши на «GPS», чтобы установить определенный канал"
	},
	["hint2"] = {
		en = "People in same team as you they will have green triangle on top of their head", 
		lv = "Cilvēki tajā pašā komanda kurā esi tu viņiem būs zaļš trīstūris virs viņu galvas",
		ru = "Люди в той же команде, что и вы, у них будет зеленый треугольник поверх головы"
	},
	["hint3"] = {
		en = "Press 'J' to access the Inventory", 
		lv = "Spied 'J' lai atvērtu Inventāru",
		ru = "Нажмите «J» для доступа к инвентарю"
	},
	["hint4"] = {
		en = "Different type of shops have their own benefits", 
		lv = "Katram veikala tipam ir savi labumi",
		ru = "У разных типов магазинов есть свои преимущества"
	},
	["hint5"] = {
		en = "To detonate Mine you must need Toolbox", 
		lv = "Lai atmīnētu Mīnu tev vajag Instrumentu Kasti",
		ru = "Для детонации мины вам понадобится инструменты"
	},
	["hint6"] = {
		en = "Missions spawn once an hour and loot depends on online players", 
		lv = "Misijas parādās katru stundu un lūts atbilst uz pieslēgušiem spēlētājiem",
		ru = "Миссии появляются один раз в час, а добыча зависит от онлайн-игроков"
	},
	["hint7"] = {
		en = "WARNING: Be careful in shop areas, there is NO safe zone", 
		lv = "BRĪDINĀJUMS: Esi uzmanīgs pie veikaliem, tur NAV drošās zonas",
		ru = "ПРЕДУПРЕЖДЕНИЕ. Будьте осторожны в зонах магазина, нет безопасной зоны"
	},
	["hint8"] = {
		en = "Use 'Heat Pack' to worm up", 
		lv = "Lieto 'Siltumu Paku' lai uzsildītos",
		ru = "Используйте «Heat Pack» для разогрева"
	},
	["hint9"] = {
		en = "To install/desamble parts in vehicle you must need Toolbox", 
		lv = "Lai salabotu/izjauktu mašīnu tev vajag Instrumentu Kasti",
		ru = "Чтобы установить / деамплировать детали в автомобиле, вам понадобится ящик инструментов"
	},
	["hint10"] = {
		en = "Player name tag color depends on their humanity", 
		lv = "Spēlētāja vārdu krāsa atbilst viņu cilvēcībai",
		ru = "Цвет тега имени игрока зависит от их гуманности"
	},
	["hint11"] = {
		en = "If you have any bug reports or want to suggest something you can do so by typing /report in chat",
		lv = "Ja tu esi atradis kādu bugu vai gribi ieteikt kaut ko, tu vari to izdarīt rakstot /report čatā",
		ru = "Если у вас есть отчеты об ошибках или вы хотите предложить что-то, вы можете сделать это, набрав / сообщив в чате"
	},

	["backpack1"] = {
		en = "Coyote Backpack", 
		lv = "Kojotu Mugursoma",
		ru = "Рюкзак койот"
	},
	["backpack2"] = {
		en = "Boulder Backpack", 
		lv = "Laukakmeņu Mugursoma",
		ru = "Рюкзак колхоз"
	},
	["backpack3"] = {
		en = "Hunting Backpack", 
		lv = "Medību Mugursoma",
		ru = "Рюкзак охотника"
	},
	["backpack4"] = {
		en = "Leather Sack", 
		lv = "Ādas Maiss",
		ru = "Кожаный мешок"
	},
	["backpack5"] = {
		en = "Dry Bag", 
		lv = "Sausā Mugursoma",
		ru = "Сухой мешок"
	},
	["backpack6"] = {
		en = "Tortilla Backpack", 
		lv = "Tortillas Mugursoma",
		ru = "Рюкзак Tortilla"
	},
	["backpack7"] = {
		en = "Alice Backpack", 
		lv = "Alisa Mugursoma",
		ru = "Элис Рюкзак"
	},


	["helmet1"] = {		
		en = "Special Forces Helmet", 		
		lv = "Īpašo Spēku Ķivere",		
		ru = "Шлем спецназа"		
	},		
	["helmet2"] = {		
		en = "Military Helmet", 		
		lv = "Militārā Ķivere",		
		ru = "Военный шлем"		
	},		
	["helmet3"] = {		
		en = "Motorcycle Helmet", 		
		lv = "Motorciklu Ķivere",		
		ru = "Мотоциклетный шлем"		
	},		
	["helmet4"] = {		
		en = "SWAT Helmet", 		
		lv = "SWAT Ķivere",		
		ru = "Шлем SWAT"		
	},		
	["helmet5"] = {		
		en = "Welder Helmet", 		
		lv = "Metinātāja Ķivere",		
		ru = "Шлем сварщика"		
	},		
	["helmet6"] = {		
		en = "Cap", 		
		lv = "Cepure",		
		ru = "Кепка"		
	},		
	["helmet7"] = {		
		en = "Ushanka", 		
		lv = "Ushanka",		
		ru = "Ушанка"		
	},		
		
	["vest1"] = {		
		en = "Police Vest", 		
		lv = "Policijas Veste",		
		ru = "Полицейский жилет"		
	},		
	["vest2"] = {		
		en = "Military Vest", 		
		lv = "Militārā Veste",		
		ru = "Военный жилет"
	},


	["inventoryactiontext22"] = {
		en = "Wear Helmet", 
		lv = "Uzvilkt Ķiveri",
		ru = "Надеть шлем"
	},
	["inventoryactiontext23"] = {
		en = "Wear Vest", 
		lv = "Uzvilkt Vesti",
		ru = "Надеть жилет"
	},


	["inventorytext2"] = {
		en = "* You can also move items by double clicking on them", 
		lv = "* Tu arī vari divreiz uzpiest uz itēma lai pārnestu",
		ru = "* Вы можете перемещать объекты, дважды щелкая"
	},

	["inventorydescription68"] = {
		en = "Protects your head", 
		lv = "Aizsargā tavu galvu",
		ru = "Защищает голову"
	},
	["inventorydescription69"] = {
		en = "Protects your chest", 
		lv = "Aizsargā tavu vēdaru",
		ru = "Защищает грудь"
	},
	["inventorydescription70"] = {
		en = "Be stylish", 
		lv = "Esi modīgs",
		ru = "Будьте стильными"
	},

	["inventorycolumntext1"] = {
		en = "Primary Weapon:", 
		lv = "Primārais Ierocis:",
		ru = "Первичное оружие:"
	},
	["inventorycolumntext2"] = {
		en = "Secondary Weapon:", 
		lv = "Sekundārais Ierocis:",
		ru = "Вторичное оружие:"
	},
	["inventorycolumntext3"] = {
		en = "Specially Weapon:", 
		lv = "Speciālais Ierocis:",
		ru = "Специальное оружие:"
	},
	["inventorycolumntext4"] = {
		en = "Ammo:", 
		lv = "Patronas:",
		ru = "Боеприпасы:"
	},
	["inventorycolumntext5"] = {
		en = "Food:", 
		lv = "Ēdiens:",
		ru = "Еда:"
	},
	["inventorycolumntext6"] = {
		en = "Medicaments:", 
		lv = "Medikamenti:",
		ru = "Медикаменты:"
	},
	["inventorycolumntext7"] = {
		en = "Items:", 
		lv = "Mantas:",
		ru = "Предметы:"
	},
	["inventorycolumntext8"] = {
		en = "Equipment:", 
		lv = "Ekipējums:",
		ru = "Оборудование:"
	},
	["inventorycolumntext9"] = {
		en = "Toolbelt:", 
		lv = "Rīki:",
		ru = "Пояс с инструментами:"
	},

	["clientinfotext45"] = {
		en = "You already have equipped this helmet!", 
		lv = "Tev jau ir uzvilkta šī ķivere!",
		ru = "Вы уже одели этот шлем!"
	},

	["clothing7"] = {
		en = "Soldier Clothing", 
		lv = "Karavīra Drēbes",
		ru = "Одежда солдата"
	},
	["clothing8"] = {
		en = "Police Clothing", 
		lv = "Policiju Drēbes",
		ru = "Полицейская одежда"
	},
	["clothing9"] = {
		en = "Medic Clothing", 
		lv = "Ārsta Drēbes",
		ru = "Медицинская одежда"
	},

	["clientinfotext0"] = {
		en = "You need to free up ", 
		lv = "Tev vajag atbrīvot ",
		ru = "Вам нужно освободить"
	},["clientinfotext1"] = {
		en = " slots to equip this", 
		lv = " slotus lai uzvilktu šo",
		ru = " слоты для оснащения"
	},
}

function getPlayerLanguage(player)
	if (not player) then outputDebugString("Player expected got '"..tostring(player).."'",1,255,0,0) return; end
	if (getElementData(player,"language")) then
		return getElementData(player,"language");
	else
		return "en";
	end
	return false;
end

function getLanguageTextClient(text)
	if (not text) then outputDebugString("String expected got '"..tostring(text).."'",1,255,0,0) return; end
	local translationText = translation[text];
	if (translationText) then
		return translationText[getPlayerLanguage(localPlayer)];
	end
	return text;
end

function getLanguageTextServer(text,player)
	if (not text) then outputDebugString("String expected got '"..tostring(text).."'",1,255,0,0) return; end
	if (not text) then outputDebugString("Player expected got '"..tostring(player).."'",1,255,0,0) return; end
	local translationText = translation[text];
	if (translationText) then
		return translationText[getPlayerLanguage(player)];
	end
	return text;
end