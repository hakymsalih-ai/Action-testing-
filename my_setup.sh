#!/bin/bash

echo "بدء عملية تحديث النظام..."
sudo apt update && sudo apt upgrade -y

echo "جاري تنظيف الملفات غير الضرورية..."
sudo apt autoremove -y

echo "تمت المهمة بنجاح! أهلاً بك يا مهندس DevOps."
neofetch

