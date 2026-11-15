#!/usr/bin/env bash

# Only run once per user
MARKER="$HOME/.config/.winx-initialized"
[ -f "$MARKER" ] && exit 0

# 1. Enforce Windows double-click behavior in Plasma & Dolphin
kwriteconfig6 --file kdeglobals --group KDE --key SingleClick false

# 2. Set clean Windows-metric fonts (Liberation Sans / Noto)
kwriteconfig6 --file kdeglobals --group General --key font "Liberation Sans,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
kwriteconfig6 --file kdeglobals --group General --key fixed "Noto Sans Mono,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"

# 3. Configure bottom taskbar height (44px) via Plasma scripting
qdbus6 org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '
var panels = panels();
for (var i = 0; i < panels.length; i++) {
    panels[i].location = "bottom";
    panels[i].height = 44;
}
'

# 4. Configure Office suite to use the MS Office Tabbed Ribbon UI by default
mkdir -p "$HOME/.config/libreoffice/4/user"
cat << 'EOF' > "$HOME/.config/libreoffice/4/user/registrymodifications.xcu"
<?xml version="1.0" encoding="UTF-8"?>
<oor:items xmlns:oor="http://openoffice.org/2001/registry" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <item oor:path="/org.openoffice.Office.UI.ToolbarMode/Applications/org.openoffice.Office.UI.ToolbarMode:Application['Writer']"><prop oor:name="Active" oor:op="fuse"><value>notebookbar_groupedbar_compact.ui</value></prop></item>
  <item oor:path="/org.openoffice.Office.UI.ToolbarMode/Applications/org.openoffice.Office.UI.ToolbarMode:Application['Calc']"><prop oor:name="Active" oor:op="fuse"><value>notebookbar_groupedbar_compact.ui</value></prop></item>
  <item oor:path="/org.openoffice.Office.UI.ToolbarMode/Applications/org.openoffice.Office.UI.ToolbarMode:Application['Impress']"><prop oor:name="Active" oor:op="fuse"><value>notebookbar_groupedbar_compact.ui</value></prop></item>
</oor:items>
EOF

# 5. Add Desktop shortcuts for Steam and Office
mkdir -p "$HOME/Desktop"
cp -f /usr/share/applications/steam.desktop "$HOME/Desktop/" 2>/dev/null || true
cp -f /usr/share/applications/libreoffice-writer.desktop "$HOME/Desktop/Word.desktop" 2>/dev/null || true
cp -f /usr/share/applications/libreoffice-calc.desktop "$HOME/Desktop/Excel.desktop" 2>/dev/null || true
cp -f /usr/share/applications/libreoffice-impress.desktop "$HOME/Desktop/PowerPoint.desktop" 2>/dev/null || true
chmod +x "$HOME/Desktop/"*.desktop 2>/dev/null || true

touch "$MARKER"
