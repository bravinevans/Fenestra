#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="winx-os"
iso_label="WINX_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="WinX OS <https://github.com/bravinevans/Winx>"
iso_application="WinX OS Live/Install Media"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi.grub')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/sudoers.d/winx"]="0:0:440"
  ["/root"]="0:0:750"
  ["/usr/local/bin/winx-setup-desktop.sh"]="0:0:755"
  ["/usr/local/bin/winx-console-session"]="0:0:755"
)
