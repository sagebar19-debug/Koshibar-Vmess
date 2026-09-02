# KÖSHÏBÄR VMess + WebSocket

Configuration Xray VMess + WebSocket destinée à être déployée sur Google Cloud Run.

## Fichiers

```text
koshibar-vmess/
├── Dockerfile
├── config.json
└── README.md

Configuration

Le serveur utilise :

- Protocol : VMess
- Transport : WebSocket
- WebSocket path : "/vmess"
- UUID : à remplacer dans "config.json"
- Port interne : "8080"
- Port Cloud Run : variable "$PORT"

UUID

Dans "config.json", remplace :

11111111-1111-1111-1111-111111111111

par ton UUID.

Exemple :

"id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

Construction de l'image

gcloud builds submit --tag gcr.io/PROJECT_ID/koshibar-vmess

Remplace "PROJECT_ID" par l'ID de ton projet Google Cloud.

Déploiement Cloud Run

gcloud run deploy koshibar-vmess \
  --image gcr.io/PROJECT_ID/koshibar-vmess \
  --platform managed \
  --region REGION \
  --allow-unauthenticated \
  --port 8080

Remplace :

PROJECT_ID
REGION

par les valeurs de ton projet.

Paramètres VMess

Après le déploiement :

Address : domaine Cloud Run ou domaine personnalisé
Port    : 443 si HTTPS est utilisé devant Cloud Run
UUID    : ton UUID
AlterId : 0
Security: auto
Network : ws
Path    : /vmess
Host    : ton domaine
TLS     : TLS

Exemple de lien VMess

Le lien doit utiliser ton domaine HTTPS :

vmess://...

Paramètres essentiels :

Protocol : VMess
Network  : ws
Path     : /vmess
TLS      : true
Port     : 443

Important

Cloud Run fournit HTTPS au niveau de son infrastructure. Le conteneur Xray écoute donc en HTTP/WebSocket sur le port fourni par la variable d'environnement "PORT".

Le Dockerfile remplace automatiquement le port "8080" du fichier "config.json" par la valeur de "$PORT" fournie par Cloud Run.

Ne configure pas Xray pour écouter directement sur le port 443 à l'intérieur du conteneur Cloud Run.

Vérification

Après le déploiement, vérifier les logs :

gcloud run services logs read koshibar-vmess \
  --region REGION

Le service doit démarrer Xray sans erreur de configuration.
