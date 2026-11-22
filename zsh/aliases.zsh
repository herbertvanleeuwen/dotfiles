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
alias portainer="open https://portainer.home.herbertvanleeuwen.com"
alias audiobooks="open https://audiobooks.home.herbertvanleeuwen.com"
# Copy an audiobook folder to the server: hsbook "~/Downloads/Book Title" "Author Name"
hsbook() {
  [[ -d "$1" && -n "$2" ]] || { echo 'usage: hsbook <book-folder> "<Author Name>"'; return 1; }
  ssh home-server "mkdir -p \"/mnt/data/media/audiobooks/$2\"" &&
  rsync -ah --progress "$1" "home-server:'/mnt/data/media/audiobooks/$2/'"
}
alias bookrequests="open https://books.home.herbertvanleeuwen.com"   # Bindery: request audiobooks
alias sabnzbd="open https://sabnzbd.home.herbertvanleeuwen.com"        # Usenet download queue
alias prowlarr="open https://prowlarr.home.herbertvanleeuwen.com"       # Usenet indexers
alias sso="open https://auth.home.herbertvanleeuwen.com"              # authentik: one login for the home server apps
alias adguard="open https://dns.home.herbertvanleeuwen.com"          # AdGuard Home (DNS, ad blocking)
alias traefik="open https://traefik.home.herbertvanleeuwen.com/dashboard/"
