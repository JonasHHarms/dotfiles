
-----------------------
----- PERMISSIONS -----
-----------------------

hl.config({
   ecosystem = {
     enforce_permissions = true,
   },
})

 hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
 hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
 hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


 hl.permission("~/tools/grim-hyprland/build/grim", "screencopy", "allow")
 hl.permission("/usr/lib/xdg-desktop-portal-hyprland", "screencopy", "allow")
 hl.permission("/usr/libexec/xdg-desktop-portal-hyprland", "screencopy", "allow")
 hl.permission("/usr/lib64/xdg-desktop-portal-hyprland", "screencopy", "allow")
 hl.permission("/usr/bin/appsuite-.*", "screencopy", "allow")
 hl.permission("/usr/bin/grim", "screencopy", "allow")
 hl.permission("/usr/bin/hyprpicker", "screencopy", "allow")
 hl.permission("/usr/bin/hyprpm", "plugin", "ask")
 hl.permission("power-button", "keyboard", "allow")
 hl.permission("power-button-1", "keyboard", "allow")
 hl.permission("video-bus", "keyboard", "allow")
 hl.permission("video-bus-1", "keyboard", "allow")
 hl.permission("intel-hid-events", "keyboard", "allow")
 hl.permission("sleep-button", "keyboard", "allow")
 hl.permission("logitech-usb-receiver-keyboard", "keyboard", "allow")
 hl.permission("logitech-usb-receiver-keyboard-1", "keyboard", "allow")
 hl.permission("logitech-usb-receiver", "keyboard", "allow")
 hl.permission("asus-wmi-hotkeys", "keyboard", "allow")
 hl.permission("asustek-computer-inc.-n-key-device-2", "keyboard", "allow")
 hl.permission("asustek-computer-inc.-n-keydevice-2", "keyboard", "allow")
 hl.permission("asustek-computer-inc.-n-key-device", "keyboard", "allow")
 hl.permission("asustek-computer-inc.-n-keydevice", "keyboard", "allow")
 hl.permission("at-translated-set-2-keyboard", "keyboard", "allow")
 hl.permission("hl-virtual-keyboard-wtype", "keyboard", "allow")
 hl.permission("generic-usb-audio-consumer-control", "keyboard", "allow")
 hl.permission("logitech-usb-receiver-consumer-control", "keyboard", "allow")
 hl.permission("logitech-pro-x-wireless-gaming-headset-consumer-control", "keyboard", "allow")
 hl.permission("logitech-pro-x", "keyboard", "allow")
 hl.permission("logitech-usb-receiver-system-control", "keyboard", "allow")
 hl.permission("burrbrown-from-texas-instruments-usb-audio--codec", "keyboard", "allow")
 hl.permission("generic-usb-audio", "keyboard", "allow")
 hl.permission("3d-camera:-etronvideo", "keyboard", "allow")
 hl.permission("usb-2.0-usb-audio-device-consumer-control", "keyboard", "allow")
 hl.permission("usb-2.0-usb-audio-device-keyboard", "keyboard", "allow")
 hl.permission("eee-pc-wmi-hotkeys", "keyboard", "allow")
 hl.permission("logitech-g915-keyboard", "keyboard", "allow")
 hl.permission(".*", "keyboard", "ask")

