#!/bin/bash

# Uses generates a WhatsApp desktop client for Linux.
#
# # Dependencies:
#
# ## Required:
# * `nativefier` (https://github.com/jiahaog/nativefier)
#
# ## Optional (only for Moka icon theme)
# * `moka-icon-theme` (https://github.com/snwh/moka-icon-theme)
# * `wget` (available in most distribution repositories)

readonly OUTPUT_DIR="${PWD}/WhatsApp-linux-x64"
readonly OPTIONS='--single-instance --tray'
readonly USE_MOKA_ICON=false

select_icon_spec() {
  if [[ "${USE_MOKA_ICON}" == true ]]; then
    # Select the native Moka icon on the system.
    echo 'web-whatsapp'
  else
    # Select the original built-in WhatsApp icon.
    echo "${OUTPUT_DIR}/resources/app/icon.png"
  fi
}

readonly DESKTOP_FILE="[Desktop Entry]
Name=WhatsApp Desktop
Comment=Ghetto desktop client for WhatsApp Web
GenericName=Instant Messenger
Exec=${OUTPUT_DIR}/WhatsApp %U
Icon=$(select_icon_spec)
Terminal=false
Type=Application
StartupNotify=true
StartupWMClass=WhatsApp
Keywords=WhatsApp;Web;Chat;Messenger;
Categories=Network;InstantMessenger;
X-GNOME-UsesNotifications=true"

# Generate native web app.
nativefier -n WhatsApp ${OPTIONS} 'https://web.whatsapp.com/'

# Download the Moka icon file, if configured to do so.
if [[ "${USE_MOKA_ICON}" == true ]]; then
  icon_url='https://github.com/snwh/moka-icon-theme/raw/master/Moka/96x96@2x/web/web-whatsapp.png'
  wget -qO "${OUTPUT_DIR}/resources/app/icon.png" ${icon_url}
fi

# Generate .desktop file.
echo "${DESKTOP_FILE}" > "${OUTPUT_DIR}/whatsapp.desktop"

# Change GNOME Shell app menu text.
sed -i 's/\("name":"\)[^"]*\(",\)/\1WhatsApp Desktop\2/g' \
    "${OUTPUT_DIR}/resources/app/package.json"

# Change tray icon context menu label.
sed -i 's/\("name":"\)[^"]*\(",\)/\1WhatsApp\2/g' \
    "${OUTPUT_DIR}/resources/app/nativefier.json"
