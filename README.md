☕ مُكال - قهوة مختصة (Mokal Specialty Coffee)

📖 حول المشروع (Project Overview)

تطبيق مُكال (Mokal Specialty Coffee) هو حل تقني متكامل ومخصص تم تطويره بلغة Flutter لصالح مقهى محلي للقهوة المختصة. يهدف التطبيق إلى تحويل عملية الطلب والتوصيل التقليدية القائمة على التحويلات البنكية اليدوية وإرسال الإيصالات عبر الواتساب إلى منظومة رقمية مؤتمتة بالكامل.

يرتبط التطبيق مباشرة مع نظام نقاط البيع (POS) بالمقهى، مما يُتيح معالجة الطلبات فورياً وإرسالها للمطبخ/الكاشير بمجرد إتمام الدفع الإلكتروني.

✨ المميزات الرئيسية (Key Features)

🛍️ تصفح المنيو والسلة التفاعلية: استعراض كامل لمشروبات القهوة المختصة والمأكولات مع تخصيص المكونات وحساب الأسعار تلقائياً.

💳 الدفع الإلكتروني الفوري (Automated Checkout): دعم كامل لـ Apple Pay وبطاقات مدى (Mada) عبر بوابة ميسر (Moyasar)، لإلغاء الحاجة للتحويل البنكي اليدوي.

🧾 الربط الآلي مع الكاشير (POS Integration): إرسال بيانات الطلب والفاتورة آلياً إلى نظام إدارة المقهى بمجرد الدفع.

🎁 نادي الولاء والمكافآت (Loyalty Program): احتساب النقاط تلقائياً وتقديم خصومات ومشروبات مجانية وإمكانية تطبيق المكافأة مباشرة من السلة.

🗺️ تتبع المندوب لحظياً (Live GPS Tracking): خريطة تفاعلية توضح موقع الكابتن، مسار التوصيل، والوقت المتبقي للوصول عبر Google Maps.

💬 محادثة الدعم السريع: إمكانية التواصل والاتصال الفوري مع المندوب أو عبر الواتساب بنقرة واحدة.

🎨 الهوية البصرية والتصميم (Visual Identity & Theme)

تم الاعتماد على نظام تصميم مخصص يناسب طابع القهوة المختصة الفاخرة:

Espresso Dark (#2D1B18): اللون الأساسي للأشرطة والأزرار الرئيسية.

Neon Gold (#D4AF37 / #F59E0B): لون الإبراز وعناصر الولاء والتفاعل.

Warm Cream (#FFFBEB): خلفيات الواجهات لإعطاء انطباع مريح وأنيق.

🏗️ المعمارية النمطية (Architecture & Tech Stack)

يعتمد التطبيق على معمارية MVVM (Model-View-ViewModel) لضمان فصل منطق الأعمال (Business Logic) عن واجهات المستخدم وتسهيل عملية الاختبار والصيانة:
```bash

lib/
├── core/
│   ├── theme/          # الألوان والأنماط البصرية (AppTheme)
│   └── utils/          # المساعدات والأدوات العامة
├── features/
│   ├── home/           # المنيو، القائمة الرئيسية، والسلة
│   │   ├── models/
│   │   ├── view_models/# (HomeViewModel) إدارة حالة السلة والولاء
│   │   └── views/
│   ├── checkout/       # الدفع وبوابة الدفع الإلكتروني
│   │   ├── services/   # (PaymentService) التكامل مع بوابة الدفع
│   │   └── views/      # (CartCheckoutScreen)
│   └── tracking/       # تتبع الطلب والخريطة
│       └── views/      # (OrderTrackingScreen)
└── main.dart           # نقطة الانطلاق وإعداد الـ Providers
```

🛠️ التقنيات والمكتبات المستخدمة:

State Management: provider

Maps & Location: google_maps_flutter

HTTP Client: http

URL Handling: url_launcher

Fonts: google_fonts (Tajawal / Cairo)

⚙️ متطلبات التثبيت والتشغيل (Getting Started)

المتطلبات الأساسية (Prerequisites)

Flutter SDK (>= 3.0.0)

Xcode (لبيئة آيوس - iOS 14.0+)

Android Studio / VS Code

CocoaPods (sudo gem install cocoapods)

خطوات التشغيل (Installation Steps)

استنسخ المستودع (Clone Repository):
```bash

git clone https://github.com/your-username/mokal-coffee-app.git
cd mokal-coffee-app
```

تحميل التبعيات (Install Dependencies):
```bash
flutter pub get
```

إعداد بيئة iOS (Setup CocoaPods):
```bash
cd ios
pod install
cd ..
```

تشغيل التطبيق (Run Application):
```bash
flutter run
```

📄 الترخيص (License)

هذا المشروع ملك خاص ومطور لصالح مقهى مُكال للقهوة المختصة. جميع الحقوق محفوظة © 2026.
