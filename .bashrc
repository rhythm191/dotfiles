# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source local definitions
if [ -f .bashrc.local ]; then
	source .bashrc.local
fi


# User specific aliases and functions

# 2012.10.09 t.gotoh add start
gcd() { if [ "$1" != "" ] ; then cd ${APPS_HOME}/$1/webapp                   ; else echo "gcd FID{upro|udm2|udm3|udev}" ; fi ; }
alg() { if [ "$1" != "" ] ; then less +F ${APPS_HOME}/$1/log/application.log ; else echo "alg FID{upro|udm2|udm3|udev}" ; fi ; }
dlg() { if [ "$1" != "" ] ; then less +F ${APPS_HOME}/$1/log/debug.log       ; else echo "blg FID{upro|udm2|udm3|udev}" ; fi ; }
# 2012.10.09 t.gotoh add end
