function gkestg {
  echo "connecting to staging cluster"
  gcloud config set project webapp-staging
  gcloud container clusters get-credentials gke-webapp-staging --region=us-east1-b
  export SEALED_SECRETS_CERT="$HOME/.secrets/webapp-staging.crt"
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
