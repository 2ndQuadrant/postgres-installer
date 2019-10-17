#!/bin/bash

PLPackage=_PLPACKAGE_
PGHome=_PGHOME_
PGPort=_PGPORT_


PGServerController() {

        if [[ "$1" == "start" ]]
        then

                if [[ -d $PLPackage ]]
                then

			# Export PATHS for PLs
			export PATH=$PLPackage/Perl-5.26/bin;$PLPackage/Tcl-8.6/bin:$PATH
			export LD_LIBRARY_PATH=$PLPackage/Perl-5.26/lib/CORE;$PLPackage/Tcl-8.6/lib:$LD_LIBRARY_PATH
			export PERL5LIB=$PLPackage/Perl-5.26/lib;

			"$PGHome"/bin/postgres -D "$PGHome"/data -p "$PGPort"

                        return
                else
                        echo "Warning: Starting server without PL Languages support ..."
                fi
        fi

	"$PGHome"/bin/postgres -D "$PGHome"/data -p "$PGPort"
}


case "$1" in
start)


        PGServerController $1
;;


*)
    echo "Usage: postgresql {start|stop|status|restart}"
    exit 1
esac

exit 0

