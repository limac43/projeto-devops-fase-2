# 🚀 Automação de Infraestrutura AWS com Terraform (Fase 2)

Projeto prático de **Infraestrutura como Código (IaC)** desenvolvido como parte do laboratório prático de DevOps. O objetivo principal é substituir o provisionamento manual por código declarativo, garantindo rastreabilidade, escalabilidade, segurança e idempotência na nuvem **AWS**.

---

## 📌 Arquitetura e Recursos Provisionados

O projeto automatiza a criação e configuração dos seguintes componentes:

* **Amazon ECR (*Elastic Container Registry*):** Repositório gerenciado para armazenamento seguro e versionamento de imagens Docker.
* **Amazon EC2:** Instância computacional para execução dos containers da aplicação.
* **AWS IAM Role & Instance Profile:** Permissão granular atrelada à EC2 para permitir autenticação e *pull* de imagens no ECR sem a necessidade de chaves fixas (hardcoded access keys).
* **AWS Security Group:** Controle de firewall configurado para:
  * **Entrada (Ingress):** Tráfego web via **HTTP (80)**, **HTTPS (443)** e acesso administrativo via **SSH (22)** restrito.
  * **Saída (Egress):** Regra de saída completa liberando conexão com a internet para downloads de pacotes e dependências.
* **Remote Backend (S3):** Gerenciamento centralizado e seguro do estado da infraestrutura (`terraform.tfstate`) em bucket S3, facilitando a colaboração em equipe e evitando conflitos de concorrência.

---

## 📂 Estrutura de Arquivos

```plaintext
Terraform/
├── provider.tf        # Configuração do provedor AWS e versão mínima exigida
├── backend.tf         # Configuração do Remote Backend no Amazon S3
├── ecr.tf             # Definição do repositório AWS ECR
├── ec2.tf             # Provisionamento da instância EC2 e associação da IAM Role
├── secutirygroup.tf   # Regras de Security Group (Inbound / Outbound)
└── .gitignore         # Exclusão de arquivos sensíveis e binários (.terraform, .tfstate)
