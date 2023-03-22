# This script will wakeup a remote PC by sending magic packet on port 9 if you specify ip or name.
# You need to install wakeonlan on client and might also need homebrew
# https://www.how2shout.com/linux/2-ways-to-install-homebrew-on-debian-11-bullseye-linux/
# Wake on lan server setup can be found here: wiki.debian.org/WakeOnLan

wakeonlan 00:21:cc:c5:c0:xx #Specify Mac address here
printf "booting";
#for i in {0..5};do printf ".";sleep 1;done
#result=`ping -c 1 -t 1 192.168.0.41 | grep "1 packets" | awk '{ print $4 }'`
# Generally linux boot is done in 30 seconds"
for i in {0..30};
do
  #echo $result;
  # Specify IP address here after ping. The ping is going to send 1 packet -c and will timeout -t in 1 second. 
  # The next command grep after pipe is going pick-up only result line discarding headers and footers of ping command.
  # awk will pick-up packets sent. If the remote computer doesn't respond, then result will have 0. 
  result=`ping -c 1 -t 1 192.168.0.11 | grep "1 packets" | awk '{ print $4 }'`
  sleep 1;
  # As soon as ping sets variable to 1 (which means packet delivered successfully) it will receive result=1 which will break the loop 
  # otherwise it will keep printing dot.
  if [ $result -gt 0 ];then break;else printf "." ;fi
done
# Specify ip address of remote PC you want to connect to:
ssh T420
