FROM debian:12

ARG ANSIBLE_EXTRA_ARGS ""

RUN apt-get update -y && apt-get -y install python3-pip python3-venv sudo curl git

COPY requirements.txt /tmp/requirements.txt
RUN python3 -m venv /opt/ansible && /opt/ansible/bin/pip install -r /tmp/requirements.txt

RUN useradd -m ansible && echo "ansible:ansible" | chpasswd && adduser ansible sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY . /ansible
WORKDIR /ansible

RUN /opt/ansible/bin/ansible-galaxy install -r requirements-ansible.yml

USER ansible
ENV PATH="/opt/ansible/bin:$PATH"
RUN ansible-playbook -i "localhost," playbook.yml $ANSIBLE_EXTRA_ARGS

WORKDIR /home/ansible
