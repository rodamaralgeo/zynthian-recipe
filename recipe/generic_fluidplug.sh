# generic_fluidplug
. $ZYNTHIAN_DIR/zynthian-recipe/recipe/_zynth_lib.sh
cd $ZYNTHIAN_SW_DIR/plugins
sudo apt-get install -y --no-install-recommends libipc-system-simple-perl templatetoolkit-perl
zynth_git https://github.com/dcoredump/GenericFluidPlug
if [ ${?} -ne 0 -o  "${build}" = "build" ]
then
	zynth_build_request clear
	cd GenericFluidPlug
	git checkout generic
	zynth_build_request ready
	cd ..
fi
