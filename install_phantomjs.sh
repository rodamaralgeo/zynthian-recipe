# phantomjs
cd "${HOME}/zynthian/zynthian-sw"
sudo apt-get install -y libfontconfig
git clone https://github.com/piksel/phantomjs-raspberrypi.git
chmod -x phantomjs-raspberrypi/bin/phantomjs
chmod 775 phantomjs-raspberrypi/bin/phantomjs
sudo ln -s "${HOME}/zynthian/zynthian-sw/phantomjs-raspberrypi/bin/phantomjs" /usr/bin/phantomjs
sudo ln -s "${HOME}/zynthian/zynthian-sw/phantomjs-raspberrypi/bin/phantomjs" /usr/local/bin/phantomjs
mkdir -p "${HOME}/zynthian/zynthian-sw/mod-ui/phantomjs-1.9.0-linux-x86_64/bin"
sudo ln -s /usr/bin/phantomjs "${HOME}/zynthian/zynthian-sw/mod-ui/phantomjs-1.9.0-linux-x86_64/bin"
