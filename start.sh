#!/bin/bash

echo "🚀 Starting ArgoSBX Container for Railway..."

# تبدیل متغیرهای محیطی ریلوی به متغیرهای مورد نیاز اسکریپت
export uuid="${uuid}"
export vmpt="${vmpt:-8080}"
export argo="${argo:-vmpt}"
export sub="${sub:-y}"
export subpt="${PORT:-3000}"

# اجرای اسکریپت اصلی یانگ‌گه با متغیرهای بالا
echo "Executing main script..."
bash /root/argosbx.sh

# زنده نگه داشتن کانتینر و چاپ کردن لاگ‌های پروکسی در دشبورد ریلوی
echo "Container is alive. Streaming logs..."
sleep 5
tail -f /root/agsbx/argo.log 2>/dev/null || tail -f /dev/null