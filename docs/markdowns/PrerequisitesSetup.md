### Configuration d'un compte IBM Cloud

Un compte IBM Cloud est requis. Un compte d'entreprise est recommandé mais un service "Pay as you Go" est suffisant pour déployer la zone d'accueil. 

Si vous ne possédez pas de compte, suivez les instructions suivantes: [Création d'un compte](https://cloud.ibm.com/docs/account?topic=account-account-getting-started#account-gs-createlite) et [Mise à niveau Pay-as-you-Go](https://cloud.ibm.com/docs/account?topic=account-account-getting-started#account-gs-upgrade)

- Vous possédez un compte [Compte IBM Cloud](https://cloud.ibm.com/docs/account?topic=account-account-getting-started). Un compte d'entreprise est recommandé mais un service "Pay as you Go" est suffisant pour déployer la zone d'accueil. 
- Installation de [IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-getting-started) et les outils associés.

### Configuration du compte IBM Cloud pour la zone d'accueil sécurisés

1. Se connecter au IBM Cloud [console](https://cloud.ibm.com) en utilisant votre compte. Ce compte IBMid est l'utilisateur __owner__ et possède tout les accès dans IAM.

2. [Compléter le profil de l'organisation et le contact](https://cloud.ibm.com/docs/account?topic=account-contact-info) pour ce compte. Ceci est requis pour rester conforme avec IBM Cloud services financiers.

3. [Activer l'indicateur](https://cloud.ibm.com/docs/account?topic=account-enabling-fs-validated) afin de désigner votre compte pour etre valider services financiers.

4. Activer "VRF" et "Service Endpoints". Ceci demande la création d'un ticket de service. Suivre [instructions](https://cloud.ibm.com/docs/account?topic=account-vrf-service-endpoint#vrf) soigneusement.

### Configurer l'accès du compte (Cloud IAM)

1. [Création d'une clef API IBM Cloud](https://cloud.ibm.com/docs/account?topic=account-userapikey#create_user_key). L'utilisateur propriétaire de la clef devrait faire parti de __admins__ group.

2. [Configuration de l'authentification multi-facteur pour tout les utilisateurs de IAM](https://cloud.ibm.com/docs/account?topic=account-account-getting-started#account-gs-mfa).

3. [Configurer un groupe d'accès IBM Cloud IAM](https://cloud.ibm.com/docs/account?topic=account-account-getting-started#account-gs-accessgroups). Les utilisateurs qui accèderont les ressources IBM Cloud seront contrôlés via une politique d'accès. Le profil IBM Cloud services financiers requiert que si l'utilisateur n'est pas assignés dans le groupe, l'utilisateur ne pourra accéder aux ressources IBM Cloud. Lorsque vous assignr les politiques d'accès, cliquer sur "All Identity Access Enabled Services" à partir menu déroulant.

### Création d'un accès IAM et de groupes de ressources pour les resources de la zone d'accueil sécurisés

1. [Création d'un groupe de ressource IBM Cloud](https://cloud.ibm.com/docs/account?topic=account-rgs) pour l'installation
    - Il est recommandé d'utiliser 2 groupes comme ci-dessus ou bien 1 seul:
      - Groupe de ressource Gestion
      - Groupe de ressource Traitement

2. [Ajouter un accès au groupe de ressource au groupe d'accès à la zone d'accueil sécurisée](https://cloud.ibm.com/docs/account?topic=account-groups).
   - Il est recommandé d'avoir un minimum de 2 groupes d'accè, 1 qui aura les groits de gestion et l'autre des droit de lecture.

### Configuration de la journalisation des évènements d'audit de IBM Cloud

**IMPORTANT: DOIT ÊTRE FAIT EN PREMIER, LE PROCESSUS PEUT PRENDRE QUELQUES JOURS.**

Le modèle IBM Cloud pour services financiers requiert la journalisation des activités avec COS (Cloud Object Stotage). [Pour voir plus d'instructions pour la configuration de la journalisation des audits d'évènements IBM Cloud ici](https://test.cloud.ibm.com/docs/allowlist/framework-financial-services?topic=framework-financial-services-vpc-architecture-logging-audit).

Utiliser le suivi d'activités pour collecter les évènements de journalisation qui sont générés pas services dans votre compte IBM Cloud. Le Bucket IBM Cloud Object Storage sera mis en place pour collecter les données de l'événement.

### Guide de configuration de GitHub

Le [guide de confiuration de GitHub](https://github.com/maire-kehoe/whitewater-ref-toolchain) détail comment autoriser Toolchains afin qu'il puisse accéder à votre répo Git d'entreprise et démarre l'installation.

### Jeton d'accès GitHub Enterprise et Personnel
Instruction pour authentifier le répo Git via HTTPS avec un jeton d'accès personnel peut
 être trouvé [ici](../markdowns/ghe_setup.md)

### Configuration des outils CLI
Les outils CLI suivants devrait être installé sur votre poste local.
Les instructions détaillés sont disponibles [ici](https://cloud.ibm.com/docs/cli?topic=cli-getting-started)

### 1. Installation de CLI IBM Cloud
Linux et MacOS
```bash
curl -sL https://raw.githubusercontent.com/IBM-Cloud/ibm-cloud-developer-tools/master/linux-installer/idt-installer | bash
```

Windows 10 Pro
```bash
[Net.ServicePointManager]::SecurityProtocol = "Tls12, Tls11, Tls, Ssl3"; iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/IBM-Cloud/ibm-cloud-developer-tools/master/windows-installer/idt-win-installer.ps1')
```

**Vérification de l'installation**
```bash
ibmcloud version
```

### 2. Install Terraform v0.13.5
MacOS
```bash
sudo mkdir -p /usr/local/terraform/v0135
cd /usr/local/terraform/v0135 && sudo curl https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_darwin_amd64.zip --output tf12.zip
sudo unzip tf12.zip
sudo mv terraform /usr/local/bin/terraform0135
ln -s /usr/local/bin/terraform0135 /usr/local/bin/terraform
```

Linux
```bash
sudo mkdir -p /usr/local/terraform/v0135
cd /usr/local/terraform/v0135 && sudo curl https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip --output tf12.zip
sudo unzip tf12.zip
sudo mv terraform /usr/local/bin/terraform0135
ln -s /usr/local/bin/terraform0135 /usr/local/bin/terraform
```

Windows
Télécharger le fichier binaire du CLI à partir dehttps://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_windows_amd64.zip et installer sur votre poste Windows.

**Vérification de l'installation**
```bash
terraform --version
```

### 3. Install jq
MacOS
```bash
brew install jq
```

Linux et Windows  
Trouver le fichier binaire jq qui convient à votre système d'exploitation Linux/Windows et démarrer l'installation avec l'outil d'installation approprié. Téléchargement [lien ici](https://stedolan.github.io/jq/download/).

**Vérification de l'installation**
```bash
jq version
```

De l'information additionnel concernant l'installation de Terraform se retrouve [ici](../markdowns/terraform_install.md)
