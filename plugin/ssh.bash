myauthme() {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
      < ~/.ssh/id_dsa.pub
}
