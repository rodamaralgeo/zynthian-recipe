# helm
. $ZYNTHIAN_DIR/zynthian-recipe/recipe/_zynth_lib.sh
cd $ZYNTHIAN_SW_DIR/plugins
sudo apt-get install -y libxcursor-dev libxinerama-dev libcurl4-openssl-dev
zynth_git https://github.com/mtytel/helm.git
if [ ${?} -ne 0 -o  "${build}" = "build" ]
then
	zynth_build_request clear
	cd helm
	sed -i -- "s/SDEBCXXFLAGS := \$(shell dpkg-buildflags --get CXXFLAGS)/SDEBCXXFLAGS = -O2 -fstack-protector-strong -Wformat -Werror=format-security ${CPU} ${FPU}/" Makefile
	sed -i -- "s/PDEBCXXFLAGS := \$(shell dpkg-buildflags --get CXXFLAGS)/PDEBCXXFLAGS = -O2 -fstack-protector-strong -Wformat -Werror=format-security ${CPU} ${FPU}/" Makefile
	sed -i -- "s/-march=armv8-a -mtune=cortex-a53/${CPU} ${FPU}/" Makefile
	make lv2
	#sudo make install
	mkdir -p "${ZYNTHIAN_PLUGINS_DIR}"/lv2/helm.lv2
	cp builds/linux/LV2/helm.lv2/* "${ZYNTHIAN_PLUGINS_DIR}"/lv2/helm.lv2
	zynth_build_request ready
	make clean
	cd ..
fi
