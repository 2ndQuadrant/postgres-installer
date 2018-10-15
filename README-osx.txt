Welcome to Postgres Installer by 2ndQuadrant
============================================

Postgres Installer by 2ndquadrant is a GUI based, user-friendly installer for PostgreSQL that is digitally signed and certified by 2ndQuadrant. The installer is currently available for PostgreSQL versions 9.5, 9.6, 10 and 11(beta) and has the ability to run in graphical, command line, or quiet installation modes for  Windows, OSX and Linux.


Features
========

Postgres Installer comes with features listed below. In addition to these, many are in pipeline and will be available in upcoming releases.

. OmniDB support
. PostGIS support
. OpenSSL support
. Python3 support
. Zlib support
. LDAP support 
. Kerberos support 
. ICU support
. Perl support

For more details please visit.
https://www.2ndquadrant.com/en/resources/PostgreSQL-installer-2ndquadrant/


Controlling PostgreSQL service
==============================

Once installer has completed installation successfully, following information should hold true for your platform.

. Service name: __SRVC_NAME__

Open terminal and type following commands

. Start: sudo launchctl start  "__SRVC_NAME__"
. Stop:  sudo launchctl stop   "__SRVC_NAME__"


Connect to PostgreSQL via psql
==============================

. Open terminal
. Change directory: cd  __PGHOME__/bin
. ./psql -U postgres -d postgres

Type in your 'postgres' superuser password. This should be the same as supplied during installation on Database Superuser Password screen
Once connected, you can key in SQL queries as you like. Please refer to psql documentation for help on using psql client.

https://www.postgresql.org/docs/9.4/static/app-psql.html


Connect to PostgreSQL via OmniDB
================================

OmniDB is an interactive and powerful, yet lightweight, browser-based database management tool. OmniDB allows users to manage multiple databases in a unified workspace with a user-friendly and fast-performing interface.  Despite its light design, OmniDB is a reliable and comprehensive web tool with many facilitating characteristics to easily add, edit and manage multiple databases

Usage instructions
==================

. Change directory to: __OMNIHOME__
. Double click on 'omnidb.app' to start OmniDB

For detailed instructions on usage please visit: https://omnidb.org/en/documentation-en/

For more OmniDB details and features please visit
. https://www.2ndquadrant.com/en/resources/omnidb/
. https://www.omnidb.org/en/


Getting started with PostGIS
============================

PostGIS is a spatial database extender for PostgreSQL object-relational database. It add support for geographic objects allowing location queries to be run in SQL.

Some of the extensions required for PostGIS.

. CREATE EXTENSION postgis;
. CREATE EXTENSION fuzzystrmatch; -- needed for postgis_tiger_geocoder
                                  -- optional used by postgis_tiger_geocoder,
                                  -- or can be used standalone
. CREATE EXTENSION postgis_tiger_geocoder;
. CREATE EXTENSION postgis_topology;

NOTE: GDAL DATA will need to be configured manually based on where you have placed it. Path to default GDAL DATA directory is listed below:

. __PGHOME__/gdal

Set PostGIS DATA directory path by running following command inside PSQL.

. set postgis.gdal_datapath = '__PGHOME__/gdal';

Please refer to PostGIS documentation here (https://postgis.net/docs/postgis_gdal_datapath.html) on how you can configure GDAL DATA directory for your platform.

Please visit PostGIS official website for more details about PostGIS.
https://postgis.net/


Introduction to ICU
===================
ICU stands for International Components for Unicode. It provide the ability to handle postgres database and run queries on your local language i,e.

. English
. French
. German
. Urdu
. Italian
. Hindi

And many more of course. You can run query bellow to see which languages are supported

. select * from pg_collation;


Introduction to Perl
====================
PL/Perl (Procedural Language/Perl) is a procedural language supported by the PostgreSQL RDBMS.
PL/Perl, as an imperative programming language, allows more control than the relational algebra of SQL. Programs created in the PL/Perl language are called functions and can use most of the features that the Perl programming language provides,

Setting up Perl
===============

. Open terminal
. Shift to postgres user. su - postgres

. Set following paths.
  export PATH=$PATH:__INSTALLDIR__/pl-languages/perl-5.26/bin
  export LD_LIBRARY_PATH=__INSTALLDIR__/pl-languages/perl-5.26/lib/CORE
  export PERL5LIB=__INSTALLDIR__/pl-languages/perl-5.26/lib

. Restart the postgreSQL service
. Connect to 'psql'
. Run query 'CREATE LANGUAGE plperl;'

And you are done now you can create any function that you want


Bug Reports and Feedback
========================
For bug reports and  feedback, please contact via pginstaller@2ndquadrant.com or use our contact form on our Postgres installer page:
https://www.2ndquadrant.com/en/resources/postgresql-installer-2ndquadrant/


Contact Us
==========

2ndQuadrant Ltd

7200 The Quorum
Oxford Business Park North
Oxford, OX4 2JZ
United Kingdom

Phone: +44 870 766 7756
Fax:   +44 870 838 1077
Email: info@2ndQuadrant.com

For detailed queries please visit our website: https://2ndQuadrant.com
