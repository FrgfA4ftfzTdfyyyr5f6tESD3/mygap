FROM alpine:latest

# نصب پیش‌نیازهای شبکه و فیکس‌کننده‌ی انتهای خطوط (dos2unix)
RUN apk update && apk add --no-cache \
    bash curl wget openssl busybox-extras libc6-compat gcompat util-linux coreutils procps jq dos2unix

WORKDIR /root

# کپی کردن اسکریپت‌ها به داخل کانتینر
COPY argosbx.sh /root/argosbx.sh
COPY start.sh /root/start.sh

# پاکسازی و شستشوی کاراکترهای خبیث ویندوزی در لایه امیج
RUN dos2unix /root/start.sh && dos2unix /root/argosbx.sh
RUN sed -i 's/\r$//' /root/start.sh && sed -i 's/\r$//' /root/argosbx.sh

RUN chmod +x /root/argosbx.sh /root/start.sh

EXPOSE 3000

CMD ["/bin/bash", "/root/start.sh"]
