# Target directories
VIM_SYNTAX_WINDOWS = C:\Program Files\Vim\vim91\syntax
VIM_FTPLUGIN_WINDOWS = C:\Program Files\Vim\vim91\ftplugin
VIMRC_WINDOWS = C:\Program Files\Vim\_vimrc

VIM_SYNTAX_LINUX = ~/.vim/syntax
VIM_FTPLUGIN_LINUX = ~/.vim/ftplugin
VIMRC_LINUX = ~/.vimrc

# Project files
SYNTAX_FILE = syntax/mya.vim
FTPLUGIN_FILE = ftplugin/mya.vim
VIMRC_FILE = _vimrc

# Rules
.PHONY: install_windows install_linux uninstall

install_windows:
	@echo "Installing on Windows..."
	@if not exist "$(VIM_SYNTAX_WINDOWS)" mkdir "$(VIM_SYNTAX_WINDOWS)"
	@if not exist "$(VIM_FTPLUGIN_WINDOWS)" mkdir "$(VIM_FTPLUGIN_WINDOWS)"
	@copy /Y $(SYNTAX_FILE) "$(VIM_SYNTAX_WINDOWS)\" 
	@copy /Y $(FTPLUGIN_FILE) "$(VIM_FTPLUGIN_WINDOWS)\" 
	@type $(VIMRC_FILE) >> "$(VIMRC_WINDOWS)"
	@echo "Installation completed on Windows."

install_linux:
	@echo "Installing on Linux..."
	mkdir -p $(VIM_SYNTAX_LINUX)
	mkdir -p $(VIM_FTPLUGIN_LINUX)
	cp -f $(SYNTAX_FILE) $(VIM_SYNTAX_LINUX)/
	cp -f $(FTPLUGIN_FILE) $(VIM_FTPLUGIN_LINUX)/
	cat $(VIMRC_FILE) >> $(VIMRC_LINUX)
	@echo "Installation completed on Linux."

uninstall:
	@echo "Removing configurations..."
	-rm -f $(VIM_SYNTAX_LINUX)/mya.vim $(VIM_FTPLUGIN_LINUX)/mya.vim
	-rm -f "$(VIM_SYNTAX_WINDOWS)\mya.vim" "$(VIM_FTPLUGIN_WINDOWS)\mya.vim"
	@echo "Configurations removed."
