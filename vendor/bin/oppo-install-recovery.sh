#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:0e38393b221e065755948df6a2a0f8069c82cb5f; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:10eb4e91c2b454ffc0366ec4b59f8c8ba91d2665 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:0e38393b221e065755948df6a2a0f8069c82cb5f && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
