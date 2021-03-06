
a=$(cat /etc/ssh/config.conf | grep ClientAliveInterval | grep ^[^#] | grep -o '[0-9a-Z]*$')   #updated regex in grep
b=$(cat /etc/ssh/config.conf | grep ClientAliveCountMax | grep ^[^#] | grep -o '[0-9]*')

if [[ ${a: -1} -eq 'm' ]]
then
if [[ $b -eq 0 ]]
then
echo ${a%?}m                       
else
echo $((${a%?}*$b))m          
fi
elif [[ ${a: -1} -eq 's' ]] 
then
if [[ $b -eq 0 ]]
then
echo $((${a%?}/60))m
else
echo $(((${a%?}*$b)/60))m
fi
elif [[ ${a: -1}  =~ ^[0-9]+$ ]]
then
if [[ $b -eq 0 ]]
then
echo $(($a/60))m
else
echo $((($a*$b)/60))m
fi
else
echo 'fail'
fi
