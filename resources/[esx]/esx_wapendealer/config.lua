Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = true
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.maffiaStations = {

  maffia = {

    Blip = {
      Pos     = { x = 18.64, y = -1113.18, z = 29.8 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    Items = {
      { name = 'pistol50',    label = 'Desert eagle',     price = 125000 },
			{ name = 'vintagepistol',    label = 'Vintage',     price = 75000 },
			{ name = 'snspistol',    label = 'Sns',     price = 75000 },
			{ name = 'bat',    label = 'Honkbalknupper',     price = 5000 },
			{ name = 'knife',    label = 'Mes',     price = 15000 },
			{ name = 'machete',    label = 'Machete',     price = 27500 },
			{ name = 'smg',    label = 'SMG',     price = 250000 },
			{ name = 'knuckle',    label = 'Boksbeugel',     price = 7500 },
			{ name = 'wrench',    label = 'Sleutel',     price = 10000 },
			{ name = 'flashlight',    label = 'Zaklamp',     price = 100 },
			{ name = 'pistol_ammo',    		label = 'Pistool kogels x20',   price = 4000 },
			{ name = 'smg_ammo',    		label = 'SMG kogels x20',    	price = 6000 },
			
        },

	  AuthorizedVehicles = {
		  --{ name = 'brabuse63',  label = 'Mercedes AMG E63 Brabus' },
		 -- { name = 'a8fsi',  label = 'Audi A8' },
	  },

    Cloakrooms = {
      --{ x = 9.283, y = 528.914, z = 169.635 },
    },

    Armories = {
      { x = 24.52, y = -1105.79, z = 29.8 },
    },

    Vehicles = {
      --[[{
        Spawner    = { x = 148.30, y = -1271.95, z = 28.22 },
        SpawnPoint = { x = 136.89, y = -1270.47, z = 28.20},
        Heading    = 280.0,
      }]]
    },
	
	Helicopters = {
      --[[{
        Spawner    = { x = 20.312, y = 535.667, z = 173.627 },
        SpawnPoint = { x = 3.40, y = 525.56, z = 177.919 },
        Heading    = 0.0,
      }]]
    },

    VehicleDeleters = {
      --{ x = 149.83, y = -1275.70, z = 28.22 },
      --{ x = 1413.64, y = 1119.16, z = 113.84 },
    },

    BossActions = {
      { x = 4.14, y = -1108.07, z = 29.8 },
    },

  },

}
