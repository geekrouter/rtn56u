#
# Router rc control scripts Makefile
#
# Copyright 2004, ASUSTeK Inc.
# All Rights Reserved.
# 
# THIS SOFTWARE IS OFFERED "AS IS", AND BROADCOM GRANTS NO WARRANTIES OF ANY
# KIND, EXPRESS OR IMPLIED, BY STATUTE, COMMUNICATION OR OTHERWISE. BROADCOM
# SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A SPECIFIC PURPOSE OR NONINFRINGEMENT CONCERNING THIS SOFTWARE.
#

-include $(LINUX_CONFIG)
-include $(CONFIG_CONFIG)
-include $(ARCH_CONFIG)
-include $(MODULES_CONFIG)

SHDIR = $(ROOTDIR)/user/shared
HTTPDIR = $(ROOTDIR)/user/httpd
NETDIR = $(ROOTDIR)/user/netconf
NVDIR = $(ROOTDIR)/user/nvram
MTDDIR = $(ROOTDIR)/user/mtd_utils # 1204 ham
INSTALLDIR = $(ROOTDIR)/romfs
CONF_H  = $(ROOTDIR)/$(LINUXDIR)/include/linux/autoconf.h
UCONF_H = $(ROOTDIR)/config/autoconf.h

CFLAGS += -s -DASUS_NVRAM -DRPPPPOE -DBTN_SETUP -DWL500GP -DDHCP_PPTP -DQOS -DASUS_EXT -DGPQOS -DASUS_DDNS -DWSC -DGUEST_ACCOUNT -DWEB_REDIRECT -DWEBSTRFILTER -DUSB_SUPPORT -DU2EC -DDLM -DPRINTER_SUPPORT -DCONTENTFILTER -DHTTPD_CHECK #-DUSBTPT
#CFLAGS += -I. -I$(SHDIR)/include -I$(ROOTDIR)/linux-2.6.21.x/include -I$(ROOTDIR)/linux-2.6.21.x/drivers/flash -I$(HTTPDIR)/ -I$(ROOTDIR)/linux-2.6.21.x/drivers/char -I$(ROOTDIR)/linux-2.6.21.x/drivers/net/raeth -I$(ROOTDIR)/linux-2.6.21.x/include/linux -I$(MTDDIR)
CFLAGS += -I. -I$(SHDIR)/include -I$(ROOTDIR)/linux-2.6.21.x/include -I$(ROOTDIR)/linux-2.6.21.x/drivers/flash -I$(HTTPDIR)/ -I$(ROOTDIR)/linux-2.6.21.x/drivers/char -I$(ROOTDIR)/linux-2.6.21.x/drivers/net/raeth -I$(MTDDIR) -I$(ROOTDIR)/user/busybox/include -I$(SHDIR)

#CFLAGS += -DLANGUAGE_TW
CFLAGS += -DSR3
#CFLAGS += -DW7_LOGO	# win7 logo
#CFLAGS += -DWIFI_LOGO
#CFLAGS += -DMR

LDFLAGS = -L. -L$(SHDIR)/prebuilt -lcrypto_asus -L$(SHDIR) -lshared -L$(NETDIR) -lnetconf -lm

CFLAGS += -I$(ROOTDIR)/user/libdisk
LDFLAGS += -L$(ROOTDIR)/user/libdisk -ldisk

EXEC = rc

#2008.10 magic add wanduck_main.o
#OBJS = rc.o init.o mtd.o services.o watchdog.o network_ex.o manu_ex.o firewall_ex.o common_ex.o network.o services_ex.o bigpond.o ppp.o qosutils.o qos.o speedtest.o ntp.o udhcpc.o udhcpc_ex.o ralink.o rtl8366s.o btnsetup.o pspfix.o wanduck_main.o ../wireless_tools/iwlib.o monitor.o
OBJS = rc.o init.o mtd.o services.o watchdog.o network_ex.o firewall_ex.o common_ex.o network.o services_ex.o bigpond.o ppp.o qosutils.o qos.o speedtest.o uploadspeed.o ntp.o udhcpc.o udhcpc_ex.o ralink.o rtl8367m.o btnsetup.o pspfix.o ../wireless_tools/iwlib.o linkstatus.o detect_internet.o xstart.o arpping.o usbled.o cpu.o# usdsvr.o monitor.o ping.o manu_ex.o

