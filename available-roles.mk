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

