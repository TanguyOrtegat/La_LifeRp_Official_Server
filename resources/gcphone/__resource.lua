ui_page 'html/index.html'

files {
	'html/index.html',
	'html/static/css/app.css',
	'html/static/js/app.js',
	'html/static/js/manifest.js',
	'html/static/js/vendor.js',

	'html/static/img/coque/noir.png',
	
	'html/static/img/back001.jpg',
	'html/static/img/back002.jpg',
	'html/static/img/back003.jpg',

	
	'html/static/img/call.png',
	'html/static/img/contacts.png',
	'html/static/img/sms.png',
	'html/static/img/settings.png',

	'html/static/fonts/fontawesome-webfont.ttf',

}

client_script {
	"animation.lua",
	"client.lua"
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    '@common/lalife.lua',
    '@common/player/index.lua',
    '@common/player/manager.lua',
	"server.lua"
}

