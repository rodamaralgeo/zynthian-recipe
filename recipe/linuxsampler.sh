# linuxsampler
. $ZYNTHIAN_DIR/zynthian-recipe/recipe/_zynth_lib.sh
cd $ZYNTHIAN_SW_DIR/plugins
sudo apt-get install -y subversion libtool flex bison
zynth_svn https://svn.linuxsampler.org/svn/libgig/trunk libgig
if [ "${?}" -ne 0 ]
then
	changed="1"
fi
zynth_svn https://svn.linuxsampler.org/svn/liblscp/trunk liblscp
if [ "${?}" -ne 0 ]
then
	changed="1"
fi
zynth_svn https://svn.linuxsampler.org/svn/linuxsampler/trunk linuxsampler
if [ "${?}" -ne 0 ]
then
	changed="1"
fi
if [ "x${changed}" = "x1" -o "x${build}" != "x" ]
then
	zynth_build_request clear
	# libgig
	cd libgig
	if [ "${build}" = "clean" ]
	then
		make clean
	fi
	libtoolize --force
	aclocal
	autoheader
	automake --force-missing --add-missing
	autoconf 
	./configure
	make
	sudo make install
	# liblscp
	cd ../liblscp
	if [ "${build}" = "clean" ]
	then
		make clean
	fi
	libtoolize --force
	aclocal
	autoheader
	automake --force-missing --add-missing
	autoconf 
	./configure
	make
	sudo make install
	# linuxsampler
	cd ../linuxsampler
	libtoolize --force
	aclocal
	autoheader
	automake --force-missing --add-missing
	autoconf
	./configure
	cd src/scriptvm
	yacc -o parser parser.y
	cd ../..
	if [ ${RASPI} ]
	then
		git clone https://github.com/coolder/rpi_linuxsampler_patch.git
		patch -p0 <rpi_linuxsampler_patch/atomic.h.diff 
		cd src/common/
		patch <../../rpi_linuxsampler_patch/RTMath.cpp.diff
		cd ../..
	fi
	make
	sudo make install
	sudo mv /usr/local/lib/lv2/linuxsampler.lv2 "${ZYNTHIAN_PLUGINS_DIR}/lv2"
	zynth_build_request ready 
	cd ../..
fi
