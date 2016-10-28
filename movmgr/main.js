const electron = require('electron')
const app = electron.app
const BrowserWindow = electron.BrowserWindow

const ipc_ = electron.ipcMain

function window_open(url1, o) {
	let w = new BrowserWindow({icon:`${__dirname}/bin/img/icon.png`})
	w.loadURL('file://' + __dirname + '/' + url1)

	let wc = w.webContents
	wc.on('did-finish-load', function() {
		wc.send('wid', w.id)

		let chnname = ['info']
		for(let i = 0; i < chnname.length; i++) {
			let n = chnname[i], o2 = o[n]
			if(o2) {
				wc.send(n, o2)
			}
		}
	})

	if(o.max)
		w.maximize()
	if(!o.menubar) {
		w.setMenu(null)
	}
	return w
}

let mainWindow
function createWindow () {
	mainWindow = window_open('index.html', {max:true})
	mainWindow.on('closed', function () {
		mainWindow = null
	})
}

app.on('ready', createWindow)
app.on('window-all-closed', function () {
	app.quit()
})
app.on('activate', function () {
	if (mainWindow === null) {
		createWindow()
	}
})

ipc_.on('window_open', function(event, url, o) {
	window_open(url, o)
})
ipc_.on('window_min', function(event, wid) {
	BrowserWindow.fromId(wid).minimize()
})

ipc_.on('index.html', function(event, arg1, arg2, arg3, arg4) {
	mainWindow.webContents.send('index.html', arg1, arg2, arg3, arg4)
})
ipc_.on('sou.html', function(event, wid, arg1, arg2, arg3, arg4) {
	BrowserWindow.fromId(wid).webContents.send('sou.html', arg1, arg2, arg3, arg4)
})
