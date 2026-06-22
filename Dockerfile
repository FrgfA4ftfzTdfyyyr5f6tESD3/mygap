FROM alpine:latest

RUN apk update && apk add --no-cache \
    bash curl wget openssl busybox-extras libc6-compat gcompat util-linux coreutils procps jq

WORKDIR /root

COPY argosbx.sh /root/argosbx.sh
COPY start.sh /root/start.sh

# دستور جادویی برای پاک کردن کاراکترهای ویندوزی از کل بدنه و اسم فایل‌ها
RUN sed -i 's/\r$//' /root/start.sh && sed -i 's/\r$//' /root/argosbx.sh

RUN chmod +x /root/argosbx.sh /root/start.sh

EXPOSE 3000

CMD ["/bin/bash", "/root/start.sh"]
