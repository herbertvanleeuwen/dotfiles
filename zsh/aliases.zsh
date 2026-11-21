# ZSH Aliases

alias startvenv="source ./venv/bin/activate"
alias pi="ssh pi@192.168.1.190"

alias pycharm="/Applications/PyCharm.app/Contents/MacOS/pycharm"
# Home server (perzik-hq, 192.168.1.147 - see ~/.ssh/config "home-server")
alias hs="ssh home-server"                                   # log in
alias hsps="ssh home-server 'docker ps --format \"table {{.Names}}\t{{.Status}}\"'"  # what's running
alias hsvpn="ssh home-server 'docker exec wireguard wg show'"  # VPN peers + last handshake
hslogs() { ssh -t home-server "docker logs -f --tail 100 ${1:?usage: hslogs <container>}"; }  # follow a container's logs
hsrestart() { ssh home-server "docker restart ${1:?usage: hsrestart <container>}"; }        # restart a container
alias paperless="open http://192.168.1.147:8010"
alias budget="open http://192.168.1.147:5006"
alias portainer="open https://192.168.1.147:9443"
alias proxymanager="open http://192.168.1.147:81"
alias audiobooks="open http://192.168.1.147:13378"
# Copy an audiobook folder to the server: hsbook "~/Downloads/Book Title" "Author Name"
hsbook() {
  [[ -d "$1" && -n "$2" ]] || { echo 'usage: hsbook <book-folder> "<Author Name>"'; return 1; }
  ssh home-server "mkdir -p \"/mnt/data/media/audiobooks/$2\"" &&
  rsync -ah --progress "$1" "home-server:'/mnt/data/media/audiobooks/$2/'"
}
