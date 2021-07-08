resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "html/ui.html"

client_script {
    'client.lua'
}


files {
    'html/*',
    'html/js/*',
    'html/img/*',
    'html/fonts/*',
    'html/css/*',
    'html/img/apps/*',
}
  

exports {
	'grotenotification',
    'notification'
}