OBJS += usb_devices.o wanduck.o

all:	$(OBJS) $(CONF_H) $(UCONF_H) Makefile
	echo $(LINUXDIR)
	echo $(CONF_H)
	echo $(UCONF_H)
	$(CC) -o $(EXEC) $(OBJS) $(LDFLAGS)
	$(STRIP) $(EXEC)

c.o:
	$(CC) -c $*.c $(CFLAGS)

clean:
	rm -f *.o rc

romfs:
	$(ROMFSINST) /sbin/$(EXEC)
	#cd $(INSTALLDIR)/sbin && ln -sf rc init
	cd $(INSTALLDIR) && rm -f init && ln -sf sbin/rc init
	cd $(INSTALLDIR)/sbin && ln -sf rc init
	cd $(INSTALLDIR)/sbin && ln -sf rc erase
	cd $(INSTALLDIR)/sbin && ln -sf rc nvram_restore
	cd $(INSTALLDIR)/sbin && ln -sf rc nvram_erase
#	cd $(INSTALLDIR)/sbin && ln -sf rc startWan
#	cd $(INSTALLDIR)/sbin && ln -sf rc start_wan
#	cd $(INSTALLDIR)/sbin && ln -sf rc stop_wan
	cd $(INSTALLDIR)/sbin && ln -sf rc start_mac_clone
	cd $(INSTALLDIR)/sbin && ln -sf rc watchdog
	cd $(INSTALLDIR)/sbin && ln -sf rc write
	cd $(INSTALLDIR)/sbin && ln -sf rc hotplug
	cd $(INSTALLDIR)/sbin && ln -sf rc halt
	cd $(INSTALLDIR)/sbin && ln -sf rc reboot
	cd $(INSTALLDIR)/sbin && ln -sf rc stopservice
	cd $(INSTALLDIR)/sbin && ln -sf rc ddns_updated
	cd $(INSTALLDIR)/sbin && ln -sf rc start_ddns
	cd $(INSTALLDIR)/sbin && ln -sf rc ntp
#	cd $(INSTALLDIR)/sbin && ln -sf rc gpiotest
	cd $(INSTALLDIR)/sbin && ln -sf rc gpio_write
	cd $(INSTALLDIR)/sbin && ln -sf rc radioctrl
	cd $(INSTALLDIR)/sbin && ln -sf rc radioctrl_rt
	cd $(INSTALLDIR)/sbin && ln -sf rc ots
	cd $(INSTALLDIR)/sbin && ln -sf rc restore
	cd $(INSTALLDIR)/sbin && ln -sf rc ip-up
	cd $(INSTALLDIR)/sbin && ln -sf rc ip-down
	cd $(INSTALLDIR)/sbin && ln -sf rc wan-up
	cd $(INSTALLDIR)/sbin && ln -sf rc wan-down
	cd $(INSTALLDIR)/sbin && ln -sf rc getCountryCode
	cd $(INSTALLDIR)/sbin && ln -sf rc setCountryCode
	cd $(INSTALLDIR)/sbin && ln -sf rc getMAC
	cd $(INSTALLDIR)/sbin && ln -sf rc setMAC
	cd $(INSTALLDIR)/sbin && ln -sf rc getMAC_2G
	cd $(INSTALLDIR)/sbin && ln -sf rc setMAC_2G
	cd $(INSTALLDIR)/sbin && ln -sf rc getMAC_5G
	cd $(INSTALLDIR)/sbin && ln -sf rc setMAC_5G
	cd $(INSTALLDIR)/sbin && ln -sf rc getPIN
	cd $(INSTALLDIR)/sbin && ln -sf rc setPIN
	cd $(INSTALLDIR)/sbin && ln -sf rc getBootV
	cd $(INSTALLDIR)/sbin && ln -sf rc gen_ralink_config
	cd $(INSTALLDIR)/sbin && ln -sf rc gen_ralink_config_rt
	cd $(INSTALLDIR)/sbin && ln -sf rc getIMG
	cd $(INSTALLDIR)/sbin && ln -sf rc slink
	cd $(INSTALLDIR)/sbin && ln -sf rc getSSID
	cd $(INSTALLDIR)/sbin && ln -sf rc getChannel
	cd $(INSTALLDIR)/sbin && ln -sf rc getChannel_2g
	cd $(INSTALLDIR)/sbin && ln -sf rc asuscfe
	cd $(INSTALLDIR)/sbin && ln -sf rc asuscfe_2g
	cd $(INSTALLDIR)/sbin && ln -sf rc asuscfe_5g
	cd $(INSTALLDIR)/sbin && ln -sf rc wps_pin
	cd $(INSTALLDIR)/sbin && ln -sf rc wps_pbc
	cd $(INSTALLDIR)/sbin && ln -sf rc wps_oob
	cd $(INSTALLDIR)/sbin && ln -sf rc wps_start
	cd $(INSTALLDIR)/sbin && ln -sf rc wps_stop
	cd $(INSTALLDIR)/sbin && ln -sf rc pspfix
	cd $(INSTALLDIR)/sbin && ln -sf rc getSiteSurvey
	cd $(INSTALLDIR)/sbin && ln -sf rc getSiteSurvey_2g
	cd $(INSTALLDIR)/sbin && ln -sf rc getBSSID
	cd $(INSTALLDIR)/sbin && ln -sf rc restart_dns
	cd $(INSTALLDIR)/sbin && ln -sf rc restart_dhcpd
