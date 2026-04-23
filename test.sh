#!/bin/bash

# سكربت بسيط لجدول الضرب
number=5

echo "--- جدول ضرب الرقم $number ---"

for i in {1..10}
do
  result=$((number * i))
  echo "$number x $i = $result"
done

echo "------------------------"
echo "تم تشغيل السكريبت بنجاح!"

