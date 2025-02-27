# 
# # 
#
# My bash config. Not much to see here; just some pretty standard stuff.

# Export user bin
export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin
export SECOND_BRAIN="/shsv/Android/SoftIP/35_hieunguyen/setup_env/obsidian_note/ZazenCodes-obsidian"
export REPO_DIR="/shsv/Android/SoftIP/35_hieunguyen/_REPO"
export TARMAC_UTILITY="$REPO_DIR/github/ARM-sotfware/tarmac-trace-utilities"
export PATH=$PATH:$TARMAC_UTILITY
export TMPDIR=/data1/hieunguyen/.temp

if [ -d "/data1/hieunguyen/.temp" ]; then
  export TMPDIR=/data1/hieunguyen/.temp
else
  export TMPDIR=/data2/hieunguyen/.temp
fi
export TMPDIR=/data1/hieunguyen/.temp



# My own scirpt Bin Path
export PATH=$PATH:/shsv/Android/SoftIP/35_hieunguyen/setup_env/dotfiles/bin

# Config FZF
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
     

##SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'


alias ll='ls -la -t'
alias clr='clear'

# Open nvim
alias v='/shsv/Android/SoftIP/35_hieunguyen/setup_env/nvim-linux64/bin/nvim'
#alias v='/data2/hieunguyen/setup_env/nvim-linux64/bin/nvim'
export PATH=$PATH:/shsv/Android/SoftIP/35_hieunguyen/setup_env/nvim-linux64/bin/nvim
alias nvimf='nvim $(fzf)'

#Open init.vim
alias nvimconfig='nvim ~/.config/nvim/init.vim'

# Open gitconfig file
alias gitcfg='vi ~/.gitconfig'

# change bashrc
alias bashc='vi ~/.bashrc'
alias bashr='source ~/.bashrc'

#Reload tmux config file
alias tmuxr='tmux source-file ~/.tmux.conf'
alias tmuxc='vi ~/.tmux.conf'

#lazygit
alias lg='lazygit'

#Dotfiles bin
alias fcd="source fuzzy_cd"

# Obsidian
alias oo='cd $SECOND_BRAIN'
alias or='nvim $SECOND_BRAIN/inbox/*.md'
#alias ou='cd $SECOND_BRAIN && node batchUpload.js --lastmod-days-window 5'

# TLDR
alias wk='wiki'

# VSDK
alias cdvsdk="cd '/shsv/DTV/Documents/Knowledge_Management/01_Database_ESW_common/01_Technical Knowledge/Hardware/Virtualizer/VPF_MBD/R-CarGen5'"
alias cdvdk='cd /data1/hieunguyen/vsdk/02_VDK'

# Python doc
#alias pywk='pywiki'
# TODO: write fzf wrappper to select wiki page:
#alias pywk='wikipage $REPO_DIR/github/python/cpython rst'
#alias ghwk='wikipage $REPO_DIR/github/github/docs-main md'
#alias glwk='wikipage $REPO_DIR/gitlab/gitlab/gitlab-master md'
# alias wk='wikipage $REPO_DIR/_TOOL/tldr md'

# Define your aliases here
declare -A aliases
aliases=(
  ["TLDR"]="wikipage $REPO_DIR/_TOOL/tldr md"
  ["Python wiki"]="wikipage $REPO_DIR/github/python/cpython rst"
  ["pycryptodome"]="wikipage $REPO_DIR/_Secure_Tool/pycryptodome rst"
  ["Github wiki"]="wikipage $REPO_DIR/github/github/docs-main md"
  ["Gitlab wiki"]="wikipage $REPO_DIR/gitlab/gitlab/gitlab-master md"
  ["Second brain"]="wikipage $SECOND_BRAIN md"
)

# Function to display aliases using fzf
wiki() {
  local keys=("${!aliases[@]}")
  local selected=$(printf "%s\n" "${keys[@]}" | fzf --prompt="Select an alias: ")

  if [[ -n "$selected" ]]; then
    echo "Selected alias: $selected"
    if [[ "$selected" == "TLDR" ]]; then
      echo "Executing additional commands for TLDR."
      cd $REPO_DIR/_TOOL/tldr && cat $(git ls-files | fzf) 
    else
      echo "Executing: ${aliases[$selected]}"
      eval "${aliases[$selected]}"
    fi
  else
    echo "No alias selected."
  fi
}


# Wrapper to fucntion
alias chp='changepath'

