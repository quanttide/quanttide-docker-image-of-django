# ----- 拉取环境 -----
# 从仓库拉取带有Python 3.7的Linux 环境
FROM python:3.7-buster

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
RUN apt-get update && apt-get install python3.7-dev default-libmysqlclient-dev -y


# ----- 安装Django默认依赖 -----

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
  && pip install Django==3.0.7 djangorestframework==3.12.2 gunicorn==20.1.0 \
    django-environ==0.4.5 mysqlclient==2.0.3 django-redis-cache==3.0.0