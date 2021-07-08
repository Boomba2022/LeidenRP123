fx_version 'bodacious'
games { 'gta5' }

author 'NieuwenbergRP'
description 'NieuwenbergRP Brandweer pack'
version '1.0.0'

files {
	'vehicles.meta',
	'carvariations.meta',
	'handling.meta',
	'vehiclelayouts.meta',
	'dlctext.meta',	
	'carcols.meta',
	'els/br1.xml',
	'els/br2.xml'
	
}

files {
   'data/**/*.meta'
}

data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'


client_script 'vehicle_names.lua'
data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'
data_file 'DLCTEXT_FILE' 'data/**/dlctext.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'data/**/contentunlocks.meta'

is_els 'true'