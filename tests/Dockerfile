FROM debian:11

ARG ANSIBLE_EXTRA_ARGS ""

RUN apt-get update -y && apt-get -y install python3-pip sudo
RUN pip install ansible

RUN useradd -m ansible && echo "ansible:ansible" | chpasswd && adduser ansible sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY . /ansible
WORKDIR /ansible

USER ansible
RUN ansible-playbook -i "localhost," playbook.yml $ANSIBLE_EXTRA_ARGS

WORKDIR /home/ansible
