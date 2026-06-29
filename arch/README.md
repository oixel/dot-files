# arch

These are all the different configurations and steps I took to customize my arch build on my personal laptop. The specifics and more peculiar steps are explained below.

*Note:* A majority of the visual theming of my build is based on my custom Obsidian theme named [Bonno](https://github.com/oixel/obsidian-bonno). As of the current moment, Bonno is a dark-mode-focused theme so not a lot exists on the light-mode side of styling. Of additional note, it is a generally boring and simple color scheme utilizing strictly brownish shades of grey, off-whites, and a pastel-mustard yellow for all accents. While not incredibly-exciting it is clean, non-distracting, and visually appealing (at least to me).

To ensure that fuzzel works correctly, place the scripts folder into `~/code/` or customize the `$openFuzzel` variable in the hyprland config.

## applications


*official packages*
- **window manager** : [hyprland](https://archlinux.org/packages/extra/x86_64/hyprland/
- **session manager** : [uwsm](https://archlinux.org/packages/extra/any/uwsm/)
- **login manager**: [greetd](https://archlinux.org/packages/extra/x86_64/greetd/)
- **terminal** : [ghostty](https://archlinux.org/packages/extra/x86_64/ghostty/)
- **fuzzy finder / launcher** : [fuzzel](https://archlinux.org/packages/extra/x86_64/fuzzel/)
- **screenshot** : [slurp](https://archlinux.org/packages/extra/x86_64/slurp/) (screenshot) + [swappy](https://archlinux.org/packages/extra/x86_64/swappy/) (screenshot editting / saving)
- **browser** : [firefox](https://archlinux.org/packages/extra/x86_64/firefox/)
- **note taking** : [obsidian](https://archlinux.org/packages/extra/x86_64/obsidian/)
- **file browser** : [yazi](https://archlinux.org/packages/extra/x86_64/yazi/)
- **media player** : [vlc](https://archlinux.org/packages/extra/x86_64/vlc/)
- **image viewer** : [imv](https://archlinux.org/packages/extra/x86_64/imv/) (set mimetypes to handle with `xdg-mime default imv.desktop image/png image/jpeg image/gif`)
- **IDE** : [code](https://archlinux.org/packages/extra/x86_64/code/) / [neovim](https://archlinux.org/packages/extra/x86_64/neovim/)
- **TUI art** : [arttime](https://github.com/poetaman/arttime) (displays custom boot up image in terminal)


*AUR packages*
- **greeter** (updated fork of tuigreet for greetd): [tuigreet](https://github.com/NotAShelf/tuigreet)
- **status bar / wallpaper** : [noctalia](https://github.com/noctalia-dev/noctalia)
- **music player** : [subtui](https://github.com/MattiaPun/SubTUI) *(requires a subsonic server)*

### required

- [xdg-desktop-portal](https://archlinux.org/packages/extra/x86_64/xdg-desktop-portal/)
- [qt5-wayland](https://archlinux.org/packages/extra/x86_64/qt5-wayland/)
- [qt6-wayland](https://archlinux.org/packages/extra/x86_64/qt6-wayland/)
- [wl-clipboard](https://archlinux.org/packages/extra/x86_64/wl-clipboard/) (clipboard manager)
- [cliphist](https://archlinux.org/packages/extra/x86_64/cliphist/) (clipboard history)
- [pipewire](https://archlinux.org/packages/extra/x86_64/pipewire/) (managed through noctalia's UI)
- [networkmanager](https://archlinux.org/packages/extra/x86_64/networkmanager/) (managed through noctalia's UI)
- [polkit](https://archlinux.org/packages/extra/x86_64/polkit/) (managed through noctalia)
- [bemoji](https://github.com/marty-oehme/bemoji) *(optional AUR package for if you want the emoji picker functionality to work with fuzzel)*

\---

While a specific font is not needed, a NerdFont in general should be downloaded from [here](https://www.nerdfonts.com/font-downloads). I have a specific preference towards [CommitMono Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CommitMono.zip). In case you prefer another NerdFont, make sure to replace these variables in the following .config files:
- `font` property in `.config/fuzzel/fuzzel.ini`
- `font-family` property in `.config/ghostty/config.ghostty`

---

## configs explained

*the configs are explained in alphabetical order as they appear in the `/.config/` directory.*

- `/fuzzel/fuzzel.ini` : 
    - color / font changes to be in line with theme.
    - rids of app icons.
    - utilize ghostty as the terminal.

- `/ghostty/config.ghostty` :
    - Color customizations to be in line with theme.
    - *Note:* As commented in the config, to ensure that the terminal's current path is colored to the custom shade of yellow add the following line to the `~/.bashrc` file (or wherever your `.bashrc` file exists):

    `PS1="\[\e[33m\]\w\[\e[0m\] \$ "`

- `/gtk-3.0/gtk.css` : simplifies the UI elements on any GTK-dependent windows while continuing to uphold theming. While a lot of my set up does not use GTK, it still appears from time to time (such as with swappy after taking a screenshot).

- `/hypr/hyprland.conf` : the bulkiest of configs, each decision is explained within the config file for simplicity's sake and keybinds can be found in the different "Keybinds" sections of the config.

- `/mimeapps.list` : defines which applications handle specific file formats. Update through the `xdg-mime default ...` command rather than manually editting the file.

- `/noctalia/`
    - `/colorschemes/Bonno` : defines a noctalia-equivalent color scheme for [Bonno](https://github.com/oixel/obsidian-bonno).
    - `/colors.json`: applies the custom color scheme.
    - `/plugins.json` : specifies which additional plugins I use in my status bar. As of right now I only added three plugins each being created by the official noctalia team:
        1. Color Scheme Creator (disabled) : used to create the custom color scheme.
        2. Polkit Agent : provides a polkit agent, but uses the noctalia theming.
        3. Privacy Indicator : provides a status bar widget to indicate when the camera, microphone, or screen sharing is active.
    - `/settings.json` : the actual configuration of the status bar with primary changes:
        - Removes noctalia's app launcher (since I use fuzzel).
        - Removes almost all non-bar functionality since all I desire out of noctalia is an easily customizable and functional status bar.
        - Bar widgets:
            - Left:
                - Workspaces : shows what workspaces currently exist / are active.
                    - Can be scrolled to quickly swap between workspaces.
                - Audio Visualizer : displays waveforms of any active audio on the laptop. Not inherently functional, but is pretty to look at. Only appears when there is active playback.
            - Center: 
                -  Clock : customized to be in the format of `HH:mm - MM.dd (ddd)`
            - Right:
                - Mini Media Player : displays playback information of any currently playing / paused media.
                    - Can be clicked to provide basic media controls, but do note that seeking is rather hit-or-miss depending on the media source.
                - Privacy Indicator : icon widget that appear when microphone, camera, or screen sharing is active.
                - Notification History : allows you to view any current or past desktop notifications.
                - Battery : can be clicked to control power profile.
                - Volume : can be clicked to alter volume controls through noctalia's UI.
                - Microphone : shows whether microphone is muted. Clicking it opens the same menu as the volume widget.
                - Brightness : can be clicked to alter screen brightness through noctalia's UI.
                - Control Center : allows access to noctalia settings, network settings, bluetooth settings, airplane mode, and wallpaper settings.

- `/swappy/config` : sets the specific directory where / how screenshots taken with slurp should be saved.

- `/subtui/config.toml` : minor visual customizations to the player to uphold the rest of the theming and tweaked keybindings that make better sense for me. Keybinds can be seen in the TUI app by hitting `?` when not in the search bar.

## base terminal theming

One of the first things I customized was the default Linux terminal to ensure it upheld my custom theme while also making the font more legibile.

These are the steps to do so:

1. Download a custom terminal font from [here](https://gist.github.com/AskinNet/10c8e131bf371dd5eab68e791040c995).
2. Download the [forked version of tuigreet](https://github.com/NotAShelf/tuigreet) to allow for more control via a config file.
3. Place the files in [etc](https://github.com/oixel/dot-files/tree/main/arch%2Fetc) into your `/etc/` directory.
4. Force the greetd service to call the custom color override on startup so that it can run with elevated priviledges:

```
sudo mkdir -p /etc/systemd/system/greetd.service.d
sudo tee /etc/systemd/system/greetd.service.d/colors.conf << 'EOF'
[Service]
ExecStartPre=/etc/tuigreet/set-colors.sh
EOF
sudo systemctl daemon-reload
```

5. Then reset greetd to apply the color changes:

```
sudo systemctl reset-failed greetd.service && sudo systemctl start greetd.service
```

