# UltraM8's Gcam Extension Module
What is this module for?
In short - to see if using pixel blobs can boost EGL-based operations in Google Camera ports.
On pixels google camera has lots of support blobs that are taking their part in processing.
One of the main blobs that gcam actually asks for - is the hardware buffer lib - lib_aion_buffer.so
According to [android.googlesource](https://android.googlesource.com/device/google/wahoo/+/6c2a01b%5E%21/) 
commit, aion is used "for vendor-specific buffer management functionality to enable zero-copy camera RAW->GPU buffer
handling". 
Zero-copy is used for performance reasons during shader compilation, for example when sabre merge is forced, in portrait 
mode processing, HDRnetshader and likely new features like face deblur on recent pixels. This also could be handy for 
halide operations, but the question if those can actually run on gpu instead of cpu in gcam is still open.
Unfortunately it's unlikely to solve the issue of not having non-zerocopy texture processing on qualcomm. Software
texture gather is used instead. Maybe thats why on pixel it targets mali which has extention for native 16bit texture gather.
Or maybe it helps booting sw gather, since as I mentioned above - aion lib existed long before moving to mali gpu.

After installing the module check for aion in logs - it should come up right after booting up & after taking a shot in gcam.
Any speed ups in processing time are subjective though - since we don't have hexagon working - simultaneous merge & render
is absent on non-pixels, and aion is unlikely to boost. Though, I still encourage you to test and check for yourself.

If any ROM/Kernel dev sees this and has any thoughts/ideas on camera heap, or is familiar with pixel source - pls
contact me, I'm eager to keep up digging pixel blobs.

## Requirements
* I'd bet permissive selinux is needed
* Your rom should likely have CONFIG_ION_SYSTEM_HEAP enabked & something [like ion camera heap](https://github.com/UtsavBalar1231/kernel_xiaomi_sm8250/commit/d0d97148af7769b23136807f7fd386026908d209), but since I'm not rom dev, so not sure about this.

## Support
* UltraCVM [Chat](https://t.me/ucvm_gcam)
