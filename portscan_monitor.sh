#!/bin/bash

# إعدادات الشبكة
INTERFACE="eth0"

# ملفات مؤقتة
TMPFILE="/tmp/portscan_monitor.tmp"
LOGFILE="/tmp/portscan_alerts.log"

# إعدادات الإنذار
THRESHOLD=10         # عدد المحاولات خلال دقيقة
TIMEFRAME=60         # الإطار الزمني بالثواني

# التوكن و Chat ID الخاصين بالبوت (يتم تعريفهم هنا بشكل آمن)
TELEGRAM_BOT_TOKEN="ضع_توكن_بوت_تيليجرام_هنا"
TELEGRAM_CHAT_ID="ضع_Chat_ID_هنا"

# تنظيف الملفات
> $TMPFILE
> $LOGFILE

# عرض العداد بالترمينال (Dashboard)
( while true; do
    clear
    echo "====== مراقبة الشبكة الآن ======"
    echo "وقت التحديث: $(date)"
    echo "عدد المحاولات حسب الـ IP:"
    sort $TMPFILE | uniq -c | sort -nr
    echo
    sleep 5
done ) &

# تنظيف العدادات كل دقيقة
( while true; do
    sleep $TIMEFRAME
    > $TMPFILE
done ) &

# بدء المراقبة
sudo tcpdump -l -n -i $INTERFACE 'tcp[tcpflags] & tcp-syn != 0 and tcp[tcpflags] & tcp-ack == 0' |
while read packet
do
    SRC_IP=$(echo $packet | awk '{print $3}' | cut -d'.' -f1-4)
    
    echo $SRC_IP >> $TMPFILE
    
    COUNT=$(grep -c "$SRC_IP" $TMPFILE)
    
    if [ $COUNT -eq $THRESHOLD ]; then
        ALERT_MSG="[!] تنبيه: نشاط مشبوه من $SRC_IP - $COUNT محاولات في $TIMEFRAME ثانية."
        echo "$ALERT_MSG" | tee -a $LOGFILE
        
        # تنبيه صوتي
        echo -e "\a"
        
        # إرسال تنبيه عبر Telegram
        curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
            -d chat_id="$TELEGRAM_CHAT_ID" \
            -d text="$ALERT_MSG" >/dev/null
    fi
done
