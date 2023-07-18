L=$MODPATH/common/blob
cp_ch /system/vendor/etc/public.libraries.txt $MODPATH/system/vendor/etc/public.libraries.txt
PL="/system/vendor/etc/public.libraries.txt"
V=/system/vendor/lib64
SV=/system/lib64
if [ -f "$V/lib_aion_buffer.so" ]; then
 cp_ch $L/lib_aion_buffer.so $MODPATH$V/lib_aion_buffer.so
 echo "lib_aion_buffer.so" >> $MODPATH/$PL
fi 
if [ -f "$V/libOpenCL-pixel.so" ]; then
 cp_ch $L/libOpenCL-pixel.so $MODPATH$V/libOpenCL-pixel.so
 echo "libOpenCL-pixel.so" >> $MODPATH/$PL
fi
if [ -f "$SV/libdmabufheap.so" ]; then
 if [ $API -ge 33 ]; then
 cp_ch $L/libdmabufheap2.so $MODPATH$SV/libdmabufheap.so
 else
 cp_ch $L/libdmabufheap.so $MODPATH$SV/libdmabufheap.so
 fi
 echo "libdmabufheap.so" >> $MODPATH/$PL
fi
cp_ch $L/libucvm_egl_shm.so $MODPATH$SV/libucvm_egl_shm.so
echo "libucvm_egl_shm.so" >> $MODPATH/$PL
echo "libucvm_blob_meadapt.so" >> $MODPATH/$PL
echo "libucvm_blob_mwrp.so" >> $MODPATH/$PL
echo "libucvm_blob_nntstgchecker.so" >> $MODPATH/$PL
echo "libucvm_blob_procr.so" >> $MODPATH/$PL
echo "libucvm_blobfis_prot.so" >> $MODPATH/$PL
echo "libucvm_blobfli.so" >> $MODPATH/$PL
echo "libucvm_blobscncheckr.so" >> $MODPATH/$PL
echo "libucvm_fis.so" >> $MODPATH/$PL
echo "libucvm_protosh_mblb.so" >> $MODPATH/$PL
echo "libucvm_qtpaf_blob.so" >> $MODPATH/$PL
echo "libucvm_shmblob.so" >> $MODPATH/$PL
echo "libucvm_ttqcblob.so" >> $MODPATH/$PL
