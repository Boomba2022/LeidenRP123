Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = true -- enable if you're using esx_license
Config.EnableJobLogs              = true -- only turn this on if you are using esx_joblogs

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = 1000

Config.Locale                     = 'nl'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(444.38, -976.2, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 4
		},

		Cloakrooms = {
			vector3(451.99, -992.58, 30.69),
		},	

		Armories = {
			vector3(451.65, -980.07, 30.69),
		},

		Vehicles = {
			{
				Spawner = vector3(1111454.7, -1017.48, 28.43),
				InsideShop = vector3(446, -1024.27, 28.63),
				SpawnPoints = {
					{coords = vector3(444.36, -1019.81, 28.6), heading = 105.65, radius = 2.0},
					{coords = vector3(1850.37, 3674.36, 33.61), heading = 211.95, radius = 2.0},
					{coords = vector3(1847.02, 3674.44, 33.61), heading = 211.95, radius = 2.0}
				}
			},

			{
				Spawner = vector3(-1115.01, -834.98, -120.91),
				InsideShop = vector3(-1135.01, -856.01, 13.56),
				SpawnPoints = {
					{coords = vector3(-1112.4, -854.96, 13.18), heading = 38.01, radius = 2.0},
					{coords = vector3(-1116.11, -857.01, 13.18), heading = 38.01, radius = 2.0},
					{coords = vector3(-1126.48, -864.61, 13.18), heading = 38.01, radius = 2.0},
					{coords = vector3(-1123.58, -862.3, 13.18), heading = 38.01, radius = 2.0}
				}
			},

			{
				Spawner = vector3(-1077.11, -846.19, -140.88),
				InsideShop = vector3(-1074.28, -870.43, 4.5),
				SpawnPoints = {
					{coords = vector3(-1051.57, -867.35, 4.99), heading = 58.49, radius = 3.0 },
					{coords = vector3(-1048.24, -864.75, 4.87), heading = 58.9, radius= 3.0},
                    {coords = vector3(-1045.04, -861.68, 4.71), heading = 58.32, radius = 3.0 },
                    {coords = vector3(-1041.96, -858.62, 4.75), heading = 60.06, radius = 3.0 },
                    {coords = vector3(-1039.3, -855.62, 4.74), heading = 56.24, radius = 3.0 },
                    {coords = vector3(-1069.44, -878.75, 4.71), heading = 31.03, radius = 3.0 },
                    {coords = vector3(-1072.68, -880.67, 4.63), heading = 29.3, radius = 3.0 },
                    {coords = vector3(-1076.3, -882.47, 4.54), heading = 29.71, radius = 3.0 },
                    {coords = vector3(-1079.48, -884.37, 4.39), heading = 30.03, radius = 3.0 },
                    {coords = vector3(-1061.95, -853.49, 4.73), heading = 216.44, radius = 3.0 },
                    {coords = vector3(-1058.5, -851.42, 4.73), heading = 217.87, radius = 3.0 },
                    {coords = vector3(-1055.31, -849.13, 4.73), heading = 216.71, radius = 3.0 },
                    {coords = vector3(-1052.4, -846.79, 4.75), heading = 216.1, radius = 3.0 },
                    {coords = vector3(-1047.87, -846.51, 4.73), heading = 215.43, radius = 3.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1094.44, -842.16, -137.7),
				InsideShop = vector3(-1096.23, -832.06, 37.7),
				SpawnPoints = {
					{coords = vector3(-1096.23, -832.06, 37.7), heading = 129.16, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(-1114.34, -832.96, 30.76),
			vector3(3690.51, 3690.13, 33.26)
		}

	}

}

Config.AuthorizedWeapons = {
	aspirant = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
	},

	surveillant = {
		{weapon = 'WEAPON_PISTOL', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
	},

	agent = {
		{weapon = 'WEAPON_PISTOL', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
	},

	hoofdagent = {
		{weapon = 'WEAPON_PISTOL', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
	},

	brigadier = {
		{weapon = 'WEAPON_PISTOL', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'weapon_heavysniper', price = 1 },
		{weapon = 'WEAPON_ASSAULTSMG', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', price = 1 }
	},

	inspecteur = {
		{weapon = 'WEAPON_PISTOL', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'weapon_heavysniper', price = 1 },
		{weapon = 'WEAPON_ASSAULTSMG', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', price = 1 }
	},

	hoofdinspecteur = {
		{weapon = 'WEAPON_PISTOL', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'weapon_heavysniper', price = 1 },
		{weapon = 'WEAPON_ASSAULTSMG', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', price = 1 }
	},

	commissaris = {
		{weapon = 'WEAPON_PISTOL', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'weapon_heavysniper', price = 1 },
		{weapon = 'WEAPON_ASSAULTSMG', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', price = 1 }
	},

	hoofdcommissaris = {
		{weapon = 'WEAPON_PISTOL', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'weapon_heavysniper', price = 1 },
		{weapon = 'WEAPON_ASSAULTSMG', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', price = 1 }
	},

	boss = {
		{weapon = 'WEAPON_PISTOL', price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'weapon_heavysniper', price = 1 },
		{weapon = 'WEAPON_ASSAULTSMG', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', price = 1 }
	}
}

Config.AuthorizedVehicles = {
	car = {
		aspirant = {
		{model = 'pol1', price = 1},
		{model = 'pol2', price = 1},
		{model = 'pol3', price = 1},
		{model = 'pol4', price = 1},
		{model = 'pol5', price = 1},
		{model = 'pol6', price = 1},
		{model = 'pol7', price = 1},
		{model = 'pol8', price = 1},
		{model = 'pol9', price = 1},
		{model = 'pol10', price = 1},
		{model = 'pol11', price = 1},
		{model = 'pol12', price = 1},
		{model = 'pol13', price = 1},
		{model = 'pol14', price = 1},
		{model = 'pol15', price = 1},
		{model = 'pol16', price = 1},
		},

		surveillant = {
			{model = 'pol1', price = 1},
			{model = 'pol2', price = 1},
			{model = 'pol3', price = 1},
			{model = 'pol4', price = 1},
			{model = 'pol5', price = 1},
			{model = 'pol6', price = 1},
			{model = 'pol7', price = 1},
			{model = 'pol8', price = 1},
			{model = 'pol9', price = 1},
			{model = 'pol10', price = 1},
			{model = 'pol11', price = 1},
			{model = 'pol12', price = 1},
			{model = 'pol13', price = 1},
			{model = 'pol14', price = 1},
			{model = 'pol15', price = 1},
			{model = 'pol16', price = 1},
		},

		agent = {
		{model = 'pol1', price = 1},
		{model = 'pol2', price = 1},
		{model = 'pol3', price = 1},
		{model = 'pol4', price = 1},
		{model = 'pol5', price = 1},
		{model = 'pol6', price = 1},
		{model = 'pol7', price = 1},
		{model = 'pol8', price = 1},
		{model = 'pol9', price = 1},
		{model = 'pol10', price = 1},
		{model = 'pol11', price = 1},
		{model = 'pol12', price = 1},
		{model = 'pol13', price = 1},
		{model = 'pol14', price = 1},
		{model = 'pol15', price = 1},
		{model = 'pol16', price = 1},
		},

		hoofdagent = {
		{model = 'pol1', price = 1},
		{model = 'pol2', price = 1},
		{model = 'pol3', price = 1},
		{model = 'pol4', price = 1},
		{model = 'pol5', price = 1},
		{model = 'pol6', price = 1},
		{model = 'pol7', price = 1},
		{model = 'pol8', price = 1},
		{model = 'pol9', price = 1},
		{model = 'pol10', price = 1},
		{model = 'pol11', price = 1},
		{model = 'pol12', price = 1},
		{model = 'pol13', price = 1},
		{model = 'pol14', price = 1},
		{model = 'pol15', price = 1},
		{model = 'pol16', price = 1},
		},

		brigadier = {
		{model = 'pol1', price = 1},
		{model = 'pol2', price = 1},
		{model = 'pol3', price = 1},
		{model = 'pol4', price = 1},
		{model = 'pol5', price = 1},
		{model = 'pol6', price = 1},
		{model = 'pol7', price = 1},
		{model = 'pol8', price = 1},
		{model = 'pol9', price = 1},
		{model = 'pol10', price = 1},
		{model = 'pol11', price = 1},
		{model = 'pol12', price = 1},
		{model = 'pol13', price = 1},
		{model = 'pol14', price = 1},
		{model = 'pol15', price = 1},
		{model = 'pol16', price = 1},
		},

		inspecteur = {
		{model = 'pol1', price = 1},
		{model = 'pol2', price = 1},
		{model = 'pol3', price = 1},
		{model = 'pol4', price = 1},
		{model = 'pol5', price = 1},
		{model = 'pol6', price = 1},
		{model = 'pol7', price = 1},
		{model = 'pol8', price = 1},
		{model = 'pol9', price = 1},
		{model = 'pol10', price = 1},
		{model = 'pol11', price = 1},
		{model = 'pol12', price = 1},
		{model = 'pol13', price = 1},
		{model = 'pol14', price = 1},
		{model = 'pol15', price = 1},
		{model = 'pol16', price = 1},
		},

		hoofdinspecteur = {
			{model = 'pol1', price = 1},
		{model = 'pol2', price = 1},
		{model = 'pol3', price = 1},
		{model = 'pol4', price = 1},
		{model = 'pol5', price = 1},
		{model = 'pol6', price = 1},
		{model = 'pol7', price = 1},
		{model = 'pol8', price = 1},
		{model = 'pol9', price = 1},
		{model = 'pol10', price = 1},
		{model = 'pol11', price = 1},
		{model = 'pol12', price = 1},
		{model = 'pol13', price = 1},
		{model = 'pol14', price = 1},
		{model = 'pol15', price = 1},
		{model = 'pol16', price = 1},
		},

		hoofdcommissaris = {
		{model = 'pol1', price = 1},
		{model = 'pol2', price = 1},
		{model = 'pol3', price = 1},
		{model = 'pol4', price = 1},
		{model = 'pol5', price = 1},
		{model = 'pol6', price = 1},
		{model = 'pol7', price = 1},
		{model = 'pol8', price = 1},
		{model = 'pol9', price = 1},
		{model = 'pol10', price = 1},
		{model = 'pol11', price = 1},
		{model = 'pol12', price = 1},
		{model = 'pol13', price = 1},
		{model = 'pol14', price = 1},
		{model = 'pol15', price = 1},
		{model = 'pol16', price = 1},
		},

		boss = {
		{model = 'pol1', price = 1},
		{model = 'pol2', price = 1},
		{model = 'pol3', price = 1},
		{model = 'pol4', price = 1},
		{model = 'pol5', price = 1},
		{model = 'pol6', price = 1},
		{model = 'pol7', price = 1},
		{model = 'pol8', price = 1},
		{model = 'pol9', price = 1},
		{model = 'pol10', price = 1},
		{model = 'pol11', price = 1},
		{model = 'pol12', price = 1},
		{model = 'pol13', price = 1},
		{model = 'pol14', price = 1},
		{model = 'pol15', price = 1},
		{model = 'pol16', price = 1},
		}
	},

	helicopter = {
        aspirant = {},

		surveillant = {},

		agent = {},

		hoofdagent = {},

		brigadier = {},

		inspecteur = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		hoofdinspecteur = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		commissaris = {
			{model = 'polmav', props = {modLivery = 0}, price = 1},
			{model = 'aw139', props = {modLivery = 0}, price = 1}
		},

		hoofdcommissaris = {
			{model = 'polmav', props = {modLivery = 0}, price = 1},
			{model = 'aw139', props = {modLivery = 0}, price = 1}
		},

		boss = {
			{model = 'polmav', props = {modLivery = 0}, price = 1},
			{model = 'aw139', props = {modLivery = 0}, price = 1}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	aspirant = {},

	surveillant = {},

	agent = {},

	hoofdagent = {},

	brigadier = {},

	inspecteur = {},

	hoofdinspecteur = {},

	commissaris = {},

	hoofdcommissaris = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	aspirant = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	surveillant = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	agent = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	hoofdagent = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},


	brigadier = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	inspecteur = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	hoofdinspecteur = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},


	commissaris = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	hoofdcommissaris = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},


	boss = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0,
			bag_1 = 2,      bag_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	dsi_wear = { -- currently the same as chef_wear
	male = {
		tshirt_1 = 6,  tshirt_2 = 0,
		torso_1 = 7,    torso_2 = 0,
		arms = 42,
		pants_1 = 4,    pants_2 = 2,
		helmet_1 = 4,   helmet_2 = 0,
		chain_1 = 2,    chain_2 = 0,
		ears_1 = -1,    ears_2 = 0,
		bproof_1 = 7,   bproof_2 = 0,
		mask_1 = 55,    mask_2 = 0,
		hair_1 = -1,    hair_2 = 0
	},
	female = {
		tshirt_1 = -1,  tshirt_2 = 0,
		torso_1 = 7,    torso_2 = 0,
		arms = 42,
		pants_1 = 4,    pants_2 = 2,
		helmet_1 = -1,   helmet_2 = 0,
		chain_1 = 2,    chain_2 = 0,
		ears_1 = -1,    ears_2 = 0,
		bproof_1 = 7,   bproof_2 = 0,
		mask_1 = 55,    mask_2 = 0,
		hair_1 = -1,    hair_2 = 0
	}
},
at_wear = {
	male = {
		tshirt_1 = -1,  tshirt_2 = 0,
		torso_1 = 6,    torso_2 = 0,
		arms = 42,
		pants_1 = 4,    pants_2 = 2,
		helmet_1 = 6,   helmet_2 = 0,
		chain_1 = 2,    chain_2 = 0,
		ears_1 = -1,    ears_2 = 0,
		bproof_1 = 8,   bproof_2 = 0,
		mask_1 = 55,    mask_2 = 0,
		hair_1 = -1,    hair_2 = 0
	},
	female = {
		bproof_1 = 7,   bproof_2 = 0,
	}
},

	helm_wear = {
		male = {
			helmet_1 = 2,  helmet_2 = 0,
		},
		female = {
			helmet_1 = 2,  helmet_2 = 0,
		}
	},

	motor_wear = {
		male = {
			helmet_1 = 17,  helmet_2 = 0,
			torso_1 = 9,   torso_2 = 0,
		},
		female = {
			helmet_1 = 17,  helmet_2 = 0,
			torso_1 = 9,   torso_2 = 0,
		}
	},

	motors_wear = {
		male = {
			bproof_1 = 1,   bproof_2 = 1
		},
		female = {
			bproof_1 = 1,   bproof_2 = 1
		}
	},

	honden_wear = {
		male = {
			bproof_1 = 1, bproof_2 = 4 
		},
		female = {
			bproof_1 = 1, bproof_2 = 4 
		}
	},

	gilet_wear = {
		male = {
			bproof_1 = 6,  bproof_2 = 4
		},
		female = {
			tshirt_1 = 6,  tshirt_2 = 4
		}
	},

	steek_wear = {
		male = {
			bproof_1 = 1,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 1,  tshirt_2 = 0
		}
	},

	ibt_wear = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 4,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0,
			bag_1 = 2,      bag_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1
		}
	},

	bullet_wear = {
		male = {
			decals_1 = 1,  decals_2 = 0
		},
		female = {
			decals_1 = 1,  decals_2 = 0
		}
	}
}
