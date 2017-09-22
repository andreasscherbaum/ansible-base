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
	@echo "lxd:		create LXC/LXD containers"
	@echo "		https://github.com/andreasscherbaum/ansible-lxd"
	@echo "lxc-ssh:		Ansible connection plugin for LXD containers"
	@echo "		https://github.com/andreasscherbaum/ansible-lxc-ssh.git"


common:
ifneq  (,$(wildcard roles/common))
	cd roles/common && git pull
else
	git clone https://github.com/andreasscherbaum/ansible-common.git roles/common
	ln -s roles/common/ansible.mk ansible-common.mk
endif


gpdb4:
ifneq  (,$(wildcard roles/gpdb4))
	cd roles/gpdb4 && git pull
else
	git clone https://github.com/andreasscherbaum/gpdb-ansible.git roles/gpdb4
	ln -s roles/gpdb4/ansible.mk ansible-gpdb4.mk
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


lxc-ssh:
ifneq  (,$(wildcard connection_plugins/ansible-lxc-ssh))
	cd connection_plugins/ansible-lxc-ssh && git pull
else
	mkdir -p connection_plugins
	git clone https://github.com/andreasscherbaum/ansible-lxc-ssh.git connection_plugins/ansible-lxc-ssh
	ln -s connection_plugins/ansible-lxc-ssh/ansible.mk ansible-lxc-ssh.mk
	ln -s connection_plugins/ansible-lxc-ssh/lxc_ssh.py connection_plugins/lxc_ssh.py
endif
