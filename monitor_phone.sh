#!/bin/bash

# ضع هنا عنوان IP هاتف ابنتك
PHONE_IP="192.168.1.15"

echo "جاري مراقبة الشبكة.. سينفتح البث تلقائياً عند اتصال الهاتف."

while true; do
    # فحص إذا كان الهاتف متصلاً بالشبكة (Ping)
    ping -c 1 $PHONE_IP > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo "تم اكتشاف الهاتف! جاري محاولة عرض الشاشة..."
        
        # محاولة الاتصال عبر ADB
        adb connect $PHONE_IP:5555
        
        # تشغيل scrcpy مع إعدادات خفيفة لعدم تسخين الهاتف
        scrcpy -e --tcpip=$PHONE_IP --bit-rate 2M --max-size 800 --no-audio --always-on-top
        
        echo "انقطع الاتصال. جاري العودة للمراقبة..."
    fi
    
    # الانتظار لمدة 30 ثانية قبل الفحص مرة أخرى
    sleep 30
done

