FROM ubuntu:xenial
MAINTAINER raheel arif < raheelarifqayyum [at] gmail {dot} com>

# adding repositories
RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-get -y install python3-software-properties
RUN apt-get -y install python-software-properties
RUN add-apt-repository main
RUN add-apt-repository universe
RUN add-apt-repository restricted
RUN add-apt-repository multiverse



# Setting up environment as per : https://www.nsnam.org/wiki/Installation
RUN apt-get -y install dialog apt-utils
RUN apt-get -y install bash bridge-utils ebtables iproute libev4 libev-dev python
RUN apt-get -y install gcc g++ gdb valgrind python-dev mercurial python-setuptools git
RUN apt-get -y install qt4-dev-tools libqt4-dev
RUN apt-get -y install cmake libc6-dev libc6-dev-i386 g++-multilib
RUN apt-get -y install gdb valgrind 
RUN apt-get -y install gsl-bin libgsl2 libgsl-dev
RUN apt-get -y  install flex bison libfl-dev
RUN apt-get -y install tcpdump
RUN apt-get -y  install sqlite sqlite3 libsqlite3-dev
RUN apt-get -y  install libxml2 libxml2-dev
RUN apt-get -y install libgtk2.0-0 libgtk2.0-dev
RUN apt-get -y install vtun lxc
RUN apt-get -y install uncrustify
RUN apt-get -y install doxygen graphviz imagemagick
RUN apt-get -y install texlive texlive-extra-utils texlive-latex-extra texlive-font-utils texlive-lang-portuguese dvipng
RUN apt-get -y install python-sphinx dia 
RUN apt-get -y install python-pygraphviz python-kiwi python-pygoocanvas libgoocanvas-dev ipython
RUN apt-get -y install libboost-signals-dev libboost-filesystem-dev
RUN apt-get -y install openmpi-bin openmpi-common openmpi-doc libopenmpi-dev


# Cloning & installing NS3-all-in-one
RUN hg clone http://code.nsnam.org/ns-3-allinone
RUN cd ns-3-allinone && python download.py && python build.py --enable-examples --enable-tests
RUN cd ns-3-allinone/ns-3-dev && python test.py