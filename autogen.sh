#/bin/bash -X

# Search & replace in a file - _replace($find, $replace, $file) 
Replace() {
string=''
if [ "$2" != "undef" ];
then
	string=$2
fi
	
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*) 
   
	sed -e "s:$1:$string:g" $3 > "/tmp/$$.tmp" || _die "Failed for search and replace '$1' with '$string' in $3"
    	mv /tmp/$$.tmp $3 || _die "Failed to move /tmp/$$.tmp to $3"
	;;
    Darwin*) 
	sed "s:$1:$string:g" $3 > "/tmp/$$.tmp" || _die "Failed for search and replace '$1' with '$string' in $3"
    	mv /tmp/$$.tmp $3 || _die "Failed to move /tmp/$$.tmp to $3"
;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

}

source ./installer-properties.sh

# Create a copy of the PGInstaller.xml.in as PGInstaller.xml
# for BitRockInstallBuilder and replace values in the xml
# file as specified in installer-properties.sh.

if [ -f PGInstaller.xml ];
then
	rm -vf PGInstaller.xml || echo "Error removing PGInstaller.xml"
fi

cp PGInstaller.xml.in PGInstaller.xml || echo "Error creating installer.xml"

cp Installer_scripts/postgresql.service Installer_scripts/postgresql-$__PG_MAJOR_VERSION__.service
Replace __PG_MAJOR_VERSION__ $__PG_MAJOR_VERSION__ Installer_scripts/postgresql-$__PG_MAJOR_VERSION__.service || (echo "Error setting PG major version in postgresql-$__PG_MAJOR_VERSION__.service" && exit 1)
Replace __PG_MAJOR_VERSION__ $__PG_MAJOR_VERSION__ PGInstaller.xml || (echo "Error setting PG major version in PGInstaller.xml" && exit 1)
Replace __FULL_VERSION__ $__FULL_VERSION__ PGInstaller.xml || (echo "Error setting PG full version in PGInstaller.xml" && exit 1)
Replace __EXTRA_VERSION_STRING__ $__EXTRA_VERSION_STRING__ PGInstaller.xml || (echo "Error setting extra version string in PGInstaller.xml" && exit 1)
Replace __BUILD_NUMBER__ $__BUILD_NUMBER__ PGInstaller.xml || (echo "Error setting build number in PGInstaller.xml" && exit 1)
Replace __DEBUG__ $__DEBUG__ PGInstaller.xml || (echo "Error setting debug parameter in PGInstaller.xml" && exit 1)

if [ "$__RELEASE__" = "1" ];
then
Replace __DEV_TEST__ "" PGInstaller.xml || (echo "Error setting dev prefix in PGInstaller.xml" && exit 1)
else
Replace __DEV_TEST__ $__DEV_TEST__ PGInstaller.xml || (echo "Error setting dev prefix in PGInstaller.xml" && exit 1)
fi

echo "Completed succssfully"
