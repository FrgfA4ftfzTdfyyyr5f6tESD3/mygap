FROM alpine:latest

# نصب وابستگی‌های حیاتی لینوکس که اسکریپت یانگ‌گه می‌خواهد
RUN apk update && apk add --no-cache \
    bash \
    curl \
    wget \
    openssl \
    busybox-extras \
    libc6-compat \
    gcompat \
    util-linux \
    coreutils \
    procps \
    jq

WORKDIR /root

# کپی کردن اسکریپت اصلی و فایل استارتر به داخل داکر
COPY argosbx.sh /root/argosbx.sh
COPY start.sh /root/start.sh

# دادن دسترسی اجرایی به اسکریپت‌ها
RUN chmod +x /root/argosbx.sh /root/start.sh

# پورت پیش‌فرض برای داکر کانتینر ریلوی
EXPOSE 3000

CMD ["/bin/bash", "/root/start.sh"]