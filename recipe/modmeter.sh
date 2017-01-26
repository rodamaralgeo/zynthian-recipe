# modmeter
. $ZYNTHIAN_DIR/zynthian-recipe/recipe/_zynth_lib.sh
cd $ZYNTHIAN_SW_DIR/plugins
zynth_git https://github.com/x42/modmeter.lv2.git
if [ ${?} -ne 0 -o  "${1}" = "build" ]
then
	cd modmeter.lv2
	quoted_ZYNTHIAN_PLUGINS_DIR=`quote_path ${ZYNTHIAN_PLUGINS_DIR}`
	sed -i -- "s/-msse -msse2 -mfpmath=sse /${CPU} ${FPU}/" Makefile
	sed -i -- "s/LV2DIR ?= \$(PREFIX)\/\$(LIBDIR)\/lv2/LV2DIR ?= $quoted_ZYNTHIAN_PLUGINS_DIR/" Makefile
	make MOD=1
	sudo make install MOD=1
fi
#make clean
cd ..
