<div align="center">
  <img src="profile/airootfs/usr/share/pixmaps/winx-logo.svg" alt="WinX OS Logo" width="140" height="140" />
  <h1>WinX OS</h1>
  <p><strong>Familiar like Windows. Built for Gaming. Zero Bloat.</strong></p>
  <p>
    An Arch-based Linux distribution engineered for users transitioning from Windows—combining an instant-familiar desktop layout, a dedicated Steam Deck Console Mode, and an offline Microsoft Office-compatible productivity suite with zero forced cloud sign-ins.
  </p>
</div>

---

## Why WinX OS?

| Feature | Windows 11 | WinX OS |
| :--- | :--- | :--- |
| **Account Requirement** | Forced Microsoft Account & telemetry | **100% offline local account** on first boot |
| **Desktop & Workflow** | Centered taskbar, Start grid, double-click | **KDE Plasma 6** tuned to match Windows muscle memory |
| **Gaming Experience** | Desktop mode only | **Pre-installed 64-bit Steam Runtime + Gamescope Deck UI** (HDR & VRR ready) |
| **Office Suite** | Paid Microsoft 365 subscription | **WinX Word, Excel & PowerPoint** pre-configured with Tabbed Ribbon UI |
| **System Overhead** | Heavy background services & ads | **Lean `linux-zen` kernel + PipeWire** with zero adware or bloat |

---

## Core Stack

* **Desktop Environment:** Minimal KDE Plasma 6 (Wayland + XWayland) with a `44px` bottom taskbar, custom WinX Start launcher, and Windows-style double-click navigation.
* **Gaming & Graphics:**
  * Pre-installed **Steam** (64-bit runtime container), **Lutris**, **Wine-Staging**, **MangoHud**, and **GameMode**.
  * Selectable **WinX Console Mode (Steam Deck UI)** session directly from the login screen via `gamescope` with HDR and Adaptive Sync (VRR) enabled.
  * Out-of-the-box Vulkan and 32-bit driver support for **AMD (`vulkan-radeon`)**, **Intel (`vulkan-intel`)**, and **NVIDIA (`nvidia-dkms`)**.
* **Productivity Suite:** Pre-configured **WinX Word**, **WinX Excel**, and **WinX PowerPoint** featuring a familiar tabbed Ribbon toolbar and native `.docx`, `.xlsx`, and `.pptx` compatibility.
* **Installer:** Offline **Calamares** graphical installer for single-click SSD/NVMe deployment.

---

## Download & Reassemble the ISO

Because GitHub Releases caps individual files at 2 GB, the WinX OS ISO is distributed in two parts (`.00.part` and `.01.part`) for fast, resumable downloads.

1. Download both `winx-os-*.iso.00.part`, `winx-os-*.iso.01.part`, and the `.sha256` file from the [**Releases**](https://github.com/bravinevans/Winx/releases) page.
2. Reassemble the parts into a single bootable `.iso`:
   * **On Linux / macOS:**
     ```bash
     cat winx-os-*.iso.*.part > winx-os.iso
     sha256sum -c winx-os-*.iso.sha256
     ```
   * **On Windows (PowerShell):**
     ```powershell
     cmd /c copy /b winx-os-*.iso.00.part + winx-os-*.iso.01.part winx-os.iso
     ```
3. Flash `winx-os.iso` to a USB drive using **Ventoy**, **Rufus**, or **BalenaEtcher**, boot from USB, and click **Install WinX OS** on the desktop.

---

## Cloud Build Architecture

WinX OS is built reproducibly in the cloud using `archiso` and GitHub Actions:
* `profile/packages.x86_64` — Curated zero-bloat package manifest (`linux-zen`, Plasma 6, Steam, Gamescope, PipeWire, Office).
* `profile/airootfs/` — System overlay including SDDM auto-login, Gamescope console session, Plymouth boot splash, and first-boot desktop layout automation.
* `.github/workflows/build-iso.yml` — Automated container pipeline that compiles Calamares, builds the SquashFS ISO, and publishes split release assets.