# move to work dicrectory
alias cdnhan='cd /shsv/SS2/RSS1/37_NhanHuynh/1_WORKDIR'
alias cdtruong='cd /shsv/Android/SoftIP/39_TruongNguyen/01_Work_DIR' 
alias cddien='cd /shsv/Android/SoftIP/10_DienPham/01_OSS_Sec'
alias cdtask='cd /shsv/Android/SoftIP/35_hieunguyen/_Task/2024/Gen5'
alias cdatf1='cd /shsv/Android/SoftIP/35_hieunguyen/01_OSS_Sec/arm-trusted-firmware'
alias cdatf2='cd /shsv/Android/SoftIP/10_DienPham/01_OSS_Sec/arm-trusted-firmware'
alias cdsvn='cd /shsv/Android/SoftIP/10_DienPham/_REPO/_SECURE/SVN/'
alias cdtraining='cd /shsv/Android/SoftIP/35_hieunguyen/_Common/training/missing_semester '
alias cdw='cd /shsv/Android/SoftIP/35_hieunguyen/01_OSS_Sec'
alias cdsrp='cd /shsv/Android/SoftIP/35_hieunguyen/_REPO/_SECURE'
alias cdlw='cd /data2/hieunguyen/01_OSS_Sec'
if [ -d "/data1/hieunguyen/" ]; then
  alias cdlw='cd /data1/hieunguyen/01_OSS_Sec'
else
  alias cdlw='cd /data2/hieunguyen/01_OSS_Sec'
fi

alias cddot='cd /shsv/Android/SoftIP/35_hieunguyen/setup_env/dotfiles'
alias cdsan='cd /shsv/DTV/Prj_WinCE/68_SAN_Sample_Code/01_Inputs/S4_SDK_3.16.0'
alias cdsanrepo='cd /shsv/Android/SoftIP/35_hieunguyen/02_SAN/hwsansamplecodedev'
alias cdpoc='cd /shsv/DTV/Prj_BSP/01_Input/10_SecureSW/Gen5_ATF'
alias cddoc='cd /shsv/RCarSW/Documents'
alias cdrp='cd /shsv/Android/SoftIP/35_hieunguyen/_REPO'
alias cdimage='cd /shsv/RCarSW/rvc_git_repo/yocto/_YOCTO_IMAGES_'
alias cddtvdoc='cd /shsv/DTV/Documents/Knowledge_Management'
alias cdgen5doc='cd "/shsv/DTV/Documents/Knowledge_Management/01_Database_ESW_common/01_Technical Knowledge/Hardware/Gen5"'
alias cddeliver='cd "/shsv/DTV/Prj_BSP/__Deliverable"'
alias note='nvim /shsv/Android/SoftIP/35_hieunguyen/01_OSS_Sec/readme.txt'
alias reponote='nvim /shsv/Android/SoftIP/35_hieunguyen/01_OSS_Sec/_Note/git_repo_list.txt'
alias cdlocaldoc='cd /shsv/DTV/Prj_BSP/01_Input/10_SecureSW/01_Common/local_documents'
alias cdbspdoc='cd /shsv/DTV/Prj_BSP/02_Output/06_SecureBSP'
alias cdrcarenv='cd /shsv/SS2/RSS1/10_DienPham/TASKS/rcar-env'
alias cdtldr='cd /shsv/Android/SoftIP/35_hieunguyen/_REPO/_TOOL/tldr/pages/common'
alias cdnamnguyen='cd /shsv/Android/Supplier/for_MCU_and_friend/NamHaiNguyen'
alias cdbl31w='cd /shsv/Android/SoftIP/35_hieunguyen/01_OSS_Sec/_Palladium/System_Validation_Code'
alias cdt32='cd /shsv/RCarSW/Documents/Lauterbach'
alias cdbk='cd /shsv/SS2/RSS1/35_HieuNguyen/_REPO'
alias gitrepo='fd -t d -H .git -d 6 | fzf'
alias cdsblib='cd /shsv/Android/SoftIP/35_hieunguyen/_Task/2024/Gen5/00_Input/_from_BootROM_team/SB-Lib/20231124_SB-lib_a2/src'
alias cd.='cd ..'
alias cd..='cd ../..'
alias cd...='cd ../../..'

# Git alias
alias gitfetch='GIT_SSL_NO_VERIFY=true git fetch origin'
alias gitpull='GIT_SSL_NO_VERIFY=true git pull origin'
alias gitclone='GIT_SSL_NO_VERIFY=true git clone'
alias gs='git status'
alias gitdu='git count-objects -vH'
alias hisfile='git log -p -- $(fzf)'

#grep alias
alias grep='grep --color=auto'