# 2008.10 magic {
	cd $(INSTALLDIR)/sbin && ln -sf rc speedtest
	cd $(INSTALLDIR)/sbin && ln -sf rc restart_qos
	cd $(INSTALLDIR)/sbin && ln -sf rc convert_asus_values
	cd $(INSTALLDIR)/sbin && ln -sf rc FWRITE
# 2008.10 magic}
	cd $(INSTALLDIR)/sbin && ln -sf rc hotplug
	cd $(INSTALLDIR)/sbin && ln -sf rc hotplug_usb_mass
	cd $(INSTALLDIR)/sbin && ln -sf rc run_apps
	cd $(INSTALLDIR)/sbin && ln -sf rc run_ftpsamba
	cd $(INSTALLDIR)/sbin && ln -sf rc run_samba
	cd $(INSTALLDIR)/sbin && ln -sf rc run_ftp
	cd $(INSTALLDIR)/sbin && ln -sf rc run_dms
	cd $(INSTALLDIR)/sbin && ln -sf rc stop_ftp
	cd $(INSTALLDIR)/sbin && ln -sf rc stop_samba
	cd $(INSTALLDIR)/sbin && ln -sf rc stop_ftpsamba
	cd $(INSTALLDIR)/sbin && ln -sf rc stop_dms
	cd $(INSTALLDIR)/sbin && ln -sf rc umount2
	cd $(INSTALLDIR)/sbin && ln -sf rc ejusb
	cd $(INSTALLDIR)/sbin && ln -sf rc ejusb1
	cd $(INSTALLDIR)/sbin && ln -sf rc ejusb2
	cd $(INSTALLDIR)/sbin && ln -sf rc usbtpt
	cd $(INSTALLDIR)/sbin && ln -sf rc start_telnetd
	cd $(INSTALLDIR)/sbin && ln -sf rc start_wanduck
	cd $(INSTALLDIR)/sbin && ln -sf rc stop_wanduck
	cd $(INSTALLDIR)/sbin && ln -sf rc restart_wanduck
	cd $(INSTALLDIR)/sbin && ln -sf rc start_ots
	cd $(INSTALLDIR)/sbin && ln -sf rc start_ntp
	cd $(INSTALLDIR)/sbin && ln -sf rc get_sw
	cd $(INSTALLDIR)/sbin && ln -sf rc tracktest
	cd $(INSTALLDIR)/sbin && ln -sf rc ledon
	cd $(INSTALLDIR)/sbin && ln -sf rc ledoff
#	cd $(INSTALLDIR)/sbin && ln -sf rc start3g
#	cd $(INSTALLDIR)/sbin && ln -sf rc stop3g
	cd $(INSTALLDIR)/sbin && ln -sf rc 8367m
