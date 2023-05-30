<p align="center">
  <img src="https://github.com/atraxsrc/pop-tokyonight/assets/92285717/80e6c156-1abd-44e8-a256-051efc2d01c6" width="50" height="50">
</p>

- DE: Gnome 42.5 [PoP!_os] 
- Colorscheme: [Tokyonight-Dark-B](https://www.gnome-look.org/p/1681315/) for Shell | [Tokyonight-Dark-BL](https://www.gnome-look.org/p/1681315/) for Applications 
- Shell: zsh
- Wallpaper: [custom](https://github.com/atraxsrc/tokyonight-wallpapers/blob/main/tokyo-night33hen.jpeg)
- Gnome extensions: see list below
- Icons: [Tokyonight-Dark](https://www.gnome-look.org/p/1681475)
- Terminal: Terminator
- Text Editor: Nvim(Nvchad) - Gedit

## Installed Extensions

### ✅ installed - ON | ❌ installed - OFF

- ✅ Blur my Shell		  
- ✅ Burn My Windows		
- ❌ Cosmic Dock		    
- ❌ Cosmic Workspaces	
- ❌ COSMIC X11 Gestures	
- ❌ Desktop Icons NG	
- ✅ Just Perfection		
- ❌ Pop COSMIC		
- ✅ Pop Shell		
- ✅ Removable Drive Menu	
- ✅ Rounded Window Corners	
- ✅ System76 Power		
- ✅ Ubuntu AppIndicators	
- ✅ User Themes

### Blur my Shell - Application blur

Add the following to **dconf editor** path /org/gnome/shell/extentions/blur-my-shell/application/whitelist:

```dconf
['X-terminal-emulator', 'gnome-extensions-app', 'Gnome-terminal', 'Org.gnome.Nautilus', 'Gnome-control-center', 'TelegramDesktop', 'Dconf-editor', 'Gnome-calculator', 'Gedit', 'Gnome-system-monitor', 'firefox', 'org.gnome.Shell.Extensions', 'Io.elementary.appcenter']