# alias build
alias cdsvnatf='cd /shsv/Android/SoftIP/10_DienPham/_REPO/_SECURE/SVN/a066/tags/Gen3_Yocto_v5.9.0'
alias buildatfh3='cd /shsv/Android/SoftIP/35_hieunguyen/01_OSS_Sec  && ./utility_build_scripts/securebsp/build_atf_v2_5.sh    arm-trusted-firmware 0 /shsv/Android/SoftIP/35_hieunguyen/work_dir/SalvatorXS-H3V590'
alias buildatfm3='cd /shsv/Android/SoftIP/35_hieunguyen/01_OSS_Sec && ./utility_build_scripts/securebsp/build_atf_v2_5.sh arm-trusted-firmware 5 /shsv/Android/SoftIP/35_hieunguyen/work_dir/SalvatorXS-M3'
alias buildlinux='cd /shsv/Android/SoftIP/35_hieunguyen/01_OSS_Sec  && ./utility_build_scripts/linux/build_kernel.sh linux'
alias genkey='cd /shsv/Android/SoftIP/35_hieunguyen/01_OSS_Sec  && ./utility_build_scripts/securebsp/create_key_pair.sh secure_boot_key 2048'

#alias find 
#alias recentfiles='find . -type f -printf '%Tc %p\n' | sort -r'
alias recentfiles='find . -type f -printf "%Tc %p\n" | sort -r'

#open ripgrep
alias rg='rg --line-number'
#alias rg='/shsv/Android/SoftIP/35_hieunguyen/setup_env/ripgrep-13.0.0-x86_64-unknown-linux-musl/rg'
#export PATH=$PATH:/shsv/Android/SoftIP/35_hieunguyen/setup_env/ripgrep-13.0.0-x86_64-unknown-linux-musl/rg
#set export FZF_DEFAULT_COMMAND='/shsv/Android/SoftIP/35_hieunguyen/setup_env/ripgrep-13.0.0-x86_64-unknown-linux-musl/rg --files --hidden --follow --glob "!.git/*"'
set export FZF_DEFAULT_COMMAND='~/local/rg --files --hidden --follow --glob "!.git/*"'
set export LOG_PATH='/shsv/Android/SoftIP/35_hieunguyen/01_OSS_Sec/scripts/log'
#export PATH=$PATH:~/local/rg
#alias rg='~/local/rg'


# Change linux path to windows path
function changepath() {
	#echo `pwd`  | sed 's/\//\\/g' | sed 's/shsv/\\rvc-vnas-01/g'

	if [ -z "$1" ]; then
		
		#echo "Usage: $0 file_type"
		echo `pwd`  | sed 's/\//\\/g' | sed 's/shsv/\\rvc-vnas-01.rvc.renesas.com/g'
		#echo `pwd`  | sed 's/\//\\/g' | sed 's/shsv/\\rvc-vnas-01/g'
		
	else
		echo $1  | sed 's/\//\\/g' | sed 's/shsv/\\rvc-vnas-01/g'
	fi



}

# Search file type in current folder
function searchfile() {
	    # Function code goes here

	    # Check that the file type argument is provided
	    if [ -z "$1" ]; then
		        echo "Usage: $0 file_type"
			    exit 1
	    fi

	    # Set the search directory
	    SEARCH_DIR=`pwd`

	    # Set the file type to search for
	    FILE_TYPE="*.$1"

	    echo $SEARCH_DIR

	    # Search for files
	    echo "Searching for $FILE_TYPE files..."
	    find "$SEARCH_DIR" -type f -name "$FILE_TYPE" -printf "%P\n"
	    #find "$SEARCH_DIR" -type f -name "$FILE_TYPE" -printf "%P\n"
	    #fd -e $1 $SEARCH_DIR 

    }
# create ide workspace in tmux
function ide() {
   tmux split-window -v -l 30% 'bash -c " exec bash"'
   tmux split-window -h -l 66% 'bash -c " exec bash"'
   tmux split-window -h -l 50% 'bash -c " exec bash"'
}

function ide_2() {
   tmux split-window -v -l 30% 'bash -c " exec bash"'
   tmux split-window -h -l 66% 'bash -c " exec bash"'
   tmux split-window -h -l 50% 'bash -c " exec bash"'
}

function burnwindow() {
   tmux split-window -h -l 50% 'bash -c " exec bash"'
   tmux split-window -v -l 50% 'bash -c " exec bash"'
   tmux split-window -v -l 50% 'bash -c " exec bash"'
}

function ide_3() {
    # Split the current window into four panes
    tmux split-window -v 'bash -c " exec bash"'
    tmux split-window -h 'bash -c " exec bash"'
    tmux select-pane -t 0
    tmux split-window -h 'bash -c " exec bash"'
    tmux select-pane -t 2
    
    # Change the working directory of each pane to the current path
    #tmux send-keys -t 0 "bash" Enter
    #tmux send-keys -t 1 "bash" Enter
    #tmux send-keys -t 2 "bash" Enter
    #tmux send-keys -t 3 "bash" Enter
}

function wikipage() {
    local repo=$1
    local file_type="*.$2"

    cd $repo
    nvim $(git ls-files "$file_type" | fzf) 
}

