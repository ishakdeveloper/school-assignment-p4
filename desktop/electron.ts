const { app, BrowserWindow, ipcMain } = require('electron')
const path = require('path')

app.whenReady().then(() => {
    const splash = new BrowserWindow({
        width: 800,
        height: 800,
        transparent: true,
        frame: false,
        resizable: false,
        webPreferences: {
          nodeIntegration: true,
          contextIsolation: false,
        },
    })

    const win = new BrowserWindow({
        width: 1500,
        height: 800,
        minWidth: 400,
        minHeight: 600,
        autoHideMenuBar: true,
        show: false,
        webPreferences: {
          nodeIntegration: true,
          contextIsolation: false,
        },
    })

    splash.loadFile(path.join(__dirname, 'resources/splash-screen.html'))
    win.loadURL('http://localhost:3000/')

    win.once('ready-to-show', () => {
        splash.destroy()
        win.show()
    })
})


app.on('window-all-closed', function () {
    if (process.platform !== 'darwin') app.quit()
})

