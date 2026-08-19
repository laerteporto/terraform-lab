# 🌍 Infraestrutura como Código com Terraform

O **Terraform**, criado pela HashiCorp, é uma ferramenta de **Infraestrutura como Código (IaC)** que permite **criar, modificar e versionar** recursos de infraestrutura de forma automatizada e consistente.  
Em vez de configurar servidores manualmente, você descreve tudo em **arquivos declarativos** — e o Terraform faz o resto.

---

## 📖 O que é “Infraestrutura como Código”?

Pense na infraestrutura como uma **receita de bolo**:
- Os **ingredientes** são os recursos (máquinas virtuais, redes, bancos de dados).
- A **receita** é o código Terraform que descreve como tudo deve ser preparado.
- O **bolo pronto** é o ambiente criado automaticamente — igual toda vez que você executa o código.

➡️ **Figura mental**:
- Sem Terraform → você cria recursos manualmente em cada provedor (AWS, Azure, GCP).  
- Com Terraform → você escreve o código uma vez e o Terraform constrói tudo para você, onde quiser.

---

## 🔑 Conceitos principais

- **[Providers](ca://s?q=O_que_sao_providers_no_Terraform)** → Conectores que permitem ao Terraform interagir com diferentes plataformas (AWS, Azure, Google Cloud, VMware, etc.).
- **[Resources](ca://s?q=O_que_sao_resources_no_Terraform)** → Elementos que você quer criar (máquinas, redes, buckets, etc.).
- **[Variables](ca://s?q=Como_usar_variables_no_Terraform)** → Parâmetros reutilizáveis para tornar o código flexível.
- **[State](ca://s?q=O_que_e_state_no_Terraform)** → Arquivo que guarda o estado atual da infraestrutura.
- **[Modules](ca://s?q=O_que_sao_modules_no_Terraform)** → Conjuntos de código reutilizáveis para padronizar ambientes.

---

## 📊 Fluxo do Terraform

O diagrama abaixo ilustra o fluxo de trabalho do Terraform:

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/5993d18d-d255-447f-8855-119d604808b5" />


