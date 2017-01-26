# LV2
. $ZYNTHIAN_DIR/zynthian-recipe/recipe/_zynth_lib.sh
cd $ZYNTHIAN_SW_DIR
zynth_git https://github.com/drobilla/lv2.git
if [ ${?} -ne 0 -o  "${build}" = "build" ]
then
	cd lv2
	./waf configure 
	./waf build
	sudo ./waf install
	zynth_build_request ${0} ready
fi
#	./waf clean
cd ..