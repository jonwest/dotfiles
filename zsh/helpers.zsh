###
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃                   HEADING GENERATORS                   ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
###
function print_heading() {
  if [[ "${1}" = "h1" ]]; then
    local width=${2};
    local tl_corner="╔";
    local tr_corner="╗";
    local bl_corner="╚";
    local br_corner="╝";
    local vert_line="║";
    local hori_line="═";
  fi

  if [[ "${1}" = "h2" ]]; then
    local width=${2};
    local tl_corner="┏";
    local tr_corner="┓";
    local bl_corner="┗";
    local br_corner="┛";
    local vert_line="┃";
    local hori_line="━";
  fi

  if [[ "${1}" = "h3" ]]; then
    local width=${2};
    local tl_corner="┌";
    local tr_corner="┐";
    local bl_corner="└";
    local br_corner="┘";
    local vert_line="│";
    local hori_line="─";
  fi

  local comment_char="${3}";
  local text="${4}";


  # Calculate the available space for the content
  local content_width=$((width - 4));  # Border width = 2 on each side

  # Calculate the left padding to center the text
  local padding=$(( (content_width - ${#text}) / 2 ));

  # Calculate the right padding if the total width is odd
  local right_padding=$(( content_width - padding - ${#text} ));

  # Generate the border and centered text
  local border_filler="$(printf "${hori_line}%.0s" $(seq 1 $content_width))";
  local border="${tl_corner}${border_filler}${tr_corner}";
  local content="${vert_line}$(printf ' %.0s' $(seq 1 $padding))$text$(printf ' %.0s' $(seq 1 $right_padding))${vert_line}";
  local footer="${bl_corner}${border_filler}${br_corner}";

  # Ensure there is at least one blank line before and after the heading
  printf "%s\n%s\n%s\n%s\n%s" "$comment_char$comment_char$comment_char" "$comment_char $border" "$comment_char $content" "$comment_char $footer" "$comment_char$comment_char$comment_char";
}

function genh1() {
  echo "Generating heading...";
  print_heading "h1" "75" "${1}" "${2}" | pbcopy;
  echo "Heading copied to clipboard!";
}

function genh2() {
  echo "Generating heading...";
  print_heading "h2" "50" "${1}" "${2}" | pbcopy;
  echo "Heading copied to clipboard!";
}

function genh3() {
  echo "Generating heading...";
  print_heading "h3" "50" "${1}" "${2}" | pbcopy;
  echo "Heading copied to clipboard!";
}


###
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃                      GIT HELPERS                       ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
###
function gitsha() {
  if git rev-parse --show-toplevel &>/dev/null; then
    echo "SHA: $(git rev-parse HEAD)";
    echo "SHORT-SHA: $(git rev-parse --short HEAD)";
  else
    echo "Not in a Git repo, cannot continue" >&2;
  fi
}

function argovars() {
  if ! git rev-parse --show-toplevel &>/dev/null; then
    echo "Not in a Git repo, cannot continue" >&2;
    return 1;
  fi

  echo "SHORT-SHA: $(git rev-parse --short HEAD)";
  echo "SHA: $(git rev-parse HEAD)";
  echo "Sending changed files to clipboard...";
  echo $(git diff --name-only "origin/master...") | pbcopy;
  echo "Workflow PVC: webapp-ci-cache-$(git rev-parse --abbrev-ref HEAD)";
  echo "Trunk PVC: webapp-master-cache";
}
