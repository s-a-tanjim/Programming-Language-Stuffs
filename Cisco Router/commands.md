# Router

1. \>`en`  => enable monitor mode
2. #`config t` => enable config mode

## Set router password
1. Router(config)# `hostname new_Name`
2. Router(config)# `line con 0`
3. Router(config)# `pass password`
4. Router(config)# `login`
5. Router(config)# `exit`

## Assign ip to fast ethernet port
1. Router(config)# `int f0/1`
2. Router(config)# `ip address 192.168.10.1 255.255.255.0`
3. Router(config)# `no shutdown`

## Assign ip to serial ethernet port
1. Router(config)# `int s0/0/0`
2. Router(config)# `ip address 192.168.10.1 255.255.255.0`
3. Router(config)# `clock rate 64000`
4. Router(config)# `no shutdown`

## Static routing in router
1. Router(config)# `ip route 192.168.20.0 255.255.255.0 192.168.10.2`
		          destination(next network)	 next hope(next router er ip)
2. Router(config)# `do copy running-config startup-config`



# Dynamic Routing
* RIP		
	**AD:120**
* EIGRP		
	**AD:90**
* OSPF (Open Short Path Fast)  
	**AD:110**

## RIP
1. (config)# `route rip`
2. (config-router)# `version 2`
3. (config-router)# `network 192.168.10.0` (direct connected network er ip)
4. (config-router)# `network 192.168.20.0`
5. (config-router)# `no auto-summary`   => for classless ip use
6. (config-router)# `exit`

### Remove RIP
* `no router rip` => remove RIP


## EIGRP
1. `router eigrp 10` (10=> AS => Autonomous System number) 'AS' number shobar same howa lagbe
2. `eigrp router-id 1.1.1.1` (Optional, Must be unique)
3. `network 192.168.10.0 0.0.0.255` (Wildcard mask=> inverse of subnet mask)
4. `network 192.168.20.0 0.0.0.255`
5. `no auto-summary`
6. `exit`

## OSPF 
* Area 0 => backbone area, backbone router
* Area border router
* Each area must be connected with backbone area. Jodi connected na thake then 
virtual link create kora lage

1. `en` => `config t`
2. `router ospf 1` (1 = process number range 1-65535)
3. `router-id 1.1.1.1` (Must for virtual link)
4. `network 192.168.10.0 0.0.0.255 area 0`
5. `network 192.168.20.0 0.0.0.255 area 1`
6. `exit`

* for virtual Link (virtual link 0&2 router(border er gula) e kora lagbe)
6. `network 192.168.40.0 0.0.0.255 area 2`
7. `area 1 virtual-link 1.1.1.1` (Destination router er id)
8. `area 1 virtual-link 3.3.3.3`



## Show table info
1. `show ip route`
2. `show ip eigrp topology`
3. `show ip eigrp neighbors`
4. `do show run`




# DHCP
* Router ip needs to config manually
* Then type those commands in Router (Not switch)
1. `ip dhcp pool PoolName`
2. `network 192.168.10.0 255.255.255.0`
3. `default-route 192.168.10.1` (Gateway)
4. `exit`

>For Excluding IP Address
* `ip dhcp excluded-address 192.168.10.2 192.168.10.22`




# ACL
1. Create access list
* Router(config)# `access-list 10 permit 192.168.10.3` => here number= 1-99 or 1300-1999

2.1 Assign access list (for in port)
* Router(config)# `int f0/1`
* Router(config-if)# `ip access-group 10 in`
* Router(config-if)# `ex`

2.2  Assign access list (for out port)
* Router(config)# `int f0/1`
* Router(config-if)# `ip access-group 10 out`
* Router(config-if)# `ex`

2.3 Assign access list (deny) (for in port)
* Router(config)# `access-list 32 deny 192.168.10.3`
* Router(config)# `access-list 32 permit any`
* Router(config)# `int f0/1`
* Router(config-if)# `ip access-group 32 out`
* Router(config-if)# `ex`


* Router(config)# `do sh access-lists` => Show access list
* Router(config)# `no access-list 10`  => Remove access list


# VLAN Infos
* VLAN Range
  * 0,4095 =>reserved
  * 1=>default 
  * 2-1001=>can be used

# VLAN (In Switch)

* Switch(config)# `vlan 2` // here, 2=ID
* Switch(config-vlan)# `name vlan_name`
* Switch(config-vlan)# `exit`
* Switch(config)# `int range f0/1-2`
* Switch(config-if-range)# `switchport mode access` //1ta vlan er under ei thakbe [not trunk link]
* Switch(config-if-range)# `switchport access vlan 2`
* Switch(config-if-range)# `exit`

* Switch(config)# `do show vlan`
* Switch(config)# `do show int` f0/0 sw
* Switch(config)# `no vlan 10` //10=id

## Trunk
* Switch(config)# `int range f0/1-2`
* Switch(config-if-range)# `switchport mode trunk`


# VTP

## Config server switch
* Switch(config)# `hostname vtpserver` =>change host name (optional)
* vtpserver(config)# `vtp domain nm`
* vtpserver(config)# `vtp password mist` => Domain name, password, mode
* vtpserver(config)# `vtp mode server`
* vtpserver(config)# `vlan 2`
* vtpserver(config-vlan)# `name cse`
* vtpserver(config-vlan)# `vlan 3 VLANs create and naming`
* vtpserver(config-vlan)# `name eece`
* vtpserver(config-vlan)# `exit`
* vtpserver(config)# `int range f0/1-2`
* vtpserver(config-if-range)# `switchport mode trunk`
* vtpserver(config-if-range)# `exit`
> Additional Instruction: `show vtp status`

## Client switch
* Switch(config)# `hostname vtpclient1`
* vtpclient1(config)# `vtp ver 2`
* vtpclient1(config)# `vtp domain nm`
* vtpclient1(config)# `vtp password mist`
* vtpclient1(config)# `vtp mode client`
* vtpclient1(config)# `int f0/1`
* vtpclient1(config-if)# `switchport mode access`
* vtpclient1(config-if)# `switchport access vlan 3`
* vtpclient1(config-if)# `int f0/2`
* vtpclient1(config-if)# `switchport mode access`
* vtpclient1(config-if)# `switchport access vlan 2`
* vtpclient1(config-if)# `exit`


# InterVLAN
* Layer 3 (Router on a stick)
* Router to Switch => Crossover cable

* Router(config)# `int f0/0`
* Router(config-if)# `no shutdown`
* Router(config-if)# `int f0/0.10`  => .10=ID //sub interface ID
* Router(config-subif)# `encapsulation dot1q 2`   //Vlan ID
* Router(config-subif)# `ip address 192.168.10.1 255.255.255.0`
* Router(config-subif)# `ip dhcp pool r1`
* Router(dhcp-config)# `network 192.168.10.0 255.255.255.0`
* Router(dhcp-config)# `default-router 192.168.10.1`
* Router(dhcp-config)# `exit`
