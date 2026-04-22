#!/bin/bash

# 1. تعريف المتغيرات (ألوان لتسهيل القراءة
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}--- بدء فحص الخادم الشامل (DevOps Stage 3) ---${NC}"

# 2. فحص استهلاك الموارد (Process Management)
echo -e "\n[1] أعلى 3 عمليات استهلاكاً للمعالج (CPU):"
ps aux --sort=-%cpu | head -n 4

# 3. فحص الذاكرة (Memory Management)
echo -e "\n[2] حالة الذاكرة (RAM):"
free -h

# 4. فحص الشبكة والمنافذ (Networking)
echo -e "\n[3] المنافذ (Ports) المفتوحة حالياً:"
ss -tulpn | grep LISTEN

# 5. فحص خدمة معينة (Systemd) - سنفحص الـ SSH كمثال
echo -e "\n[4] حالة خدمة الـ SSH:"
if systemctl is-active --quiet ssh; then
    echo -e "${GREEN}الخدمة تعمل بنجاح (Active)${NC}"
else
    echo -e "${RED}الخدمة متوقفة! (Inactive)${NC}"
fi

# 6. فحص سجلات النظام لأخر 5 أخطاء (Logging)
echo -e "\n[5] آخر 5 أخطاء في سجلات النظام (Logs):"
journalctl -p 3 -n 5 --no-pager

echo -e "\n${GREEN}--- انتهى الفحص ---${NC}"

