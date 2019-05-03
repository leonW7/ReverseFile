mkdir -p /usb1
mkdir -p /usb2
touch /usb1/wcdma.cfg
touch /usb2/wcdma.cfg
echo $(df -h | grep "/dev/sda" | wc -l) > /tmp/usb_device
exit 0
