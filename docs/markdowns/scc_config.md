# Centre de sécurité et de conformité

## Génération des autorisations pour SCC

Un clef d'enregistrement SCC est requise pour enregistrer un collecteur SCC avec l'outil. Pour chaque collecteur, une nouvelle clef d'enregistrement est requise.

1. Ouvrir la console IBM Cloud et aller à [**Security and Compliance** tool]( https://cloud.ibm.com/security-compliance/overview).
2. Sous **Manage Posture**, cliquer sur **Configure** > **Settings**.
3. Sur l'onlet **Collectors**, cliquer sur **Create**. Fournir les valeurs suivantes:
    - **Name**: Saisir un nom pour le collecteur.
    - **Collector Endpoint**: `Endpoint privé`
4. Cliquer sur **Create** afin de créer le collecteur.
5. À partir de l'onglet **Collectors**, cliquer sur le collecteur ue vous venez de créer afin de visualiser les informations du collecteur.
6. Copier la valeur de **Registration key**. Ceci sera requis dans le script Terraform pour démarrer le collecteur SCC.

## Enregistrer une clef API avec SCC

Configurer la clef API pour SCC

1. Ouvrir la console IBM Cloud et aller à [**Security and Compliance** tool]( https://cloud.ibm.com/security-compliance/overview).
2. Sous **Manage Posture**, cliquer sur **Configure** > **Settings**.
3. Ouvrir l'onglet **Credentials** et clique sur **Create** pour créer la nouvelle autorisation en utilisant les valeurs suivantes:
   - **Name**: Sasir un nom pour l'autorisation
   - **Purpose**: `Discovery/Collection`
4. Cliquer **Next** pour aller à la page suivante. Fournir les valeurs suivantes:
   - **Credential type**: `IBM Cloud`
   - **IBM API key**: Votre clef API du IBM Cloud
5. Cliquer **Create** pour enregistrer votre clef API.


## Surveillance des ressouces avec SCC


### Configurer le collecteur SCC et d'installation

1. Aller à la console SCC [ici](https://cloud.ibm.com/security-compliance/overview).

2. Sur la page Manage posture > Configure > Settings > Collectors page of the Security and Compliance Center, Cliquer Create.
3. Donner un nom et une description à votre collecteur.
**Note Le nom devait être unique car les suppressions précédentes sont des suppressions progressives et ne vous permettent pas d'en créer une nouvelle à moins que vous n'ayez donné un nom unique..**
4. Dans le champs Managed by field, choisir IBM.
    - Par défaut, Private endpoint est le type choisis.
    - Un collecteur demande un communitcation constante avec le service afin de valider l'état.
    - Par défaut, un private endpoint est utilisé pour toutes les communications des collecteurs IBM.
5. Cliquer sur Create. Lorsque le collecteur est créé, le status devient Installing.
    - À ce point, le collecteur devrait devenir disponible après 1 min 30 sec.
    - Après ce temps, vous pouvez rafraichir le status et valider si le status est à Inactive. Exécuter une tâche ivoque le collecteur et celui-ci deviendra actif. Typiquement, le collecteur tombe en mode Inactif après 15 minutes d'inactivité.

6. Lorsque le collecteur est prêt, le status devrait être `Active`.

### Créer des périmètres (Scope)

Lorsue vous travaillez avec le Centre de sécurité et de conformité, vous pouvez concentrer vos analyses sur un environnement, une région ou même une ressource spécifique. En créant des périmètres, vous pouvez déterminer votre score de sécurité et de conformité dans un domaine spécifique de votre entreprise.

1.	Sur la page Scopes de [Security and Compliance Center](https://cloud.ibm.com/security-compliance/scopes), Clique sur l'icone Create scope.
2.	Donner un nom significatif à votre périmètre (Scope) et une description.
3.	Choisir un environnement `IBM Cloud`.
4.	Choisir créer un "Credential".
5.	Choisir créer un "Collector".
6.	Cliquer sur `Next`.
7.	Une fois le périmètre (Scope) créé, Une fois que l'étendue est créée, vous pouvez voir les détails sur Manage Posture > Configure > Scopes > Choisir celui que vous vez créé lors des étapes précédentes.
Cela donnera une vue d'ensemble du périmètre (Scope) créé plus tôt
    - Credentials Tab: Vous pouvez ajouter de nouvelles autorisations, mais pas en effacer.
    - Collectors Tab: Mettre a jour le collecteur.
    - Inventory Tab: Cliquer sur Edit Click Edit on top right corner of Inventory Tab et sélectionnez les ressources pour lesquelles vous voulez définir l'analyse et réduire la portée de l'analyse.

Pour plus d'information, cliquer [ici](https://cloud.ibm.com/docs/security-compliance?topic=security-compliance-scopes)

### Planification de l'analyse

Pour découvrir les ressources, évaluer la configuration et valider la conformité par rapport à un profil prédéfini, vous pouvez programmer une analyse de validation.
1.	Sur la page Scans > Scheduled de [Security and Compliance Center](https://cloud.ibm.com/security-compliance/scans), clique sur  Schedule. Un panneau latéral s'ouvre.
2.	Donnez à votre analyse un nom et une description significatifs. De préférence sans caractères spéciaux.
3.	Sélectionner le type de Scan à `Validation`.
4.	Sélectionner le périmètre (Scope) créé plus tôt.
5.	Sélectionner le profile pour “[Predefined] IBM Cloud for Financial Services v0.1” à partir du menu déroulant.
•	Les contrôles configurés pour `[Predefined] IBM Cloud for Financial Services v0.1` se retrouve [ici](https://cloud.ibm.com/security-compliance/profiles/768?details=controls&type=1).
6.	Choisir la préférence de réhabilitation (Remediation) (`Automatic/Approved/None`).
7.	Choisir la fréquence à laquelle l'analyse doit s'exécuter.
8.	Choirir quand vous voulez que l'analyse se termine. (`Never/A specific number of occurrences/On a set date`).
9.	Cliquer sur `Create`.
10.	Une fois que l'analyse est démarré, il apparaîtra dans la section des analyses planifiés, une fois l'analyse réussi, il peut être visualisé dans la section des analyses planifiés du centre de sécurité et de la conformité.

### Rapports SCC

Si vous devez conserver vos résultats pendant de longues périodes, ou fournir des informations aux principales parties prenantes, vous pouvez télécharger un rapport qui détaille votre score de conformité pour les champs d'application sélectionnés.
1.	Dans la console IBM Cloud, cliquer sur l'icone > Security and Compliance.
2.	Dans la section Manage, cliquer sur Assess > Scans.
3.	Sélectionner l'analyse avec laquelle vous désirez faire un rapport.
    - Cette vue du tableau de bord présente les résultats des validations pour chaque portée que vous avez définie. Vous pouvez voir comment les résultats de vos analyses affectent votre score global de conformité dans la section `Control view`.
    - Le score de conformité des objectifs peut être critique, élevé, moyen ou faible. Les objectifs critiques ont un impact beaucoup plus important sur vos scores de conformité et de sécurité qu'un objectif de faible gravité.
    - Les résultats peuvent être consultés spécifiquement pour chaque ressource scannée sous la rubrique `Resource View`.
4.	Sous Control view, cliquer sur Download report. Un panneau latéral s'ouvre.
    - Parfois, cette option est désactivée, rafraichir le navigateur peu régler le problème.
5.	Sélectionner le type de rapport, incluant pdf, xlsx ou différence des anciennes analyses. Clique sur Next.
    - Recommandation: pdf
6.	Choisir les détails à inclure dans le rapport.
    - Recommandation: Détails du périmètre (Scope), sommaire de l'analyse, Détail de l'analyse(Pass, Fail, Unable to Perform, Not applicable).
7.	Cliquer sur Download. Le fichier sera télécharger sur votre poste de travail.
    - Générer des pdfs et parfois provoque le téléchargement d'un fichier corrompu qui ne signifie pas que l'exploration n'est pas réussie. C'est un problème connu et parce que le nom de l'exploration était `SFTP_EH - Validación de hechos` en espagnol, avec un caractère spécial ó.
    En changeant les préférences de langue du navigateur en anglais, le nom du scan a été attribué à `SFTP_EH - Fact Validation`, et ça marche comme sur des roulettes. tldr : Vérifiez que le nom du scan n'a pas de caractère spécial.

Informations complémentaires et caractéristiques du centre de sécurité et de conformité (SCC) se trouve [ici](https://cloud.ibm.com/docs/security-compliance?topic=security-compliance-getting-started)
