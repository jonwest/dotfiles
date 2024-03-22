function load_cloudflare_auth() {
  [[ -f "${HOME}/.secrets/cloudflare.key" ]] && export CLOUDFLARE_API_KEY=$(cat "${HOME}/.secrets/cloudflare.key");
  export CLOUDFLARE_EMAIL="jon.west@7shifts.com";
  export CLOUDFLARE_ACCOUNT_ID="e011ab287e091e7dfaabd7a41da6671c";
}

function get_cloudflare_workers() {
  load_cloudflare_auth;
  curl -X GET "https://api.cloudflare.com/client/v4/accounts/${CLOUDFLARE_ACCOUNT_ID}/workers/scripts" \
    -H "X-Auth-Email: ${CLOUDFLARE_EMAIL}" \
    -H "X-Auth-Key: ${CLOUDFLARE_API_KEY}" \
    -H "Content-Type: application/json";
}

function gkedata {
  echo "connecting to data cluster"
  gcloud config set project webapp-data
  gcloud container clusters get-credentials gke-datascience --region=us-east1
  export SEALED_SECRETS_CERT="$HOME/.secrets/webapp-data.crt"
}

function gkedo {
  echo "connecting to devops cluster"
  gcloud config set project webapp-devops
  gcloud container clusters get-credentials admin --region=us-east1
  export SEALED_SECRETS_CERT="$HOME/.secrets/webapp-devops.crt"
}

function gkeprod {
  echo "connecting to prod cluster"
  gcloud config set project webapp-prod
  gcloud container clusters get-credentials gke-webapp-production --region=us-east1
  export SEALED_SECRETS_CERT="$HOME/.secrets/webapp-production.crt"
}

function gkestg {
  echo "connecting to staging cluster"
  gcloud config set project webapp-staging
  gcloud container clusters get-credentials gke-webapp-staging --region=us-east1-b
  export SEALED_SECRETS_CERT="$HOME/.secrets/webapp-staging.crt"
}
