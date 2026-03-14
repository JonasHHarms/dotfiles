import app from "ags/gtk4/app"
import GLib from "gi://GLib"
import AstalTray from "gi://AstalTray"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { For, With, createBinding, onCleanup, createState } from "ags"

export default function Systray() {
    onCleanup(() => {
      win.destroy()
    })
    const win = new Gtk.Window({
      title: "Systray",
      defaultWidth: 300,
      defaultHeight: 50,
      decorated: true,
    })

    function Tray() {
      const tray = AstalTray.get_default()
      const items = createBinding(tray, "items")
      const init = (btn: Gtk.MenuButton, item: AstalTray.TrayItem) => {
        btn.menuModel = item.menuModel
        btn.insert_action_group("dbusmenu", item.actionGroup)
        item.connect("notify::action-group", () => {
          btn.insert_action_group("dbusmenu", item.actionGroup)
        })
      }
      return (
        <box>
          <For each={items}>
            {(item) => (
              <menubutton $={(self) => init(self, item)}>
                <image gicon={createBinding(item, "gicon")} />
              </menubutton>
            )}
          </For>
        </box>
        )
      }
  const content = (
    <box orientation={Gtk.Orientation.HORIZONTAL}>
      <label label="Systemtray" />
      <Tray />
    </box>
  )

  win.set_child(content as Gtk.Widget)
  app.add_window(win)
  return win

}

