config = {
	versionCheck = false, -- enables version checking (if this is enabled and there is no new version it won't display a message anyways)
	text = {
		format = '~y~Postcode~w~: %s (~g~%.2fm~w~)',
		-- ScriptHook PLD Position
		--posX = 0.225,
		--posY = 0.963,
		-- vMenu PLD Position
		posX = 0.86,
		posY = 0.969
	},
	blip = {
		blipText = 'Postcode Route %s',
		sprite = 8,
		color = 1, -- default 3 (light blue)
		distToDelete = 100.0, -- in meters
		deleteText = 'Route verwijderd',
		drawRouteText = 'Route getekend naar %s',
		notExistText = "Die postcode bestaat niet"
	}
}
