# Infos
initrd => initial ram disk, how program will load
vmlinuz => All Executible file
config => 
system.Map	=> Kind of symbol table. variable, functions er map

## Minimum Requirements
Storage = 40GB [For ubuntu]

# Installation Process
## Config Grub Settings
1. `sudo gedit /etc/default/grub`
  * *Edit those lines*
  * **
	GRUB_TIMEOUT_STYPE=menu
	GRUB_TIMEOUT=10
2. `sudo update-grub`
3. `reboot`
4. `sudo apt-get update`

## Download Kernel

* Download from kernel.org

  NB: Check kernelFile/Documentation/process/changes.rst to get minimum packages requirements

## Prepare System
1. `sudo apt-get install build-essential` *For C related packages*
2. `sudo apt-get install bison`
3. `sudo apt-get install jfsutils`
4. `sudo apt-get install reiserfsprogs`
5. `sudo apt-get install xfsprogs`
6. `sudo apt-get install libncurses-dev`
7. `sudo apt-get install libssl-dev`
8. `sudo apt-get install libelf-dev`
9. `sudo apt-get install gtk2.0`	*For GUI in menu config*
10. `sudo apt-get install xz-utils`
11. `sudo apt-get install btrfs-progs`
12. `sudo apt-get install quotatool`
13. `sudo apt-get install nfs-common`
14. `sudo apt-get install oprofile`
15. `sudo apt-get install flex`
 
## Compilation
* Go to downloaded kernel folder
1. `make menuconfig`
	 * Select which functions you need (or select by default)
	 * save
2. `make -j2`
   * 2 = number of core of CPU
   * It will compile c files and generate object file
3. `sudo make modules_install`
4. `sudo make install`
5. `ls /boot/`
   * Check new installed kernel
6. `sudo update-grub`

