
ANSIBLE_EXTRA_ARGS=

test:
	@docker build -t ansible-charemma -f tests/Dockerfile . --build-arg ANSIBLE_EXTRA_ARGS=$(ANSILBE_EXTRA_ARGS)
	
test-dotfiles:
	docker build -t ansible-charemma-dotfiles -f tests/Dockerfile . --build-arg ANSIBLE_EXTRA_ARGS="-t dotfiles"
