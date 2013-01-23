## Advanced features for your Bash Shell

* Profiles: Manage the bash shell enviromment for each machine
* Shortcuts: Create shortcuts for important filesystems paths
* Aliases: Aliases for your most important tools

### To Install 
    
    git clone git@github.com:hvasconcelos/mybash.git
    cd mybash 
    ./install.sh

### Create a new bash Profile 

    > .bash/profiles/<profile_name>
    chmod +ux .bash/profiles/<profile_name>
   
Example:

    vim .bash/profiles/macbookpro_home
    # Export after PATH 
    myexpa /Users/hcv/Desktop/Android/sdk/tools
    myexpa /Users/hcv/Desktop/Android/sdk/platform-tools
    myexpa ~/bin
    # Export before PATH
    myexpb /usr/local/sbin
    myexpb /usr/local/bin
    myladd projs /Users/hcv/Desktop/beartouch/Projects
    myladd blib /Users/hcv/Desktop/beartouch/Libraries

    chmod +ux .bash/profiles/macbookpro_home

### Select the profile in vim .bash_profile
    
    myprofset <profile_name>
    
Example:

    myprofset macbookpro_home

### Create a shorcut to a filesystem path

In a profile file like ~/.bash/profiles/macbookpro_home  or ~/.bash_profile add 
the next line  to add a new shortcut 
    
    myladd <shortcutname> <PATH>

### List your shortcuts 

    mylls

### Goto to a filesystem path over a shorcut

    mylgo <shortcutname> 

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
