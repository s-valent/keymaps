open app and put it in login items to start on startup.

example config (~/.config/keymaps):
```
ropt:
    say hello
opt + s:
    open -a Safari
opt + ,:
    open -a 'System Settings'
opt + c:
    open -a 'VS Code'
```

to apply new config:
```bash
killall Keymaps && open -a Keymaps
```
