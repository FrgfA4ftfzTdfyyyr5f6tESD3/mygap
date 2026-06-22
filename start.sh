#!/bin/bash

echo "🚀 Starting ArgoSBX Container for Railway..."

# شستشوی مجدد برای اطمینان ۱۰۰٪
sed -i 's/\r$//' /root/argosbx.sh

# انتقال متغیرهای ریلوی به اسکریپت
export uuid="${uuid}"
export vmpt="${vmpt:-8080}"
export argo="${argo:-vmpt}"
export sub="${sub:-y}"
export subpt="${PORT:-3000}"

echo "⚙️ Executing main script..."
bash /root/argosbx.sh

# زنده نگه داشتن کانتینر و هدایت لاگ‌ها به دشبورد ریلوی
echo "🟢 Container is live. Streaming Argo logs..."
sleep 2
tail -f /root/agsbx/argo.log 2>/dev/null || tail -f /dev/null
