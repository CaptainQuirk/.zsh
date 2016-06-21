export ACKRC=".ackrc"
export PATH=~/npm/bin:~/Documents/System/gitextensions:~/.android/android-sdk/platform-tools:~/.android/android-sdk/tools:/opt/local/bin:/opt/local/sbin:~/bin:/~/.composer/vendor/bin:~/.linuxbrew/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export PYTHONPATH=/usr/local/bin:~/.powerline/plugins:$PYTHONPATH
export GOPATH=~/.go

if [[ $IS_MAC -eq 1 ]]; then
  export LESSCHARSET=next
else
  export LESSCHARSET=utf-8
fi

export LC_ALL=en_GB.UTF-8
