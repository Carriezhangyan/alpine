## 这个项目是基于alpine:3.9来制作samba服务的镜像，，支持多目录挂载

## 基于 alpine:3.9 制作镜像命令：
	# docker pull alpine:3.9

## 先把这个目录中的所有文件下载下来，，然后制作镜像 ，启动容器，运行服务
## 制作镜像/容器命令：
	# docker build -t alpine:nfs . 

## 运行制作的容器：
 #需要注意一点：nfs服务需要加入授权参数  --privileged ，如果不加这个参数，客户端挂载会报错拒绝连接
	# docker run -itd --name nfs --privileged -p 2049:2049 -v /opt:/opt alpine:nfs

# 如果多目录挂载，只需要注意文件 exports 的修改： 
	/opt    *(rw,no_root_squash,no_subtree_check,fsid=0
	/opt/share1    *(rw,no_root_squash,no_subtree_check)
## 需要注意的参数部分： 
	fsid=0 指定根目录，，alpine环境中必须指定一个根目录，否则rpc.mount服务启动失败
	第二个目录共享必须处于第一个指定的根目录之中，暂时没找到同级目录共享的方法
	
## 查看docker进程： 
	# docker ps -a  
## 如果看到容器启动成功，则进行下一步

## 进入容器查看进程或者直接测试smaba服务是否安装成功
 ## 测试服务是否成功： 
	## 登陆客户端，安装nfs服务,不要启动nfs服务：
		# yum -y install nfs-utils
	## mount 挂载 测试：
		# mount -v nfs-server-ip:/ /mnt/share
		# mount -v nfs-server-ip:/share1 /mnt/share1    ## 如果有第二个共享目录的话
	## 查看挂载情况：
		# df -ah
	## 如果mount挂载成功，则docker环境搭建nfs服务成功
