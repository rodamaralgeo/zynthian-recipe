# phantomjs
cd "${HOME}/zynthian/zynthian-sw"
sudo apt-get install -y libfontconfig
git clone https://github.com/piksel/phantomjs-raspberrypi.git
chmod -x phantomjs-raspberrypi/bin/phantomjs
chmod 775 phantomjs-raspberrypi/bin/phantomjs
sudo ln -s /home/pi/zynthian/zynthian-sw/phantomjs-raspberrypi/bin/phantomjs /usr/bin/phantomjs
sudo ln -s /home/pi/zynthian/zynthian-sw/phantomjs-raspberrypi/bin/phantomjs /usr/local/bin/phantomjs
mkdir -p /home/pi/zynthian/zynthian-sw/mod-ui/phantomjs-1.9.0-linux-x86_64/bin
ln -s /home/pi/zynthian/zynthian-sw/phantomjs-raspberrypi/bin/phantomjs /home/pi/zynthian/zynthian-sw/mod-ui/phantomjs-1.9.0-linux-x86_64/bin
