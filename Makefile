HOSTNAME := $(shell hostname -s)
LN_FLAGS := -sfn
BREW := $(shell command -v brew 2> /dev/null)

symlinks := gitconfig \
		   gitignore \
		   lftprc \
		   mbsyncrc \
		   sqliterc \
		   tmux.conf \
		   zlogin \
		   zsh_aliases \
		   zshenv \
		   zshrc

repos := zsh-users/zsh-history-substring-search \
		   zsh-users/zsh-syntax-highlighting \
		   zsh-users/zsh-completions \

.PHONY: $(symlinks) $(repos)

COLOR := \033[32;01m
NO_COLOR := \033[0m

all: install

help:
	@echo "Makefile for installing dotfiles"
	@echo
	@echo "Create symlinks:"
	@echo "   $(COLOR)make install$(NO_COLOR)"
	@echo
	@echo "Install or upgrade zsh extras:"
	@echo "   $(COLOR)make zsh-extras$(NO_COLOR)"
	@echo
	@echo "Maintenance:"
	@echo "   $(COLOR)make print-dead$(NO_COLOR)	Print dead symlinks"
	@echo "   $(COLOR)make clean-dead$(NO_COLOR)	Delete dead symlinks"
	@echo "   $(COLOR)make update$(NO_COLOR)		Alias for git pull"

# Shell environment

install: $(symlinks)

$(symlinks):
	test -e $(CURDIR)/$@ && ln $(LN_FLAGS) $(CURDIR)/$@ ~/.$@

zsh-extras: zsh-users/zsh-history-substring-search zsh-users/zsh-syntax-highlighting zsh-users/zsh-completions

$(repos):
ifdef BREW
	brew install $(notdir $@)
else
	mkdir -p $(HOME)/.local/share
	test ! -d $(HOME)/.local/share/$(notdir $@) || git -C $(HOME)/.local/share/$(notdir $@) pull --rebase
	test -d $(HOME)/.local/share/$(notdir $@) || git clone -q https://github.com/$@.git $(HOME)/.local/share/$(notdir $@)
endif

# Maintenance

print-dead:
	find ~ -maxdepth 1 -name '.*' -type l -exec test ! -e {} \; -print

clean-dead:
	find ~ -maxdepth 1 -name '.*' -type l -exec test ! -e {} \; -delete

update:
	git pull --rebase --quiet
