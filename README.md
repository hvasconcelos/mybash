## Advanced features for your Bash Shell

* Profiles: Manage the bash shell enviromment for each machine
* Shortcuts: Create shortcuts for important filesystems paths
* Aliases: Aliases for your most important tools

### To Install 
    
    git clone git@github.com:hvasconcelos/mybash.git
    cd mybash 
    ln -sf `$pwd`/.bashrc ~/.bashrc
    ln -sf `$pwd`/.bash ~/.bash

### Create a new bash Profile 

    > .bash/profiles/<profile_name>
    chmod +ux .bash/profiles/<profile_name>
   
Example:

    vim .bash/profiles/macbookpro_home

    export_dir_after /Users/hcv/Desktop/Android/sdk/tools
    export_dir_after /Users/hcv/Desktop/Android/sdk/platform-tools
    export_dir_after ~/bin
    export_dir_before /usr/local/sbin
    export_dir_before /usr/local/bin
    addidir projs /Users/hcv/Desktop/beartouch/Projects
    addidir blib /Users/hcv/Desktop/beartouch/Libraries

    chmod +ux .bash/profiles/macbookpro_home

### Select the profile in vim .bashrc
    
    set_profile <profile_name>
    
Example:

    set_profile macbookpro_home

### Create a shorcut to a filesystem path

In a profile like ".bash/profiles/macbookpro_home" add something like 
    
    addidir <shortcutname> <PATH>

### List your shortcuts 

    lidir

### Goto to a filesystem path over a shorcut

    goto <shortcutname> 

### License

Copyright 2013 Helder Vasconcelos - Bearstouch Software  <heldervasc@bearstouch.com> 

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License. 
