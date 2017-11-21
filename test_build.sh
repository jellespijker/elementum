#/bin/sh

function test {
  echo "+ $@"
  "$@"
  local status=$?
  if [ $status -ne 0 ]; then
    exit $status
  fi
  return $status
}

GIT_VERSION=`cd ${GOPATH}/src/github.com/elgatito/elementum; git describe --tags`
cd $GOPATH
# set -x
test go build -ldflags="-w -X github.com/elgatito/elementum/util.Version=\"${GIT_VERSION}\"" github.com/elgatito/elementum
test cp -rf elementum $HOME/.kodi/addons/plugin.video.elementum/resources/bin/linux_x64/; cp -rf elementum $HOME/.kodi/userdata/addon_data/plugin.video.elementum/bin/linux_x64/
