#!/bin/bash
TARGET="192.168.1.14"
echo "جاري البحث عن البوابة المفتوحة..."

# فحص المنافذ المفتوحة وحفظها في متغير
OPEN_PORT=$(nmap -p 1024-65535 --open -T4 $TARGET | grep 'tcp open' | cut -d'/' -f1)

if [ -z "$OPEN_PORT" ]; then
    echo "لم يتم العثور على منافذ مفتوحة. تأكد من تفعيل الميزة في الهاتف."
else
    echo "تم العثور على المنفذ: $OPEN_PORT. جاري الاتصال الصامت..."
    adb connect $TARGET:$OPEN_PORT
fi

