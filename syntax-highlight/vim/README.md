### **How to Install Mya Syntax Highlighting in Vim (Windows and Linux)**

------------------------------------------------------------------------

#### **Windows**

1. **MakeFile**  
   - You can use the Makefile, but you need to edit it for the correct paths:  
     `make install_windows`

**Or:**

1. **Locate the Vim Installation**  
   - Typically, it is found here:  
     `C:\Program Files\Vim`.  
   - If you installed Vim in a different location, navigate there and proceed with the installation as described.

2. **Update the `_vimrc` File**  
   - Open the `_vimrc` file located at `C:\Program Files\Vim\_vimrc` with a text editor with administrator permissions.  
     (Right-click > "Run as Administrator").  
   - Copy the contents of the `_vimrc` file from the project repository and append them to the end of this file.

3. **Add Syntax and File Type Detection Files**  
   - Navigate to the appropriate directories within `C:\Program Files\Vim`.  
   - **For the syntax file (`mya.vim`)**:  
     - Copy the `mya.vim` file from the project's `syntax` folder to:  
       `C:\Program Files\Vim\vim91\syntax\`.  
     - If the `syntax` folder does not exist, create it.  
   - **For the file type detection file (`mya.vim`)**:  
     - Copy the `mya.vim` file from the project's `ftdetect` folder to:  
       `C:\Program Files\Vim\vim91\ftdetect\`.  
     - If the `ftdetect` folder does not exist, create it.  

4. **Test the Configuration**  
   - Open Vim and edit a file with the `.mya` extension. The file type and syntax highlighting should activate automatically.  

------------------------------------------------------------------------

#### **Linux**

1. **MakeFile**  
   - You can use the Makefile, but you need to edit it for the correct paths:  
     `make install_linux`

**Or**

1. **Locate the Vim Configuration Directory**  
   - Vim configuration files on Linux are usually found in:  
     - For a single user: `~/.vim`.  
     - For all users: `/usr/share/vim/vimfiles`.

2. **Update the `.vimrc` File**  
   - Open or edit the user's `.vimrc` file:  
     ```
     nano ~/.vimrc
     ```  
   - Copy the contents of the `_vimrc` file from the project repository and append them to the end.  

3. **Add Syntax and File Type Detection Files**  
   - Create the directories if they do not already exist:  
     ```
     mkdir -p ~/.vim/syntax ~/.vim/ftdetect
     ```  
   - Copy the files to the appropriate directories:  
     - **Syntax file (`mya.vim`)**:  
       ```
       cp path/to/project/syntax/mya.vim ~/.vim/syntax/
       ```  
     - **File type detection file (`mya.vim`)**:  
       ```
       cp path/to/project/ftdetect/mya.vim ~/.vim/ftdetect/
       ```  

4. **Test the Configuration**  
   - Open Vim and edit a file with the `.mya` extension:  
     ```
     vim example.mya
     ```  
   - Check if the file type is detected and syntax highlighting is working.  