FROM debian:12

ARG ANSIBLE_EXTRA_ARGS ""

RUN apt-get update -y && apt-get -y install python3-pip python3-venv sudo curl git

RUN python3 -m venv /opt/ansible && /opt/ansible/bin/pip install ansible

RUN useradd -m ansible && echo "ansible:ansible" | chpasswd && adduser ansible sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY . /ansible
WORKDIR /ansible

USER ansible
ENV PATH="/opt/ansible/bin:$PATH"
RUN ansible-playbook -i "localhost," playbook.yml $ANSIBLE_EXTRA_ARGS

WORKDIR /home/ansible
