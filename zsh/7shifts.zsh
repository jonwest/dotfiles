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

###
# Changing Kubernetes Clusters
###
function gkedata {
  echo "connecting to data cluster";
  gcloud config set project webapp-data;
  gcloud container clusters get-credentials gke-datascience --region=us-east1;
  export SEALED_SECRETS_CERT="$HOME/.secrets/webapp-data.crt";
}

function gkedo {
  echo "connecting to devops cluster";
  gcloud config set project webapp-devops;
  gcloud container clusters get-credentials admin --region=us-east1;
  export SEALED_SECRETS_CERT="$HOME/.secrets/webapp-devops.crt";
}

function gkeprod {
  echo "connecting to prod cluster";
  gcloud config set project webapp-prod;
  gcloud container clusters get-credentials gke-webapp-production --region=us-east1;
  export SEALED_SECRETS_CERT="$HOME/.secrets/webapp-production.crt";
}

function gkestg {
  echo "connecting to staging cluster";
  gcloud config set project webapp-staging;
  gcloud container clusters get-credentials gke-webapp-staging --region=us-east1-b;
  export SEALED_SECRETS_CERT="$HOME/.secrets/webapp-staging.crt";
}

###
# Set the namespace for the current k8s cluster
###
function setnamespace {
  local namespace=$1;
  echo "Setting namespace to '${namespace}'";
  kubectl config set-context --current --namespace=${namespace};
}

###
# Get the current namespace for the current k8s cluster
###
function getnamespace {
  kubectl config view --minify | grep namespace:
}

###
# Clone a 7shifts repo
###
function 7sclone {
  local repo=$1;
  local target_dir=$2;

  if [[ -z "$1" ]]; then
    echo "clone: Clone's a 7shifts Git repo";
    echo "Usage: clone <repo_name> [<target_dir>]";
    exit 1;
  fi

  if [[ -z ${target_dir} ]]; then
    target_dir=${repo};
  fi
  
  gh repo clone "https://github.com/7shifts/${repo}.git" "${target_dir}" -- --filter=tree:0;
}


###
# Get GHA runtime averages
###
function gha_avg() {
  if [[ -z "$1" ]]; then
    echo "gha_avg: Get the average runtime for a GitHub Actions workflow by job";
    echo -e "\t Defaults to 'webapp' repo, '50' page limit, and only successful runs.";
    echo "Usage: gha_avg <workflow_name> [<repo> <page_limit>]";
    exit 1;
  else 
    local workflow_name="$1";
  fi

  if [[ -z "$2" ]]; then
    local repo="7shifts/webapp";
  else
    local repo="7shifts/$2";
  fi

  if [[ -z "$3" ]]; then
    local page_limit=50;
  else
    local page_limit=$3;
  fi

  # Get workflow runs
  runs=$(gh api -X GET "repos/$repo/actions/runs" --paginate -F status=completed -F conclusion=success -F per_page=$page_limit | jq -r ".workflow_runs[] | select(.name == \"$workflow_name\") | .id");

  declare -A job_durations;
  declare -A job_counts;

  # Iterate through each run and accumulate job runtimes
  echo "$runs" | while read -r run_id; do
    echo "Processing run ID: $run_id"; # Debugging output
    jobs=$(gh api -X GET "repos/$repo/actions/runs/$run_id/jobs" | jq -c '.jobs[] | {name: .name, duration: (.completed_at | fromdateiso8601 - (.started_at | fromdateiso8601))}');
    
    echo "Jobs for run ID $run_id: $jobs"; # Debugging output
    
    for job in $(echo "$jobs"); do
      name=$(echo "$job" | jq -r '.name');
      duration=$(echo "$job" | jq -r '.duration');
      
      if [[ -n "$name" && -n "$duration" ]]; then
        job_durations["$name"]=$(echo "${job_durations["$name"]} + $duration" | bc);
        job_counts["$name"]=$((job_counts["$name"] + 1));
      else
        echo "Skipping invalid job entry: $job"; # Debugging output
      fi
    done
  done

  # Calculate and print average durations
  echo "Average durations per job:"
  for job in "${!job_durations[@]}"; do
    average=$(echo "${job_durations[$job]} / ${job_counts[$job]}" | bc -l);
    printf "%s: %.2f seconds\n" "$job" "$average";
  done
}


function ssm() {
  if [[ -z "$1" ]]; then
    echo "ssm: Connect to an AWS SSM instance";
    echo "Usage: ssm <instance_id>";
    exit 1;
  else
    local instance_id="$1";
  fi

  aws ssm --region us-east-1 start-session --target $instance_id;
}
