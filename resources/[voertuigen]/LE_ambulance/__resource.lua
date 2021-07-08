resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


files {
	'vehicles.meta',
	'carvariations.meta',
	'handling.meta',
	'vehiclelayouts.meta',
	'dlctext.meta',	
	'carcols.meta',
	'els/A1.xml',
	'els/A2.xml',
	'els/A3.xml',
	'els/a4.xml',
	'els/A5.xml',
	'els/A6.xml',
	'els/a7.xml',
	'els/a8.xml',
	'els/a9.xml',
	'els/amburapid.xml',
	'els/Q7mmt.xml'
	
}


client_script 'vehicle_names.lua'
data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'DLCTEXT_FILE' 'dlctext.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'contentunlocks.meta'

is_els 'true'