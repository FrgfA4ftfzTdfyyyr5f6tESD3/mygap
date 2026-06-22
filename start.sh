#!/bin/bash
sed -i 's/\r$//' /root/argosbx.sh && export uuid="${uuid}" vmpt="${vmpt:-8080}" argo="${argo:-vmpt}" sub="${sub:-y}" subpt="${PORT:-3000}" && bash /root/argosbx.sh
