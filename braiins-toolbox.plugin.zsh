# CompDef Name
_comp_braiins-toolbox() {
  local -a commands
  local -a subcommands

  # Main commands without descriptions
  commands=(
    'scan' 'firmware' 'system' 'miner' 'tuner' 'cooling' 'self' '--version'
  )

  _arguments '1: :(${commands})' '*::subcommands:->subcmds'

  case $words[1] in
    firmware)
      subcommands=('install' 'uninstall' 'upgrade')
      ;;
    system)
      subcommands=('collect-data' 'reboot' 'locate-device' 'execute')
      ;;
    miner)
      subcommands=('start' 'stop' 'restart' 'pause' 'resume' 'set-pool-urls' 'set-mode')
      ;;
    tuner)
      subcommands=('target' 'set-dps' 'remove-profiles')
      ;;
    cooling)
      subcommands=('set-mode')
      ;;
    self)
      subcommands=('update')
      ;;
  esac

  if [[ -n $state && $state == subcmds ]]; then
    _describe 'subcommands' subcommands
  fi
}

compdef _comp_braiins-toolbox braiins-toolbox
