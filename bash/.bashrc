# Path exports
export PATH="/work/fastmodels:$PATH"
export PATH="/usr/local/ARMCompiler5/bin:$PATH"
export PATH="/usr/local/ARMCompiler6/bin:$PATH"
export PATH="/arm/devsys-tools/abs:$PATH"
#export PATH="/work/local-abs:$PATH"
export PATH="/home/jonsim01/bin/path:$PATH"
#export PERL5LIB="/work/abs/abs/lib/"


# Source FM exports etc.
#source /work/ARM/FastModelsTools_0.0/source_all.sh > /dev/null

# Update library path for nvidia drivers.
#export LD_LIBRARY_PATH=/usr/lib/nvidia-331:$LD_LIBRARY_PATH

# Set MANPATH to the default man path. This is only necessary because setup_eda_tool
# doesn't bother and otherwise wipes it out.
export MANPATH=`man --path`

# Export SVN_EDITOR to allow 'commit' with editor
export SVN_EDITOR="vi"

# Aliases
alias filename=basename
alias ls='ls --color'
alias sl='ls'
alias diff='colordiff -u'
alias gdiff='git --no-pager diff --no-index'
alias less='less -r'
alias tree='tree -C'
alias gedit='/home/jonsim01/bin/gedit-wrapper.py'
alias linfo='binfo server=localhost'
alias setup_java='eval `setup_wh_comp Java:JDK:1.7.0.45`'
alias setup_perl='eval `setup_eda_tool perl:5.14.2::threaded=define`'
alias setup_svn='eval `setup_eda_tool subversion:1.7.8`'
alias setup_svn19='eval `setup_eda_tool subversion:1.9.4`'
alias setup_cmake='eval `setup_eda_tool cmake:3.5.2`'
alias setup_armasm='eval `setup_wh_comp ARMCC:TestableTools:0.0:809:checking=none,regime=rel`'
# NB: This is pinned to 9.6 to match the PVLIB_HOME version we have.
alias setup_modeldebugger='eval `setup_wh_comp SysGen:Tools:9.6:42:regime=rel` && export PATH=$MAXCORE_HOME/bin:$PATH && export PVLIB_HOME=/work/fastmodels_9.6/PVModelLib'

# mkdir -c option
mkdir () {
    case $1 in
       (-c) command mkdir -p "$2" && cd "$2";;
       (*)  command mkdir "$@";;
    esac
}

# binfo push-on chain build
pushon_chain () {
    binfo Dispatch:SubmitChainJob --push-on --rev J"$1"
}
# binfo push-on component build
pushon_job () {
    binfo Dispatch:SubmitBuildJob --push-on --rev J"$1"
}
# Sketch of command to output devstudio failed chain (--parents may be unnecessary with --status failure)
# binfo Jobs:List --job-type ChainBuildJobs --only Daily_DevelopmentStudio:0.0::trunk --parents --status failure
# piped into:
# sed -r 's/^.*id: ([0-9]+) .*$/\1/' | sort -gr | head -n1
# Which will output the id of the latest failed chain build

# ln -s safety function
lns () {
    ln -s "$@" && check-links
}

# Nice filesize printer
fsize() {
    du -sb "$@" | sed -e s/\\t.*//g | b2r ;
}

# License files
export ARMLMD_LICENSE_FILE=7010@cam-lic03.cambridge.arm.com
export ARM_TOOL_VARIANT=ult

# Completion settings
#bind 'set completion-ignore-case on'
#if [ -f ~/.git-completion.bash ]; then
#  . ~/.git-completion.bash
#fi
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Bash prompt setup
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
txtgry='\[\e[0;90m\]' # Grey
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
bldgry='\[\e[1;90m\]' # Grey
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
undgry='\[\e[4;90m\]' # Grey
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
bakgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset
parse_git_branch() {
    if git diff-index --quiet HEAD -- 2> /dev/null; then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    else
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\*/'
    fi
}
PS1="$bldgrn\u$bldgry@$bldcyn\h$bldgry $bldpur\w$txtgry\$(parse_git_branch)$txtrst\$ "

