# Diretórios de destino
VIM_SYNTAX_WINDOWS = C:\Program Files\Vim\vim91\syntax
VIM_FTDETECT_WINDOWS = C:\Program Files\Vim\vim91\ftdetect
VIMRC_WINDOWS = C:\Program Files\Vim\_vimrc

VIM_SYNTAX_LINUX = ~/.vim/syntax
VIM_FTDETECT_LINUX = ~/.vim/ftdetect
VIMRC_LINUX = ~/.vimrc

# Arquivos do projeto
SYNTAX_FILE = syntax/mya.vim
FTDETECT_FILE = ftdetect/mya.vim
VIMRC_FILE = _vimrc

# Regras
.PHONY: install_windows install_linux clean

install_windows:
	@echo "Instalando no Windows..."
	@if not exist "$(VIM_SYNTAX_WINDOWS)" mkdir "$(VIM_SYNTAX_WINDOWS)"
	@if not exist "$(VIM_FTDETECT_WINDOWS)" mkdir "$(VIM_FTDETECT_WINDOWS)"
	@copy /Y $(SYNTAX_FILE) "$(VIM_SYNTAX_WINDOWS)\"
	@copy /Y $(FTDETECT_FILE) "$(VIM_FTDETECT_WINDOWS)\"
	@type $(VIMRC_FILE) >> "$(VIMRC_WINDOWS)"
	@echo "Instalação concluída no Windows."

install_linux:
	@echo "Instalando no Linux..."
	mkdir -p $(VIM_SYNTAX_LINUX)
	mkdir -p $(VIM_FTDETECT_LINUX)
	cp -f $(SYNTAX_FILE) $(VIM_SYNTAX_LINUX)/
	cp -f $(FTDETECT_FILE) $(VIM_FTDETECT_LINUX)/
	cat $(VIMRC_FILE) >> $(VIMRC_LINUX)
	@echo "Instalação concluída no Linux."

clean:
	@echo "Removendo configurações..."
	-rm -f $(VIM_SYNTAX_LINUX)/mya.vim $(VIM_FTDETECT_LINUX)/mya.vim
	-rm -f "$(VIM_SYNTAX_WINDOWS)\mya.vim" "$(VIM_FTDETECT_WINDOWS)\mya.vim"
	@echo "Configurações removidas."
