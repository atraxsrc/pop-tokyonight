# Pop_os-theme-changer
Bypass libadwaita on elementary apps

## Disclaimer!
Use this script at your own risk! (Althought it works flawlessly)

## How it works?
It just create simlinks between .themes and .config folder with assets and GTK 4.0 theme CSS files.

## Requirements
Theme must be prepared for GTK 4.0.<br/>
Go to ``~/.config/gtk-4.0`` directories.

## Usage
1. Download Python script from git:
```
git clone https://github.com/atraxsrc/Pop_os-theme-changer.git
cd Pop_os-theme-changer
```
2. Add executable permissions to file:
```bash
chmod +x poplib.py
```
3. Run script:
```python
python3 poplib.py
```

## How to reset to default Adwaita theme?
Run script with --reset parameter:
```python
python3 poplib.py --reset
```
