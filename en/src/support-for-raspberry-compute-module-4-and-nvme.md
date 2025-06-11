# Support for Raspberry Compute Module 4 and NVMe

I just got a CM4 donated with 1GB main memory, 32GB eMMC and 128 GB NVMe. Thank you very much to the donator!

CM4 was already supported by raspiBackup but only running from a SD card, eMMC
or USB boot. It's already possible to use NVMe when it's provided in an USB
plug because it's exposed as a normal disk as /dev/sdx but there was no way to
have NVMe plugged in in the PCI lane exposed as /dev/nvme.  Now I fortunately
was able to add  this support to raspiBackup. This support is available now in
release 0.6.8.

![CM4.jpg](images/CM4.jpg)


## How to make the CM4 NVMe device available on Linux to restore a NVMe backup created with raspiBackup

If you want to restore an NVMe backup you have to mount the NVMe device on a Linux system in the following way:


Here are full instructions (Sourced from: <https://jamesachambers.com/full-compute-module-4-raspberry-pi-setup-imaging-guide/>
combined with the mass-storage-gadget documentation on github):

Disconnect power from the CM4 carrier board, and change the USB boot switch behind the HDMI port to "ON"

Connect a USB cable from your other Pi/Linux computer to the CM4 Carrier's USB-C port

Open terminal on your linux computer and run the following to set up rpiboot/usbboot:

    sudo apt install git libusb-1.0-0-dev build-essential
    git clone --depth=1 https://github.com/raspberrypi/usbboot
    cd usbboot
    make
    sudo make install

Then to mount the drives:

    cd mass-storage-gadget
    sudo ../rpiboot -d .

Once done the boot and rootfs partitions of eMMC and NVMe should mount.

``` admonish note
Don't expect the device used for NVMe to be mounted all the time with the same device name. Double check you use the correct device name when you use NVMe.
```

raspiBackup requires the restore device partitions not to be mounted. Now
umount the NVMe partitions (e.g. `/dev/nvme0n1p1` and `/dev/nvme0n1p2)` and use the
NVMe device (e.g. `/dev/nvme0n1`) as parameter for restore option -d.

[.source]: https://www.linux-tips-and-tricks.de/de/raspibackupcategoried/613-unterstuetzung-fuer-raspberry-compute-module-4-und-nvme
[.source]: https://www.linux-tips-and-tricks.de/en/raspibackupcategorye/612-support-for-raspberry-compute-module-4-and-nvme
