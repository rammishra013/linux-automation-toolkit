bash -c '
file="/etc/nginx/nginx.conf"
if [[ -f "$file" ]]; then
    echo "File exists."
else
    echo "File does not exist."
fi
'
