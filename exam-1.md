# 配置虚拟机网络和SSH服务

一，查看本机的网络接口eth0配置文件：

使用的命令：cat  /etc/sysconfig/network-scripts/eth0
 ![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%871.png?raw=true)
二，修改本机网络接口eth0的配置文件：

使用的命令：vi  /etc/sysconfig/network-scripts/eth0
![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%872.png?raw=true)   
如上图所示，设置eth0的ip地址，子网掩码，网关等。

三 ，测试是否能联网
    
使用命令ping  id地址，测试是否能联网。
![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%873.png?raw=true)  
如图所示，联网成功。


四，安装ssh服务器

使用命令：yum install openssh-server
 ![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%874.png?raw=true)
如图所示，安装成功。

五，开启ssh服务

使用命令：service sshd start，

但是系统提示用/bin/systemctl start sshd.service
![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%875.png?raw=true)  
随后使用系统提示的命令能成功开启或者关闭ssh服务。


六，使用putty软件远程登入linux
![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%876.png?raw=true)
如图所示，远程登陆已经成功。