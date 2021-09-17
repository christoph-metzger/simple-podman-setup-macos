export PODMAN_WORKING_DIR=

podmanMountFile="$VAGRANT_CWD/mounted"

set_podman_working_dir() {
  if [[ -d "$1" ]]; then
    echo "$1" > "$podmanMountFile"
    PODMAN_WORKING_DIR="$1"
  else
    echo "$1 is not a directory"
    exit 1
  fi
}

read_podman_working_dir() {
  if [[ -e "$podmanMountFile" ]]; then
    PODMAN_WORKING_DIR=$(cat "$podmanMountFile")
  fi
}

remove_mount_file() {
  if [[ -e "$podmanMountFile" ]]; then
    rm "$podmanMountFile"
  fi
}
