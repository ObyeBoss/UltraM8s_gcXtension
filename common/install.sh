L=$MODPATH/common/blob
PL="$(find /system/etc /vendor/etc -type f -name "public.libraries.txt")"
V=/system/vendor/lib
SV=/system/lib
V64=/system/vendor/lib64
SV64=/system/lib64

for OPL in ${PL}; do
PL="$MODPATH$(echo $OPL | sed "s|^/vendor|/system/vendor|g")"
$KSU && PL="$(echo $PL | sed -e "s|$MODPATH/odm|$MODPATH/system/odm|g" -e "s|$MODPATH/my_product|$MODPATH/system/my_product|g")"
cp_ch $ORIGDIR$OPL $PL
sed -i 's/\t/  /g' $PL

if [ -f "$V64/lib_aion_buffer.so" ]; then
 cp_ch $L/lib_aion_buffer.so $MODPATH$V64/lib_aion_buffer.so
 echo "lib_aion_buffer.so" >> $PL
fi
if [ -f "$V/lib_aion_buffer.so" ]; then
 cp_ch $L/lib_aion_buffer3.so $MODPATH$V/lib_aion_buffer.so
fi 
if [ -f "$V64/libOpenCL-pixel.so" ]; then
 cp_ch $L/libOpenCL-pixel.so $MODPATH$V64/libOpenCL-pixel.so
 echo "libOpenCL-pixel.so" >> $PL
fi
if [ -f "$V/libOpenCL-pixel.so" ]; then
 cp_ch $L/libOpenCL-pixel3.so $MODPATH$V/libOpenCL-pixel.so
fi
if [ -f "$SV64/libdmabufheap.so" ]; then
 if [ $API -ge 33 ]; then
 cp_ch $L/libdmabufheap2.so $MODPATH$SV64/libdmabufheap.so
 else
 cp_ch $L/libdmabufheap.so $MODPATH$SV64/libdmabufheap.so
 fi
 echo "libdmabufheap.so" >> $PL
fi
cp_ch $L/libucvm_egl_shm.so $MODPATH$SV64/libucvm_egl_shm.so
cp_ch $L/libucvm_egl_shm3.so $MODPATH$SV/libucvm_egl_shm.so
echo "libucvm_egl_shm.so" >> $PL
echo "libucvm_blob_meadapt.so" >> $PL
echo "libucvm_blob_mwrp.so" >> $PL
echo "libucvm_blob_nntstgchecker.so" >> $PL
echo "libucvm_blob_procr.so" >> $PL
echo "libucvm_blobfis_prot.so" >> $PL
echo "libucvm_blobfli.so" >> $PL
echo "libucvm_blobscncheckr.so" >> $PL
echo "libucvm_fis.so" >> $PL
echo "libucvm_protosh_mblb.so" >> $PL
echo "libucvm_qtpaf_blob.so" >> $PL
echo "libucvm_shmblob.so" >> $PL
echo "libucvm_ttqcblob.so" >> $PL
done
