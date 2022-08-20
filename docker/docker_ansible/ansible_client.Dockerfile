FROM debian:10-slim

RUN apt-get update 
RUN apt-get install -y python3 penssh-server vim net-tools telnet

#By default Debian don't install sudo, then we have to install it
RUN apt-get install sudo -y

#create ansible user
RUN useradd -s /bin/bash -d /home/ansible/ -m -G sudo ansible
RUN passwd ansible ansible
    

RUN mkdir /var/run/sshd
RUN echo 'root:ansible' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]