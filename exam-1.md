# ��������������SSH����

һ���鿴����������ӿ�eth0�����ļ���

ʹ�õ����cat  /etc/sysconfig/network-scripts/eth0
 ![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%871.png?raw=true)
�����޸ı�������ӿ�eth0�������ļ���

ʹ�õ����vi  /etc/sysconfig/network-scripts/eth0
![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%872.png?raw=true)   
����ͼ��ʾ������eth0��ip��ַ���������룬���صȡ�

�� �������Ƿ�������
    
ʹ������ping  id��ַ�������Ƿ���������
![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%873.png?raw=true)  
��ͼ��ʾ�������ɹ���


�ģ���װssh������

ʹ�����yum install openssh-server
 ![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%874.png?raw=true)
��ͼ��ʾ����װ�ɹ���

�壬����ssh����

ʹ�����service sshd start��

����ϵͳ��ʾ��/bin/systemctl start sshd.service
![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%875.png?raw=true)  
���ʹ��ϵͳ��ʾ�������ܳɹ��������߹ر�ssh����


����ʹ��putty���Զ�̵���linux
![](https://github.com/shuhongxin/train1/blob/master/%E5%9B%BE%E7%89%876.png?raw=true)
��ͼ��ʾ��Զ�̵�½�Ѿ��ɹ���