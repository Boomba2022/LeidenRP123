resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description "ESX Inventory HUD"

version "1.1"

ui_page "html/ui.html"

client_scripts {
  "@es_extended/locale.lua",
  "client/main.lua",
  "client/trunk.lua",
  "client/property.lua",
  "client/player.lua",
  "locales/cs.lua",
  "locales/en.lua",
  "locales/fr.lua",
  "config.lua"
}

server_scripts {
  "@es_extended/locale.lua",
  "server/main.lua",
  "locales/cs.lua",
  "locales/en.lua",
  "locales/fr.lua",
  "config.lua"
}

files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  -- JS LOCALES
  "html/locales/cs.js",
  "html/locales/en.js",
  "html/locales/fr.js",
  -- IMAGES
  "html/img/bullet.png",
  -- ICONS
  "html/img/items/vine.png",
  "html/img/items/fabric.png",
  "html/img/items/rubber.png",
  "html/img/items/metalscrap.png",
  "html/img/items/anvil.png",
  "html/img/items/bottle.png",
  "html/img/items/drill.png",
  "html/img/items/blowpipe.png",
  "html/img/items/wood.png",
  "html/img/items/package_plank.png",
  "html/img/items/wool.png",
  "html/img/items/clothe.png",
  "html/img/items/HeavyArmor.png",
  "html/img/items/MedArmor.png",
  "html/img/items/SmallArmor.png",
  "html/img/items/pAmmo.png",
  "html/img/items/silencieux.png",
  "html/img/items/samsungs10.png",
  "html/img/items/lockpick.png",
  "html/img/items/ring.png",
  "html/img/items/goldNecklace.png",
  "html/img/items/laptop.png",
  "html/img/items/camera.png",
  "html/img/items/rolex.png",
  "html/img/items/fishbait.png",
  "html/img/items/turtlebait.png",
  "html/img/items/turtle.png",
  "html/img/items/slaughtered_chicken.png",
  "html/img/items/packaged_chicken.png",
  "html/img/items/copper.png",
  "html/img/items/shark.png",
  "html/img/items/moonshine_pooch.png",
  "html/img/items/moonshine.png",
  "html/img/items/jus_raisin.png",
  "html/img/items/grand_cru.png",
  "html/img/items/meat.png",
  "html/img/items/leather.png",
  "html/img/items/WEAPON_DOUBLEACTION.png",
  "html/img/items/diamond.png",
  "html/img/items/alive_chicken.png",
  "html/img/items/raisin.png",
  "html/img/items/fish.png",
  "html/img/items/fishingrod.png",
  "html/img/items/bait.png",
  "html/img/items/bandage.png",
  "html/img/items/beer.png",
  "html/img/items/contract.png",
  "html/img/items/binoculars.png",
  "html/img/items/bread.png",
  "html/img/items/cannabis.png",
  "html/img/items/cigarette.png",
  "html/img/items/clip.png",
  "html/img/items/menthe.png",
  "html/img/items/plastic.png",
  "html/img/items/essence.png",
  "html/img/items/petrol.png",
  "html/img/items/petrol_raffin.png",
  "html/img/items/bracelet.png",
  "html/img/items/cocacola.png",
  "html/img/items/coffee.png",
  "html/img/items/coke.png",
  "html/img/items/coke_pooch.png",
  "html/img/items/meth.png",
  "html/img/items/meth_pooch.png",
  "html/img/items/opium.png",
  "html/img/items/opium_pooch.png",
  "html/img/items/weed.png",
  "html/img/items/gold.png",
  "html/img/items/icetea.png",
  "html/img/items/sandwich.png",
  "html/img/items/papers.png",
  "html/img/items/hamburger.png",
  "html/img/items/wine.png",
  "html/img/items/cash.png",
  "html/img/items/chocolate.png",
  "html/img/items/iron.png",
  "html/img/items/jewels.png",
  "html/img/items/medikit.png",
  "html/img/items/tequila.png",
  "html/img/items/whisky.png",
  "html/img/items/limonade.png",
  "html/img/items/phone.png",
  "html/img/items/vodka.png",
  "html/img/items/water.png",
  "html/img/items/cupcake.png",
  "html/img/items/drpepper.png",
  "html/img/items/energy.png",
  "html/img/items/croquettes.png",
  "html/img/items/bolpistache.png",
  "html/img/items/bolnoixcajou.png",
  "html/img/items/bolcacahuetes.png",
  "html/img/items/fixkit.png",
  "html/img/items/bolchips.png",
  "html/img/items/black_chip.png",
  "html/img/items/black_money.png",
  "html/img/items/gym_membership.png",
  "html/img/items/WEAPON_PISTOL.png",
  "html/img/items/WEAPON_APPISTOL.png",
  "html/img/items/WEAPON_ASSAULTRIFLE.png",
  "html/img/items/WEAPON_BOTTLE.png",
  "html/img/items/WEAPON_BAT.png",
  "html/img/items/WEAPON_CROWBAR.png",
  "html/img/items/WEAPON_GOLFCLUB.png",
  "html/img/items/WEAPON_KNIFE.png",
  "html/img/items/WEAPON_MICROSMG.png",
  "html/img/items/WEAPON_NIGHTSTICK.png",
  "html/img/items/WEAPON_HAMMER.png",
  "html/img/items/WEAPON_SMG.png",
  "html/img/items/WEAPON_STUNGUN.png",
  "html/img/items/WEAPON_SPECIALCARBINE.png",
  "html/img/items/WEAPON_FLASHLIGHT.png",
  "html/img/items/WEAPON_REVOLVER.png",
  "html/img/items/WEAPON_DAGGER.png",
  "html/img/items/WEAPON_PETROLCAN.png",
  "html/img/items/WEAPON_SWITCHBLADE.png",
  "html/img/items/WEAPON_POOLCUE.png",
  "html/img/items/battery.png",
  "html/img/items/cocainebag.png",
  "html/img/items/cokepackage.png",
  "html/img/items/dopebag.png",
  "html/img/items/drugscales.png",
  "html/img/items/purecokepackage.png",
  "html/img/items/lighter.png",
  "html/img/items/lowradio.png",
  "html/img/items/stockrim.png",
  "html/img/items/airbag.png",
  "html/img/items/powerade.png",
  "html/img/items/protein_shake.png",
  "html/img/items/sportlunch.png",
  "html/img/items/highradio.png",
  "html/img/items/highrim.png",
  "html/img/items/moneywashid.png",
  "html/img/items/weed_pooch.png",
  "html/img/items/seed_weed.png",
  "html/img/items/pupuk_weed.png",
  "html/img/items/rope.png",
  "html/img/items/handcuffs.png",
  "html/img/items/weed_license.png"
}
