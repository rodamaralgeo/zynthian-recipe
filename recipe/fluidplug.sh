# fluidplug
. $ZYNTHIAN_DIR/zynthian-recipe/recipe/_zynth_lib.sh
cd $ZYNTHIAN_SW_DIR/plugins
zynth_git https://github.com/falkTX/FluidPlug.git
read x
if [ ${?} -ne 0 -o  "${build}" = "build" ]
then
	cd FluidPlug
	tmp=`dirname ${ZYNTHIAN_PLUGINS_DIR}`
	quoted_ZYNTHIAN_PLUGINS_DIR=`quote_path ${tmp}`
	sed -i -- "s/-ffast-math -mtune=generic -msse -msse2 -mfpmath=sse -fdata-sections -ffunction-sections/${CPU} ${FPU}/" Makefile.mk
	sed -i -- "s/-msse -msse2/${CPU} ${FPU}/" Makefile.mk
	sed -i -- "s/^DESTDIR =/DESTDIR =${quoted_ZYNTHIAN_PLUGINS_DIR}/" Makefile
	sed -i -- 's/^PREFIX  = \/usr//' Makefile
	sed -i -- 's/\$(PREFIX)\/lib//' Makefile
	make
	sudo make install
	zynth_build_request ${0} ready
	make distclean
fi
#make clean
cd ..