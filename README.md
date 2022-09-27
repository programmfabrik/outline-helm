# outline

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.66.0](https://img.shields.io/badge/AppVersion-0.66.0-informational?style=flat-square)

Deploy [outline](https://github.com/outline/outline) with helm.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql-ha | 9.4.3 |
| https://charts.bitnami.com/bitnami | redis | 17.1.6 |
| https://charts.min.io/ | minio | 4.0.14 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `5` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"outlinewiki/outline"` |  |
| image.tag | string | `"0.66.0"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts[0].host | string | `"localhost"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| minio | object | `{"buckets":[{"name":"outline","objectlocking":false,"policy":"none","purge":false,"versioning":true}],"consoleIngress":{"annotations":{},"enabled":true,"hosts":["console.minio.localhost"],"ingressClassName":"nginx","labels":{},"path":"/","tls":[]},"enabled":true,"image":{"pullPolicy":"IfNotPresent","repository":"quay.io/minio/minio","tag":"RELEASE.2022-09-01T23-53-36Z"},"ingress":{"annotations":{},"enabled":true,"hosts":["minio.localhost","*.minio.localhost"],"ingressClassName":"nginx","labels":{},"path":"/","tls":[]},"persistence":{"accessMode":"ReadWriteOnce","enabled":true,"size":"50Gi","storageClass":""},"policies":[{"name":"outlinebucketrw","statements":[{"actions":["s3:*"],"conditions":[{"StringEquals":"\"aws:username\": \"outline\""}],"resources":["arn:aws:s3:::outline/*"]}]}],"projectName":"minio","replicas":3,"resources":{"requests":{"cpu":"100m","memory":"1Gi"}},"rootPassword":"minio123","rootUser":"minio","users":[{"accessKey":"outline","policy":"outlinebucketrw","secretKey":"outlinesecret123"}]}` | minio deployment (s3 storage) for more information see: https://github.com/minio/minio/tree/master/helm/minio |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| outline.authentication | object | `{"azure":{},"gitlab":{},"google":{},"oidc":{},"saml":{},"slack":{}}` | The SMTP secure connection secure: false |
| outline.authentication.azure | object | `{}` | The azure OAuth2 Client settings |
| outline.authentication.gitlab | object | `{}` | The Gitlab OAuth2 Client settings |
| outline.authentication.google | object | `{}` | The Google OAuth2 Client settings |
| outline.authentication.oidc | object | `{}` | The OIDC client settings |
| outline.authentication.saml | object | `{}` | The SAML client settings |
| outline.authentication.slack | object | `{}` | The Slack OAuth2 Client settings |
| outline.certTrusts | object | `{}` | certTrusts defines a list of certificates that must be trusted to work with tls. Based on this setting, we create an init container that adds the certTrusts entries to the /etc/ssl/certs/ca-certificates.crt file. We expect the value to be in the format key=value. The key should be the name of the certificate and the value should be the actual certificate. |
| outline.config.allowedDomains | string | `""` | Comma separated list of domains to be allowed to signin to the wiki. If not set, all domains are allowed by default when using Google OAuth to signin |
| outline.config.collaborationURL | string | `""` | See [documentation](docs/SERVICES.md) on running a separate collaboration server, for normal operation this does not need to be set. |
| outline.config.debug | string | `"http"` | Configures the modules to be logged to the console. sql,cache,presenters,events,importer,exporter,emails,mailer,http |
| outline.config.defaultLanguage | string | `"en_US"` | The default interface language. See translate.getoutline.com for a list of available language codes and their rough percentage translated. |
| outline.config.enableUpdates | bool | `false` | Have the installation check for updates by sending anonymized statistics to the maintainers |
| outline.config.forceHTTPS | bool | `false` | Auto-redirect to https in production. The default is true but you may set to false if you can be sure that SSL is terminated at an external loadbalancer. |
| outline.config.googleAnalyticsId | string | `""` | Optionally enable google analytics to track pageviews in the knowledge base |
| outline.config.maxImportSize | int | `5120000` | Override the maxium size of document imports, could be required if you have especially large Word documents with embedded imagery |
| outline.config.sentryDSN | string | `""` |  |
| outline.config.teamLogo | string | `""` | Custom logo that displays on the authentication screen, scaled to height=60px |
| outline.config.url | string | `"http://localhost"` | URL should point to the fully qualified, publicly accessible URL. If using a proxy the port in URL and PORT may be different. |
| outline.config.webConcurrency | int | `1` | How many processes should be spawned. As a reasonable rule divide your servers available memory by 512 for a rough estimate |
| outline.db | object | `{"connectionPoolMax":10,"connectionPoolMin":2,"database":"outline","host":"postgres","password":"outline","port":5432,"sslmode":"disable","user":"outline"}` | The database configuration used to connect outline to a postgres database. |
| outline.db.connectionPoolMax | int | `10` | The database maximum connection pool size. |
| outline.db.connectionPoolMin | int | `2` | The database minimum connection pool size. |
| outline.db.database | string | `"outline"` | The database name. |
| outline.db.host | string | `"postgres"` | The database host. |
| outline.db.password | string | `"outline"` | The database password. |
| outline.db.port | int | `5432` | The database port. |
| outline.db.sslmode | string | `"disable"` | The database ssl-mode. |
| outline.db.user | string | `"outline"` | The database username. |
| outline.integration.slack | object | `{}` |  |
| outline.mail | object | `{}` |  |
| outline.redis.url | string | `"redis://redis:6379"` | For redis you can either specify an ioredis compatible url like: redis://localhost:6379 or alternatively, if you would like to provide addtional connection options, use a base64 encoded JSON connection option object. Refer to the ioredis documentation for a list of available options. Example: Use Redis Sentinel for high availability {"sentinels":[{"host":"sentinel-0","port":26379},{"host":"sentinel-1","port":26379}],"name":"mymaster"} example: ioredis://eyJzZW50aW5lbHMiOlt7Imhvc3QiOiJzZW50aW5lbC0wIiwicG9ydCI6MjYzNzl9LHsiaG9zdCI6InNlbnRpbmVsLTEiLCJwb3J0IjoyNjM3OX1dLCJuYW1lIjoibXltYXN0ZXIifQ== |
| outline.s3.accessKey | string | `"outline"` | The AWS S3 bucket access key |
| outline.s3.acl | string | `"private"` | The AWS S3 bucket ACL |
| outline.s3.bucket | string | `"outline"` | The AWS S3 bucket name |
| outline.s3.endpoint | string | `"minio:9000"` | The AWS S3 bucket endpoint |
| outline.s3.forcePathStyle | bool | `false` | Whether to force path style URLs |
| outline.s3.maxUploadSize | string | `"10000000"` | The AWS S3 max file size in bytes |
| outline.s3.prefix | string | `""` | The AWS S3 bucket prefix |
| outline.s3.region | string | `"us-east-1"` | The AWS S3 bucket region |
| outline.s3.secretKey | string | `"outline"` | The AWS S3 bucket secret key |
| outline.secrets.key | string | `"3c510bcb7d0c4891f7142980a7738a09581546d1ed256603ae87a910d84c61b2"` | Generate a hex-encoded 32-byte random key. You should use `openssl rand -hex 32` in your terminal to generate a random value.  Please note that this value should be kept secret and should not be shared with anyone. We recommend to change this value before deploying Outline. |
| outline.secrets.secret | string | `"b135928dd54c072bc8d7ebf1b1af76954d4dd657276f05cb58d81d4da3177ac9"` | Generate a unique random key. The format is not important but you could still use `openssl rand -hex 32` in your terminal to produce this.  Please note that this value should be kept secret and should not be shared with anyone. We recommend to change this value before deploying Outline. |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql-ha | object | `{"enabled":true,"persistence":{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"10Gi","storageClass":""},"pgpool":{"adminPassword":"outline","adminUsername":"outline","tls":{"autoGenerated":true,"enabled":true}},"postgresql":{"database":"outline","image":{"registry":"docker.io","repository":"bitnami/postgresql-repmgr","tag":"14.5.0-debian-11-r13"},"password":"outline","resources":{"limits":{"cpu":"2000m","memory":"2Gi"},"requests":{"cpu":"250m","memory":"512Mi"}},"username":"outline"}}` | postgresql deployment for more information see: https://github.com/bitnami/charts/tree/master/bitnami/postgresql-ha |
| redis | object | `{"auth":{"enabled":false},"enabled":true,"master":{"persistence":{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"10Gi","storageClass":""}},"projectName":"redis","replica":{"persistence":{"accessModes":["ReadWriteOnce"],"enabled":true,"size":"10Gi","storageClass":""},"replicaCount":3}}` | redis deployment for more information see: https://github.com/bitnami/charts/tree/master/bitnami/redis |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `3000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |
