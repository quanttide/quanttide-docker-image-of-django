# Author: 张果
# Updated Date: 2021-12-28

# ----- 拉取环境 -----

# 从仓库拉取带有Python 3.9.9的Linux 环境
FROM python:3.9.9-buster

# 设置Python环境变量
# 直接返回Python程序运行结果到Termainal
# 参考：https://stackoverflow.com/questions/59812009/what-is-the-use-of-pythonunbuffered-in-docker-file/59812588
ENV PYTHONUNBUFFERED 1


# ----- 安装MySQL库的依赖 -----

RUN echo \
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free \
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free \
    deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free \
    deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free \
        > /etc/apt/sources.list
RUN apt-get update && apt-get install python3.9-dev default-libmysqlclient-dev -y


# ----- 安装Django默认依赖 -----

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
  && pip install Django==4.0.0 djangorestframework==3.13.1 gunicorn==20.1.0 \
    django-environ==0.8.1 django-project-version==0.16.0 django-cors-headers==3.10.1\ 
    mysqlclient==2.1.0