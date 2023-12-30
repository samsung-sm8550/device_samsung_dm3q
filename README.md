## Recovery Device Tree for the Samsung Galaxy S23 Ultra

## Kernel source 

Available at [https://github.com/samsung-sm8550/kernel_samsung_sm8550/tree/twrp-12.1](https://github.com/samsung-sm8550/kernel_samsung_sm8550/tree/twrp-12.1)

## How to build

This device tree was tested and is fully compatible with [minimal-manifest-twrp](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp).

1. Set up the build environment following the instructions [here](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp/blob/twrp-12.1/README.md#getting-started)

2. In the root folder of the fetched repo, clone the device tree:

```bash
git clone https://github.com/samsung-sm8550/device_samsung_dm3q -b android-12.1 device/samsung/dm3q
```

3. To build:

```bash
export ALLOW_MISSING_DEPENDENCIES=true
. build/envsetup.sh
lunch twrp_dm3q-eng
mka recoveryimage
```