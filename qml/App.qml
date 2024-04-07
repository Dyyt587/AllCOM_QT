import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import FluentUI 1.0

FluLauncher {
    id: app
    Connections{
        target: FluTheme
        function onDarkModeChanged(){
            SettingsHelper.saveDarkMode(FluTheme.darkMode)
        }
    }
    Connections{
        target: FluApp
        function onUseSystemAppBarChanged(){
            SettingsHelper.saveUseSystemAppBar(FluApp.useSystemAppBar)
        }
    }
    Connections{
        target: TranslateHelper
        function onCurrentChanged(){
            SettingsHelper.saveLanguage(TranslateHelper.current)
        }
    }
    Component.onCompleted: {
        Network.openLog = false
        Network.setInterceptor(function(param){
            param.addHeader("Token","000000000000000000000")
        })
        FluApp.init(app,Qt.locale(TranslateHelper.current))
        FluApp.windowIcon = "qrc:/res/image/favicon.ico"
        FluApp.useSystemAppBar = SettingsHelper.getUseSystemAppBar()
        FluTheme.darkMode = SettingsHelper.getDarkMode()
        FluTheme.animationEnabled = true
        FluRouter.routes = {
            "/":"qrc:/qml/window/MainWindow.qml",
            "/about":"qrc: /qml/window/AboutWindow.qml",
            "/login":"qrc: /qml/window/LoginWindow.qml",
            "/hotload":"qrc: /qml/window/HotloadWindow.qml",
            "/crash":"qrc:/qml/window/CrashWindow.qml",
            "/singleTaskWindow":"qrc:/qml/window/SingleTaskWindow.qml",
            "/standardWindow":"qrc:/qml/window/StandardWindow.qml",
            "/singleInstanceWindow":"qrc:/qml/window/SingleInstanceWindow.qml",
            "/pageWindow":"qrc:/qml/window/PageWindow.qml"
        }
        var args = Qt.application.arguments
        if(args.length>=2 && args[1].startsWith("-crashed=")){
            FluRouter.navigate("/crash",{crashFilePath:args[1].replace("-crashed=","")})
        }else{
            FluRouter.navigate("/")
        }
    }
}
