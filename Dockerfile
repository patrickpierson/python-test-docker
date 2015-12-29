# Python 3.5.1 dockerfile

# Pull base centos image
FROM centos

# Yum update
RUN yum update -y

# yum install packages needed to compile python
RUN yum install make gcc gcc-c++ vim bzip2 wget zlib zlib-devel openssl openssl-devel -y

# Download Python 3.5.1
RUN wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz

# Extract Python 3.5.1 to /tmp
RUN tar xzvf Python-3.5.1.tgz --directory /tmp/

# Configure Python 3.5.1
RUN cd /tmp/Python-3.5.1 && ./configure

# Make Python 3.5.1
RUN cd /tmp/Python-3.5.1 && make

# Make install Python 3.5.1
RUN cd /tmp/Python-3.5.1 && make install

# Verify Python version
RUN python3 --version

# Remove builds
RUN rm -rf /tmp/Python-3.5.1 && rm -rf /Python-3.5.1.tgz
