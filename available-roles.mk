# this Makefile holds information about known Ansible roles
# it can be updated from the repository, while the main "Makefile" can be changed

available-roles:
	@echo ""
	@echo "Available roles:"
	@echo ""
	@echo "common:		a common Ansible role to install a host"
	@echo "		https://github.com/andreasscherbaum/ansible-common"
	@echo "gpdb4:		an Ansible role to install Greenplum Database v4"
	@echo "		https://github.com/andreasscherbaum/gpdb-ansible"
	@echo "gluon:		build Freifunk gluon images"
	@echo "		https://github.com/Freifunk-Oberhavel/ansible-gluon"
	@echo "lxd:		an Ansible role for installing LXD"
	@echo "		https://github.com/andreasscherbaum/ansible-lxd"
	@echo "lxd-container:	create LXC/LXD containers"
	@echo "		https://github.com/andreasscherbaum/ansible-lxd-container"
	@echo "lxc-ssh:		Ansible connection plugin for LXD containers"
	@echo "		https://github.com/andreasscherbaum/ansible-lxc-ssh.git"
	@echo "buildclient:	Several Ansible roles for installing PG & GPDB Buildclient"
	@echo "		https://github.com/andreasscherbaum/buildfarm-client"
	@echo "bind9:		a bind9 role which also manages domains"
	@echo "		https://github.com/andreasscherbaum/ansible-bind9"


common:
ifneq  (,$(wildcard roles/common))
	cd roles/common && git pull
else
	git clone https://github.com/andreasscherbaum/ansible-common.git roles/common
	ln -s roles/common/ansible.mk ansible-common.mk
endif


gpdb4:
ifneq  (,$(wildcard roles/gpdb-ansible))
	cd roles/gpdb4 && git pull
else
	git clone https://github.com/andreasscherbaum/gpdb-ansible.git roles/gpdb-ansible
	ln -s roles/gpdb-ansible/ansible.mk ansible-gpdb-ansible.mk
endif


gluon:
ifneq  (,$(wildcard roles/gluon))
	cd roles/gluon && git pull
else
	git clone https://github.com/Freifunk-Oberhavel/ansible-gluon.git roles/gluon
	ln -s roles/gluon/ansible.mk ansible-gluon.mk
endif


lxd:
ifneq  (,$(wildcard roles/lxd))
	cd roles/lxd && git pull
else
	git clone https://github.com/andreasscherbaum/ansible-lxd.git roles/lxd
	ln -s roles/lxd/ansible.mk ansible-lxd.mk
endif


lxd-container:
ifneq  (,$(wildcard roles/lxd-container))
	cd roles/lxd-container && git pull
else
	git clone https://github.com/andreasscherbaum/ansible-lxd-container.git roles/lxd-container
	ln -s roles/lxd-container/ansible.mk ansible-lxd-container.mk
endif


lxc-ssh:
ifneq  (,$(wildcard connection_plugins/ansible-lxc-ssh))
	cd connection_plugins/ansible-lxc-ssh && git pull
else
	mkdir -p connection_plugins
	git clone https://github.com/andreasscherbaum/ansible-lxc-ssh.git connection_plugins/ansible-lxc-ssh
	ln -s connection_plugins/ansible-lxc-ssh/ansible.mk ansible-lxc-ssh.mk
	cd connection_plugins && ln -s ansible-lxc-ssh/lxc_ssh.py lxc_ssh.py
endif


buildclient:
ifneq  (,$(wildcard roles/buildclient))
	cd roles/epel && git pull
	cd roles/gpdb5-dev && git pull
	cd roles/git2 && git pull
	cd roles/buildclient && git pull
else
	git clone https://github.com/geerlingguy/ansible-role-repo-epel.git roles/epel
	git clone https://github.com/andreasscherbaum/ansible-gpdb5-dev roles/gpdb5-dev
	git clone https://github.com/andreasscherbaum/ansible-git2.git roles/git2
	git clone https://github.com/andreasscherbaum/ansible-buildclient.git roles/buildclient
	ln -s roles/buildclient/ansible.mk ansible-buildclient.mk
endif


bind9:
ifneq  (,$(wildcard roles/bind9))
	cd roles/bind9 && git pull
else
	git clone https://github.com/andreasscherbaum/ansible-bind9.git roles/bind9
	ln -s roles/bind9/ansible.mk ansible-bind9.mk
endif
