.PHONY: all clean init

CFG:=tower_cli.cfg
TOKEN:=token.json
VAULT:=./group_vars/all/99-vault.yml
EXAMPLE:=group_vars/all/00-defaults.yml

init: $(CFG) $(VAULT)
	ansible-playbook -i inventory.yml site.yml --ask-vault-password

$(TOKEN): $(CFG)

$(CFG): token_make.sh
	./token_make.sh

$(VAULT):
	@echo Do this:
	@echo cp $(EXAMPLE) $(VAULT)
	@echo
	@sed -n '/^#####/,/^#####/p' $(EXAMPLE)
	@echo "You need to create a vault file at $(VAULT)"
	@echo "Read instructions in $(EXAMPLE)"
	@false

clean:
	./token_delete.sh && echo
	rm -f $(VAULT) $(TOKEN) $(CFG)
