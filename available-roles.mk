# this Makefile holds information about known Ansible roles
# it can be updated from the repository, while the main "Makefile" can be changed

available-roles:
	@echo ""
	@echo "Available roles:"
	@echo ""
	@echo "common:		a common Ansible role to install a host"
	@echo "		https://github.com/andreasscherbaum/ansible-common"
	@echo "gpdb-ansible:	an Ansible role to install Greenplum Database"
	@echo "		https://github.com/andreasscherbaum/gpdb-ansible"
	@echo "gluon:		build Freifunk gluon images"
	@echo "		https://github.com/Freifunk-Oberhavel/ansible-gluon"
	@echo "lxd:		create LXC/LXD containers"
	@echo "		https://github.com/andreasscherbaum/ansible-lxd"


common:
ifneq  (,$(wildcard roles/common))
	cd roles/common && git pull
else
	git clone https://github.com/andreasscherbaum/ansible-common.git roles/common
	ln -s roles/common/ansible.mk ansible-common.mk
endif


gpdb:
ifneq  (,$(wildcard roles/gpdb-ansible))
	cd roles/gpdb-ansible && git pull
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
