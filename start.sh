#!/bin/bash

echo "🚀 Starting ArgoSBX Container for Railway..."

# پاک کردن اتوماتیک کاراکترهای ویندوز به محض روشن شدن کانتینر
sed -i 's/\r$//' /root/argosbx.sh

# تبدیل متغیرهای محیطی ریلوی به متغیرهای مورد نیاز اسکریپت
export uuid="${uuid}"
export vmpt="${vmpt:-8080}"
export argo="${argo:-vmpt}"
export sub="${sub:-y}"
export subpt="${PORT:-3000}"

echo "Executing main script..."
bash /root/argosbx.sh

echo "Container is alive. Streaming logs..."
sleep 5
tail -f /root/agsbx/argo.log 2>/dev/null || tail -f /Dev/null
