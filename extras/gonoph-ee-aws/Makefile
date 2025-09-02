.PHONY: all clean service

CONFIGS:= ansible.cfg bindep.txt execution-environment.yml requirements.txt requirements.yml

all: context

clean:
	rm -rf .context-built context

context: .context-built

.context-built: $(CONFIGS)
	if diff -q <(grep ^token= ansible.cfg) <(grep ^token= ansible.cfg.example) ; then \
		echo "ansible.cfg should have token= configured!" >&2; \
		false ; else true ; fi
	rm -rf context
	ansible-builder build -v 3 -t localhost:5000/ansible/gonoph-ee-aws:latest
	touch $@

ansible.cfg: ansible.cfg.example
	cp $< $@

service: /etc/systemd/system/tower-registry.service
	@echo "testing that registry mount exists"
	test -d /mnt/registry
	@echo "copying service file to /etc/systemd/system/tower-registry.service..."
	@echo "+ if this fails, you probably need to run as root"
	cp -v tower-registry.service /etc/systemd/system/tower-registry.service
	systemctl daemon-reload
	systemctl start tower-registry.service
