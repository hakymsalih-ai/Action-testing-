#!/bin/bash

# 1. تعريف المتغيرات
USER_NAME=$(whoami)
DATE=$(date +'%Y-%m-%d %H:%M:%S')

echo "------------------------------------------"
echo "مرحباً $USER_NAME، بدأ فحص النظام في: $DATE"
echo "------------------------------------------"

# 2. فحص مساحة القرص (Disk Usage)
echo "جاري فحص مساحة القرص..."
df -h | grep '^/dev/'

# 3. استخدام الشرط (If Statement) لفحص الذاكرة
THRESHOLD=500
FREE_MEM=$(free -m | awk '/^Mem:/{print $4}')

echo "------------------------------------------"
echo "الذاكرة المتاحة حالياً: ${FREE_MEM}MB"

if [ "$FREE_MEM" -lt "$THRESHOLD" ]; then
    echo "⚠️ تنبيه: الذاكرة منخفضة (أقل من ${THRESHOLD}MB)!"
else
    echo "✅ حالة الذاكرة ممتازة."
fi

echo "------------------------------------------"
echo "تم الانتهاء من الفحص."

