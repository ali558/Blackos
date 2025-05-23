# portscan_monitor.sh

**وصف الأداة:**

`portscan_monitor.sh` هي أداة سطر أوامر قوية مصممة لمراقبة المنافذ المفتوحة على نظام معين أو مجموعة من الأنظمة في الوقت الفعلي. تتيح لك هذه الأداة تحديد المنافذ التي تهتم بمراقبتها، وستقوم بالإبلاغ عن أي تغييرات في حالتها (مثل فتح منفذ جديد أو إغلاق منفذ كان مفتوحًا). يمكن استخدام هذه الأداة لأغراض أمنية، مثل الكشف عن الخدمات الجديدة التي تبدأ بشكل غير متوقع، أو لتتبع حالة الخدمات الهامة.

**المتطلبات الأساسية:**

قبل تثبيت وتشغيل `portscan_monitor.sh`، تأكد من أن لديك المتطلبات الأساسية التالية مثبتة على نظام Kali Linux الخاص بك:

* **Python 3:** يجب أن يكون Python 3 مثبتًا على نظامك. يمكنك التحقق باستخدام الأمر:
    ```bash
    python3 --version
    ```
    إذا لم يكن مثبتًا، يمكنك تثبيته باستخدام الأمر:
    ```bash
    sudo apt update
    sudo apt install python3
    ```
* **pip:** مدير حزم Python لتثبيت المكتبات. يمكنك التحقق باستخدام الأمر:
    ```bash
    pip3 --version
    ```
    إذا لم يكن مثبتًا، يمكنك تثبيته باستخدام الأمر:
    ```bash
    sudo apt install python3-pip
    ```
* **`scapy` (إذا كانت الأداة تستخدم فحص الحزم):** إذا كانت الأداة تعتمد على مكتبة `scapy` لإرسال واستقبال حزم الشبكة، فيمكنك تثبيتها باستخدام الأمر:
    ```bash
    sudo apt install python3-scapy
    ```
    أو باستخدام pip:
    ```bash
    pip3 install scapy
    ```
* **`psutil` (إذا كانت الأداة تراقب العمليات المرتبطة بالمنافذ):** إذا كانت الأداة تستخدم مكتبة `psutil` للحصول على معلومات حول العمليات قيد التشغيل، فيمكنك تثبيتها باستخدام الأمر:
    ```bash
    pip3 install psutil
    ```
* **[أضف أي متطلبات أساسية أخرى هنا بناءً على لغة الأداة والمكتبات التي تستخدمها.]**

**التثبيت:**

يمكنك تثبيت `portscan_monitor.sh` باستخدام الخطوات التالية:

1.  **انسخ المستودع من GitHub:**
    ```bash
    git clone [https://github.com/ali558/Blackos.git](https://github.com/ali558/Blackos.git)
    cd Blackos
    ```
2.  **انتقل إلى مجلد الأداة (إذا كانت `portscan_monitor.sh` في مجلد فرعي):**
    ```bash
    cd [اسم_مجلد_الأداة]
    ```
3.  **تثبيت مكتبات Python المطلوبة (إذا كانت الأداة تعتمد عليها):**
    إذا كانت الأداة تتطلب مكتبات Python محددة، فتأكد من تثبيتها باستخدام `pip3`:
    ```bash
    pip3 install -r requirements.txt
    ```
    (افترضنا وجود ملف `requirements.txt` يسرد المكتبات المطلوبة. إذا لم يكن موجودًا، فقم بتثبيت المكتبات بشكل فردي كما هو موضح في قسم المتطلبات الأساسية.)
4.  **اجعل سكربت التثبيت قابلاً للتنفيذ:**
    ```bash
    chmod +x install.sh
    ```
5.  **قم بتشغيل سكربت التثبيت:**
    ```bash
    sudo ./install.sh
    ```

**الاستخدام:**

بعد التثبيت بنجاح، يمكنك تشغيل الأداة باستخدام الأمر التالي:

```bash
portscan_monitor.sh [خيارات]