#	cd $(INSTALLDIR)/sbin && ln -sf rc ar8316
	cd $(INSTALLDIR)/sbin && ln -sf rc getWANStatus
	cd $(INSTALLDIR)/sbin && ln -sf rc linkstatus_monitor
	cd $(INSTALLDIR)/sbin && ln -sf rc usb_path_nvram
	cd $(INSTALLDIR)/sbin && ln -sf rc pids
	cd $(INSTALLDIR)/sbin && ln -sf rc create_swap_file
	cd $(INSTALLDIR)/sbin && ln -sf rc check_proc_mounts_parts
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Set_StartATEMode
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Set_AllLedOn
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Set_MacAddr_2G
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Set_MacAddr_5G
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Set_RegulationDomain
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Set_PINCode
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Set_RestoreDefault
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_FWVersion
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_BootLoaderVersion
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_ResetButtonStatus
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_WpsButtonStatus
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_Usb2p0_Port1_Infor
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_Usb2p0_Port2_Infor
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_MacAddr_2G
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_MacAddr_5G
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_RegulationDomain
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_PINCode
	cd $(INSTALLDIR)/sbin && ln -sf rc restart_networkmap
	cd $(INSTALLDIR)/sbin && ln -sf rc dumparptable
	cd $(INSTALLDIR)/sbin && ln -sf rc arpping
	cd $(INSTALLDIR)/sbin && ln -sf rc detect_internet
	cd $(INSTALLDIR)/sbin && ln -sf rc stainfo
	cd $(INSTALLDIR)/sbin && ln -sf rc stainfo_2g
	cd $(INSTALLDIR)/sbin && ln -sf rc getstat
	cd $(INSTALLDIR)/sbin && ln -sf rc getstat_2g
	cd $(INSTALLDIR)/sbin && ln -sf rc getrssi
	cd $(INSTALLDIR)/sbin && ln -sf rc getrssi_2g
	cd $(INSTALLDIR)/sbin && ln -sf rc getrssi_5g
	cd $(INSTALLDIR)/sbin && ln -sf rc gettxbfcal
	cd $(INSTALLDIR)/sbin && ln -sf rc rtl8367m_LanPort_linkUp
	cd $(INSTALLDIR)/sbin && ln -sf rc rtl8367m_LanPort_linkDown
	cd $(INSTALLDIR)/sbin && ln -sf rc rtl8367m_AllPort_linkUp
	cd $(INSTALLDIR)/sbin && ln -sf rc rtl8367m_AllPort_linkDown
	cd $(INSTALLDIR)/sbin && ln -sf rc rtl8367m_Reset_Storm_Control
	cd $(INSTALLDIR)/sbin && ln -sf rc print_num_of_connections
	cd $(INSTALLDIR)/sbin && ln -sf rc print_wan_ip
	cd $(INSTALLDIR)/sbin && ln -sf rc usbled
	cd $(INSTALLDIR)/sbin && ln -sf rc start_usbled
	cd $(INSTALLDIR)/sbin && ln -sf rc stop_usbled
	cd $(INSTALLDIR)/sbin && ln -sf rc reset_to_defaults
	cd $(INSTALLDIR)/sbin && ln -sf rc refresh_ntpc
	cd $(INSTALLDIR)/sbin && ln -sf rc phyState
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_WanLanStatus
	cd $(INSTALLDIR)/sbin && ln -sf rc ATE_Get_FwReadyStatus
	cd $(INSTALLDIR)/sbin && ln -sf rc run_telnetd
	cd $(INSTALLDIR)/sbin && ln -sf rc umount_dev_all
	cd $(INSTALLDIR)/sbin && ln -sf rc cpu

	cd $(INSTALLDIR)/sbin && ln -sf rc asus_lp
	cd $(INSTALLDIR)/sbin && ln -sf rc asus_sd
	cd $(INSTALLDIR)/sbin && ln -sf rc asus_sg
	cd $(INSTALLDIR)/sbin && ln -sf rc asus_sr
	cd $(INSTALLDIR)/sbin && ln -sf rc asus_tty
	cd $(INSTALLDIR)/sbin && ln -sf rc asus_usb_interface
	cd $(INSTALLDIR)/sbin && ln -sf rc wanduck
