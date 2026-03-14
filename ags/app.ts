import app from "ags/gtk4/app"
import style from "./style.scss"
import GLib from "gi://GLib"
import Systray from "./widget/systray"
import Gtk from "gi://Gtk?version=4.0"
let systray: Gtk.Window

app.start({
  css: style,
  gtkTheme: "Adwaita-dark",
  main() {
      systray = Systray() as Gtk.Window
      app.add_window(systray)
      systray.present()
  },
})
