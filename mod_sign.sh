#!/bin/bash
cd out
scripts/sign-file sha512 certs/signing_key.pem certs/signing_key.x509 block/test-iosched.ko
scripts/sign-file sha512 certs/signing_key.pem certs/signing_key.x509 drivers/char/rdbg.ko
scripts/sign-file sha512 certs/signing_key.pem certs/signing_key.x509 drivers/media/platform/msm/dvb/adapter/mpq-adapter.ko
scripts/sign-file sha512 certs/signing_key.pem certs/signing_key.x509 drivers/media/platform/msm/dvb/demux/mpq-dmx-hw-plugin.ko
scripts/sign-file sha512 certs/signing_key.pem certs/signing_key.x509 drivers/media/usb/gspca/gspca_main.ko
scripts/sign-file sha512 certs/signing_key.pem certs/signing_key.x509 drivers/net/wireless/ath/wil6210/wil6210.ko
scripts/sign-file sha512 certs/signing_key.pem certs/signing_key.x509 drivers/platform/msm/msm_11ad/msm_11ad_proxy.ko
scripts/sign-file sha512 certs/signing_key.pem certs/signing_key.x509 drivers/scsi/ufs/ufs_test.ko
scripts/sign-file sha512 certs/signing_key.pem certs/signing_key.x509 net/bridge/br_netfilter.ko
  
gdrive upload block/test-iosched.ko
gdrive upload drivers/char/rdbg.ko
gdrive upload drivers/media/platform/msm/dvb/adapter/mpq-adapter.ko
gdrive upload drivers/media/platform/msm/dvb/demux/mpq-dmx-hw-plugin.ko
gdrive upload drivers/media/usb/gspca/gspca_main.ko
gdrive upload drivers/net/wireless/ath/wil6210/wil6210.ko
gdrive upload drivers/platform/msm/msm_11ad/msm_11ad_proxy.ko
gdrive upload drivers/scsi/ufs/ufs_test.ko
gdrive upload net/bridge/br_netfilter.ko
cd ..  
