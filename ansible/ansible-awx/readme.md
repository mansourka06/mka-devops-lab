# Ansible Tower

## Description

- Ansible Tower is an enterprise automation platform that enables you to centrally manage and control your Ansible infrastructure and automation workflows. 
- It provides a web-based interface and REST API, making it easier to scale and streamline IT operations. Ansible Tower allows you to schedule, track, and manage Ansible playbooks and roles efficiently. 
- Tower enhances security and collaboration among teams, enabling seamless automation across the entire organization. It serves as the control center for Ansible automation, simplifying complex tasks and accelerating the delivery of applications and services. Ansible Tower is developed and supported by Red Hat.


## Installation Steps

1. **Clone the repository:**
```bash
git clone https://github.com/mansourka06/mka_devops_lab.git

```

2. **Browse to tower directory:**

```bash
cd tower/
```

3. Unarchive tower install package:
```bash
tar -xzvf awx.tar.gz -C ~/
```

4. **Copie docker-compose.yml file to tower home directory:**

```bash
cp docker-compose.yml ~/.awx/awxcompose/
```

5. **Go to tower home directory:**

```bash
cd ~/.awx/awxcompose/
```

6. **Start AWX using Docker Compose:**
```bash
docker-compose up -d
```

## AWX Interface

1. **Access**: with our ansible lab ip adress from our navigator (example: 192.168.100.10)

2. **Credentials**: admin/passord


## Author
* [Mansour KA](http://mansourka.com)
