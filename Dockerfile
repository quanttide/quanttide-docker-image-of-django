# Author: 张果
# Updated Date: 2022-02-17

# ----- 拉取环境 -----

# 从仓库拉取带有Python 3.9的Debain 11环境
# bugfix: https://unix.stackexchange.com/questions/658324/apt-refuses-to-install-a-newer-version-of-a-package/658327
FROM python:3.9-slim-bullseye

# 设置Python环境变量
# 直接返回Python程序运行结果到Termainal
# 参考：https://stackoverflow.com/questions/59812009/what-is-the-use-of-pythonunbuffered-in-docker-file/59812588
ENV PYTHONUNBUFFERED 1


# ----- 安装MySQL库的依赖 -----

RUN apt-get update && apt-get install python3.9-dev default-libmysqlclient-dev build-essential -y


# ----- 安装Django默认依赖 -----

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
  && pip install Django==3.2.10 djangorestframework==3.13.1 django-cors-headers==3.10.1 django-project-version==0.16.0 GitPython==3.1.26 \
    gunicorn==20.1.0 mysqlclient==2.1.0