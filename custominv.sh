#!/bin/sh
contentvar=`cat invt`
Substring1='aws'  # for apche
Substring2='wls'  # for Weblogic
Substring3='jb'  # for jboss
Substring4='RHL'  # for Redhat
Substring5='fal'  # for custom application server



 echo "" > check1.txt

array=`cat invt`
# ${!array[@]} is the list of all the indexes set in the array


invt_apache=""
for  i in $contentvar
do
     if [[ "$i" =~ .*"$Substring1".* ]]; then
       echo -e "$i" >> invt_apache.txt
     elif [[ "$i" =~ .*"$Substring2".* ]]; then 
        echo -e "$i" >> invt_wls.txt
     elif [[ "$i" =~ .*"$Substring3".* ]]; then
        echo -e "$i" >> invt_jbs.txt
     elif [[ "$i" =~ .*"$Substring4".* ]]; then
        echo -e "$i" >> invt_RHL.txt
     elif [[ "$i" =~ .*"$Substring5".* ]]; then
        echo -e "$i" >> invt_cust.txt

     fi
done

echo "[apache]" > Patchinginvt.txt
cat invt_apache.txt >> Patchinginvt.txt

echo "[wls]" >> Patchinginvt.txt
cat invt_wls.txt >> Patchinginvt.txt

echo "[jbs]" >> Patchinginvt.txt
cat invt_jbs.txt >> Patchinginvt.txt

echo "[RHL]" >> Patchinginvt.txt
cat invt_RHL.txt >> Patchinginvt.txt

echo "[Custom]" >> Patchinginvt.txt
cat invt_cust.txt >> Patchinginvt.txt


rm -f invt_apache.txt 
rm -f invt_wls.txt
rm -f invt_jbs.txt
rm -f invt_RHL.txt
