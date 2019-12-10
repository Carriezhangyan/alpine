## 这个项目是基于alpine:3.9来制作samba服务的镜像，，支持多目录挂载
## 基于 alpine:3.9 制作镜像命令：
## 先把这个目录中的所有文件下载下来，，然后制作镜像 ，启动容器，运行服务
## 制作镜像/容器命令：docker build -t alpine:v1 . 
## 运行制作的容器： docker run -itd --name samba -p 139:139 -p 445:445 -v /opt/share:/opt/share alpine:v1 
 # 如果多目录挂载则增加多个-v参数： docker run -itd --name samba -p 139:139 -p 445:445 -v /opt/share:/opt/share -v /opt/share2:/opt/share2 alpine:v1 
	## 参数解析：
	## -itd 后台运行
	## -p ：samba服务启动需要139和445的端口
	## -v ：samba授权的目录
	## 该项目在制作容器的时候已经创建samba授权用户为shareuser，密码是shareuser
## 查看docker进程： docker ps -a  
	## 如果看到容器启动成功，则进行下一步
## 进入容器查看进程或者直接测试smaba服务是否安装成功
	## 测试服务是否成功： 
		## windows系统，文件查找输入ip，
		## 跳出权限认证界面，，输入用户名和密码（ shareuser / shareuser ）
		## 能看到共享目录share
		## 则docker环境搭建smaba服务成功
