check:
	@echo "# Running ansible --check"
	@ansible-playbook -i "localhost," tests/main.yml --check -v

install:
	@echo "# Provisioning playbook file"
	@ansible-playbook -K -i "localhost, " tests/main.yml

