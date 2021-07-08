Cyclus = {}

-- Logs voor in je discord, wijzig wel de webhook naar die van jou!
Cyclus.webhook = "https://discord.com/api/webhooks/851106467569336321/niLP7CLA6-c0NzvVUJUKS4jLdWh0ChxOqkANOczJPRAasxbFmAqJY6H2N6UV8pE5t7Ks"

-- Cooldown
Cyclus.Cooldown = 150 -- Cooldown indien mislukken na hacken
Cyclus.StartCooldown = 0 -- Cooldown die je ziet bij het proberen te hacken

-- Blips
Cyclus.Blip = true -- Dit is de blip op de map waar je de wapens kan kopen. Deze is pas te zien na het hacken van de laptop

-- Hacking Apparaat optie's
Cyclus.HackBlocks = 4 -- Aantal nummers per opdracht
Cyclus.HackTime = 40 -- Aantal seconde die je hebt voor de minihackgame stopt

Cyclus.Locatie = {
    [1] = { -- Locatie van de hackminigame
        x = 1275.55,
        y = -1710.49,
        z = 54.77,
    },

    [2] = { -- Locatie waar de wapens zijn te verkrijgen
        x = 1105.34,
        y = -2327.22,
        z = 31.39,
    }
}

-- Wapens die te verkrijgen zijn bij de blackmarket
Cyclus.Wapens = {
    ['WEAPON_PISTOL50'] = {
    maxAmmo = 50,
    prijs = 100000,
    
    },
    ['WEAPON_SNSPISTOL'] = {
        maxAmmo = 50,
        prijs = 100000,
    }
}