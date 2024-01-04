# My Configuration
---

```bash
sh updater.sh
```

Load nvm
```bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
```

Deactivate conda on shell start
```bash
conda config --set auto_activate_base false
```