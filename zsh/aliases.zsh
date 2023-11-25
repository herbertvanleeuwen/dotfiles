# ZSH Aliases

alias startvenv="source ./venv/bin/activate"
alias pi="ssh pi@192.168.1.190"

# Require Virtual environment for pip command 
export PIP_REQUIRE_VIRTUALENV=true

# 
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

gpip3() {
    PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}