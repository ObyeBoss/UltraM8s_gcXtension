#
ln -sfv /dev/kgsl-3d0 /dev/mali0
chcon -R u:object_r:same_process_hal_file:s0 /vendor/lib64/lib_aion_buffer.so
chcon -R u:object_r:same_process_hal_file:s0 $MODPATH/system/vendor/lib64/lib_aion_buffer.so