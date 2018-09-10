# Copyright
This Postgres Installer code is copyright under GNU General Public License v3.0
For more copyright details please refer to https://github.com/2ndQuadrant/postgres-installer/blob/master/LICENSE

# Overview
Postgres Installer is a multi-platform graphical and text mode one click installer. Its code is written in bitrock and tested with InstallBuilder16, You can generate installers for all 3 platforms i,e
- Windows
- MacOS
- Linux

To know more about Postgres Installer and its features please refer to postgres Installer page in our website:
https://www.2ndquadrant.com/en/resources/postgresql-installer-2ndquadrant 

# Usage
This section will walk you through to generate a new installer please follow the steps mentioned below
In this example we are going to generate an installer for Linux(PostgreSQL 10.5)
Note: please make sure that you change/modify commands according to your needs 
- Download required PostgreSQL source code from	https://www.postgresql.org/ftp/source/
    - wget https://ftp.postgresql.org/pub/source/v10.5/postgresql-10.5.tar.gz
- Create directory with name of major version of the PostgreSQL
    - mkdir 10
- Build PostgreSQL with your required features, and install it in directory which you have created in step 2
- Clone git repository
    - git clone https://github.com/2ndQuadrant/postgres-installer.git
- Create new directory(Builds) on root of the Postgres Installer code
    - mkdir Builds
- Create new sub-directories inside Builds directory(this will reflect platforms for which you are going to generate a new installer. Folder names should be the same as bellow) i,e
    - Windows
    - Linux
    - OSX
- Copy your build inside particular folder(We will copy it inside Linux because we are going to generate a Linux installer)
    - cp -r 10/  Builds/Linux/
Note: If you do not put build in specific folder then installbuilder will fail to generate installer.
- Open  installer-properties.sh file and modify it as per your needs
    - vim installer-properties.sh
- Run autogen.sh this will generate PGInstaller.xml file
    - ./autogen.sh
- Generate your installer for the choice of your platform using PGInstaller.xml file 
    - (path-to-install-builder)bin/builder build PGInstaller.xml linux --verbose
At the end you have your Postgres Installer in output directory of installbuilder

# Bugs and feedback
For bug report and feedback please email us at pginstaller@2ndquadrant.com or use contact form on our Postgres Installer page:
https://www.2ndquadrant.com/en/resources/postgresql-installer-2ndquadrant/
