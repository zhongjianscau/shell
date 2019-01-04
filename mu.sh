#!/bin/bash
#执行方法
#./mu.sh user message1 [message2 message3 ...]
#
#给用户发送信息
##########################
#
#保存用户参数
#
user=$1
#
#判断用户是否登陆
#
logged_on=$(who | grep -i -m 1 $user | gawk '{print $1}')
if [ -z $logged_on ]
then
	echo "$user is not logged on."
	echo "Exiting script..."
	exit
fi
#
#判断用户是否允许发送消息
#
allowed=$(who -T | grep -i -m 1 $user | gawk '{print $2}')
if [ $allowed != '+' ]
then
	echo "$user does not allowing messaging."
	echo "Exiting script..."
	exit
fi
#
#判断是否有消息参数
#
if [ -z $2 ]
then
	echo "No message parameter included."
	echo "Exiting script..."
	exit
fi
#
#组装长消息
#
shift
while [ -n "$1" ]
do
	whole_message=$whole_message' '$1
	shift
done
#
#发送消息
#
uterminal=$(who | grep -i -m 1 $user | gawk '{print $2}')
echo $whole_message | write $logged_on $uterminal
exit
