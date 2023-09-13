#!/bin/sh
# 保持某进程在线，可写入crontab循环
# echo '* * * * * /jffs/sshfs/keepssh.sh >> /jffs/sshfs/log'|cat >>/tmp/var/spool/cron/crontabs/root
# 上面路径的root换成你的用户名
function myecho(){
    date=$(date)
    echo $date $1
}
source /etc/profile
pid=$(/bin/ps | /bin/grep sshfs | /bin/grep -v grep | /bin/sed -n 's/^\s*\s*\([0-9]\+\).*/\1/p')
myecho "checking sshfs status..."
if [ -z "$pid" ]
then
    myecho "sshfs is not running."
    umount -l /jffs/ftp >> /dev/null 2>&1
    nohup sshfs phone:/ /jffs/ftp -o sshfs_sync,allow_other,ssh_command=/jffs/opt/bin/ssh -F /jffs/opt/config >> /jffs/fs/log 2>&1 &
    myecho "sshfs start."
else
    myecho "sshfs is running now."
fi
