Config = {}

Config.Locale = 'en'

Config.DrugDealerItems = {
	heroin = 546,
	marijuana = 784,
	meth = 1635,
	coke_pooch = 1027,
	coke = 1027,
	lsd = 2178,
}

Config.ChemicalsConvertionItems = {
	hydrochloric_acid = 0,
	sodium_hydroxide = 0,
	sulfuric_acid = 0,
	lsa = 0,
}

Config.ChemicalsLicenseEnabled = false --Will Enable or Disable the need for a Chemicals License.
Config.MoneyWashLicenseEnabled = false --Will Enable or Disable the need for a MoneyWash License.


Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.EnableMapsBlimps = false -- Enables the blimps on the map.

Config.CircleZones = {
	--DrugDealer
	DrugDealer = {coords = vector3(-1172.02, -1571.98, 4.66), blimpcoords = vector3(-1172.02, -1571.98, 4.66), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 0.0, enabled = true},
}
