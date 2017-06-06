# guitarix
. $ZYNTHIAN_DIR/zynthian-recipe/recipe/_zynth_lib.sh
apt-get install -y libglibmm-2.4-dev libeigen3-dev libzita-convolver-dev libzita-resampler-dev libglibmm-2.4-dev
cd $ZYNTHIAN_SW_DIR/plugins
#zynth_git http://git.code.sf.net/p/guitarix/git guitarix
zynth_git https://github.com/brummer10/GxPlugins.lv2.git guitarix
if [ ${?} -ne 0 -o  "${build}" = "build" ]
then
	zynth_build_request ready
	cd guitarix
	#cd guitarix/trunk
	#git checkout 589dd79b2d7ad2b5e0db4c18c25279d6e94a1552
        #if [ "${build}" = "clean" ]
        #then
	#	./waf clean
        #fi
	#./waf configure --lv2-only --lv2dir=$ZYNTHIAN_PLUGINS_DIR/lv2 --no-avahi --no-bluez --no-ladspa --no-new-ladspa --shared-lib --optimization --download --no-lv2-gui --no-faust
	#./waf build
	#sudo ./waf install
	git submodule init
	git submodule update
        for i in `find . -name "Makefile"`
        do
		sed -i -- "s,-march=armv7-a -mfpu=vfpv3,${CPU} ${FPU},g" $i
	done
	make mod
	make install mod INSTALL_DIR=${ZYNTHIAN_PLUGINS_DIR}/lv2
	zynth_build_request ready
	#./waf clean
	cd ..
fi
