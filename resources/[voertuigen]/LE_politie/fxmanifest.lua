fx_version 'bodacious'
games { 'gta5' }

author 'NieuwenbergRP'
description 'NieuwenbergRP Politie pack'
version '1.0.0'

files {
	'vehicles.meta',
	'carvariations.meta',
	'handling.meta',
	'vehiclelayouts.meta',
	'dlctext.meta',	
	'carcols.meta',
	'els/pol1.xml',
	'els/pol2.xml',
	'els/pol3.xml',
	'els/pol4.xml',
	'els/pol5.xml',
	'els/pol6.xml',
	'els/pol7.xml',
	'els/pol8.xml',
	'els/pol9.xml',
	'els/pol10.xml',
	'els/pol11.xml',
	'els/pol12.xml',
	'els/pol13.xml',
	'els/pol14.xml',
	'els/pol15.xml',
	'els/pol16.xml',
	'els/pol17.xml',
	'els/pol18.xml',
	'els/pol19.xml',
	'els/pol20.xml',
	'els/pol21.xml',
	'els/pol22.xml',
	'els/pol23.xml',
	'els/pol24.xml',
	'els/pol25.xml',
	'els/Politieboot.xml'
	
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