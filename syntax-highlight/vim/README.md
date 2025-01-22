### **Como instalar a syntax-highlight do Mya no Vim (Windows e Linux)**

------------------------------------------------------------------------

#### **Windows**

1. **MakeFile** 
   - Você pode usar o makefile, mas você tem que editar para os caminhos corretos:
   `make install_windows`

**Ou:**

1. **Localize a instalação do Vim**  
   - Normalmente elas devem estar aqui:  
     `C:\Program Files\Vim`.
   - Caso você tenha colocado a instalação do Vim em outro lugar, abra esse lugar e siga a instalação normalmente.

2. **Atualize o arquivo `_vimrc`**  
   - Abra o arquivo `_vimrc` em `C:\Program Files\Vim\_vimrc` com um editor de texto com permissões de administrador.  
     (Clique com o botão direito > "Executar como administrador").  
   - Copie o conteúdo do arquivo `_vimrc` do repositório do projeto e cole no final deste arquivo.

3. **Adicione os arquivos de sintaxe e detecção de tipo**  
   - Acesse as pastas apropriadas dentro de `C:\Program Files\Vim`.  
   - **Para o arquivo de sintaxe (`mya.vim`)**:  
     - Copie o arquivo `mya.vim` da pasta `syntax` do projeto para:  
       `C:\Program Files\Vim\vim91\syntax\`.
     - Se a pasta `syntax` não existir, crie-a.    
   - **Para o arquivo de detecção de tipo (`mya.vim`)**:  
     - Copie o arquivo `mya.vim` da pasta `ftdetect` do projeto para:  
       `C:\Program Files\Vim\vim91\ftdetect\`.  
     - Se a pasta `ftdetect` não existir, crie-a.  

4. **Teste a configuração**  
   - Abra o Vim e edite um arquivo com extensão `.mya`. O tipo de arquivo e o realce de sintaxe devem ser ativados automaticamente.  

------------------------------------------------------------------------

#### **Linux**

1. **MakeFile** 
   - Você pode usar o makefile, mas você tem que editar para os caminhos corretos:
   `make install_linux`

**Ou**

1. **Localize a pasta de configuração do Vim**  
   - As configurações do Vim no Linux geralmente ficam em:  
     - Para um único usuário: `~/.vim`.  
     - Para todos os usuários: `/usr/share/vim/vimfiles`.

2. **Atualize o arquivo `.vimrc`**  
   - Abra ou edite o arquivo `.vimrc` do usuário:  
     ```bash
     nano ~/.vimrc
     ```
   - Copie o conteúdo do arquivo `_vimrc` do repositório do projeto e cole no final.  

3. **Adicione os arquivos de sintaxe e detecção de tipo**  
   - Crie as pastas se ainda não existirem:  
     ```bash
     mkdir -p ~/.vim/syntax ~/.vim/ftdetect
     ```
   - Copie os arquivos para as pastas:  
     - **Arquivo de sintaxe (`mya.vim`)**:  
       ```bash
       cp path/to/project/syntax/mya.vim ~/.vim/syntax/
       ```
     - **Arquivo de detecção de tipo (`mya.vim`)**:  
       ```bash
       cp path/to/project/ftdetect/mya.vim ~/.vim/ftdetect/
       ```

4. **Teste a configuração**  
   - Abra o Vim e edite um arquivo com extensão `.mya`:  
     ```bash
     vim example.mya
     ```
   - Verifique se o tipo de arquivo foi detectado e o realce de sintaxe está funcionando.
