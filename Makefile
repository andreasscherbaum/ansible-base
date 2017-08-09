
# add the IP address, username and hostname of the target host here
IP=192.168.0.x
USERNAME=
HOSTNAME=



all:
	@echo ""
	@echo "Available targets:"
	@echo ""
	@echo "init:	will install basic requirements (will ask several times for a password)"
	@echo "install:	will install the host with what is defined in install-host.yml"
	@echo "update:	run OS updates"
	@echo "ssh:	jump ssh to host"
	@echo "common:	install basic Ansible role for hosts"
	@echo "clean:	delete all temporary files"
	@echo ""
	@echo ""
	@echo "      current used IP: ${IP}"
	@echo "    current used user: ${USERNAME}"
	@echo "current used hostname: ${HOSTNAME}"
	@echo ""


init:
	@echo ""
	@echo "will init host ${IP}, install ssh key and basic packages"
	@echo ""
	@echo "Note: NEVER use this step to init a host in an untrusted network!"
	@echo "Note: this will OVERWRITE any existing keys on the host!"
	@echo ""
	@echo "5 seconds to abort ..."
	@echo ""
	@sleep 5
	./init_host.sh "${IP}" "${USERNAME}"


install: common
	ansible-playbook --ssh-common-args='-o UserKnownHostsFile=./known_hosts' -i ${IP}, -u ${USERNAME} install-host.yml --extra-vars "hostname=${HOSTNAME}"


update:
	ansible-playbook --ssh-common-args='-o UserKnownHostsFile=./known_hosts' -i ${IP}, -u ${USERNAME} update-host.yml


common:
ifneq  (,$(wildcard roles/common))
	cd roles/common && git pull
else
	git clone https://github.com/andreasscherbaum/ansible-base.git roles/common
endif


ssh:
	ssh -o UserKnownHostsFile=./known_hosts ${USERNAME}@${IP}


clean:
	rm -rf roles/common ./known_hosts


.PHONY:	all init install update ssh common clean
