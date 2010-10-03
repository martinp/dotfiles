alias hal='ssh martin@hal.tihlde.org'
alias sal='ssh martin@sal.tihlde.org'
alias wopr='ssh martin@wopr.tihlde.org'
alias mellow='ssh foo@debian.mellowland.net'
alias atlantis='ssh martin@atlantis.kverka.no'
alias colargol='ssh martinop@colargol.tihlde.org'
alias gremlin='ssh martinop@gremlin.stud.aitel.hist.no'
alias gw='ssh root@gw'

alias up2date='sudo aptitude update && sudo aptitude safe-upgrade'
alias mount_mp3='sshfs -o ro,allow_other martin@wopr.tihlde.org:/glftpd/site/archive/mp3 ~/Music'
alias umount_mp3='fusermount -uz ~/Music'
alias backup_local='rsync --archive --delete --verbose --exclude=rtorrent martin@sal.tihlde.org:~ ~/rsync'
alias backup_mp3='rsync --archive --delete --verbose martin@wopr.tihlde.org:/glftpd/site/archive/array1/mp3 /media/PASSPORT/loot/'
alias backup_mp3_lap='rsync --archive --delete --verbose martin@wopr.tihlde.org:/glftpd/site/archive/array1/mp3/ ~/Music/'
alias dns2tcpc='~/dns2tcp/bin/dns2tcpc'
alias sshproxy='ssh -D 8080 -C -N martin@172.16.0.1'
alias iodine='sudo ~/iodine/bin/iodine -f -P Qu5haN8freSPeyU9 m.pythonic.eu'
alias iodine_test='sudo ~/iodine/bin/iodine -f -r -P Qu5haN8freSPeyU9 195.159.0.100 m.pythonic.eu'
