# Episode 06: مدیریت حافظه در Riverpod - نسخه ساده (15 دقیقه)

## مقدمه (2 دقیقه) 🎯

سلام! امروز می‌خواهیم یکی از مهم‌ترین موضوعات Riverpod رو یاد بگیریم: **مدیریت حافظه**.

### چرا مهمه؟
- وقتی برنامه بزرگ می‌شه، حافظه مهم می‌شه
- Providerهای غیرضروری نباید در حافظه بمونن
- Performance بهتر = تجربه کاربری بهتر

### دو مفهوم کلیدی:
1. **autoDispose**: خودکار پاک می‌شه
2. **keepAlive**: همیشه در حافظه می‌مونه

---

## بخش عملی (10 دقیقه) 💻

### گام 1: Provider ساده با autoDispose (3 دقیقه)

```dart
// فایل: lib/providers/simple_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider موقتی - خودکار پاک می‌شه
final searchProvider = StateProvider.autoDispose<String>((ref) {
  print('🟢 Search Provider ساخته شد!');
  
  ref.onDispose(() {
    print('🔴 Search Provider پاک شد!');
  });
  
  return '';
});

// Provider دائمی - همیشه در حافظه می‌مونه  
final userProvider = StateProvider<String?>((ref) {
  print('🟦 User Provider ساخته شد!');
  return null;
});
```

### گام 2: UI ساده برای تست (4 دقیقه)

```dart
// فایل: lib/pages/simple_memory_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/simple_providers.dart';

class SimpleMemoryTest extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🧠 تست حافظه ساده'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            
            // بخش جستجو (autoDispose)
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      '🔍 جستجو (autoDispose)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Consumer(
                      builder: (context, ref, child) {
                        final search = ref.watch(searchProvider);
                        return Column(
                          children: [
                            TextField(
                              onChanged: (value) {
                                ref.read(searchProvider.notifier).state = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'جستجو کنید...',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('جستجو: "$search"'),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 16),
            
            // بخش کاربر (keepAlive)
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      '👤 کاربر (keepAlive)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Consumer(
                      builder: (context, ref, child) {
                        final user = ref.watch(userProvider);
                        return Column(
                          children: [
                            Text('کاربر فعلی: ${user ?? "وارد نشده"}'),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                ref.read(userProvider.notifier).state = 'علی احمدی';
                              },
                              child: Text('ورود'),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 24),
            
            // دکمه‌های تست
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // پاک کردن اجباری autoDispose
                      ref.invalidate(searchProvider);
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('🗑️ Search Provider پاک شد! Console را ببینید'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('پاک کن', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ref.read(userProvider.notifier).state = null;
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('👤 کاربر خارج شد'),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                    child: Text('خروج', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 16),
            
            // توضیحات
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💡 نکته مهم:',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '• وقتی از این صفحه خارج بشید، searchProvider خودکار پاک می‌شه\n'
                    '• userProvider همیشه در حافظه می‌مونه\n'
                    '• Console رو برای دیدن پیام‌ها چک کنید',
                    style: TextStyle(fontSize: 12, color: Colors.blue[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### گام 3: اضافه کردن به صفحه اصلی (1 دقیقه)

```dart
// در فایل lib/pages/todo_home_page.dart در AppBar اضافه کنید:
actions: [
  IconButton(
    icon: Icon(Icons.memory),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SimpleMemoryTest(),
        ),
      );
    },
    tooltip: 'تست حافظه',
  ),
  // سایر دکمه‌ها...
],
```

### گام 4: مثال پیشرفته - Provider شرطی (2 دقیقه)

```dart
// Provider که گاهی keepAlive می‌شه
final smartProvider = StateProvider.autoDispose<Map<String, dynamic>>((ref) {
  print('🧠 Smart Provider ساخته شد!');
  
  final data = {
    'important': false,
    'value': 0,
  };
  
  // اگر مهم شد، در حافظه نگه دار
  ref.listen<Map<String, dynamic>>(
    ref.provider,
    (previous, next) {
      if (next['important'] == true) {
        print('🔒 داده مهم شد! keepAlive کردیم');
        ref.keepAlive();
      }
    },
  );
  
  ref.onDispose(() {
    print('🧠 Smart Provider پاک شد!');
  });
  
  return data;
});
```

---

## جمع‌بندی (3 دقیقه) ✨

### چی یاد گرفتیم:
1. **autoDispose**: برای داده‌های موقتی (جستجو، فیلتر، ...)
2. **بدون autoDispose**: برای داده‌های مهم (کاربر، تنظیمات، ...)
3. **ref.keepAlive()**: برای کنترل دستی

### کی از کدوم استفاده کنیم:

#### ✅ autoDispose مناسبه برای:
- جستجو و فیلتر
- فرم‌های موقتی  
- صفحات محلی
- حافظه‌های cache موقتی

#### ✅ keepAlive مناسبه برای:
- اطلاعات کاربر
- تنظیمات برنامه
- داده‌های مشترک
- API cache های مهم

### نکته مهم:
```dart
// پیش‌فرض: همیشه autoDispose استفاده کنید
final myProvider = StateProvider.autoDispose<T>((ref) {
  // کدتان
});

// فقط وقتی واقعاً لازمه، autoDispose رو حذف کنید
final importantProvider = StateProvider<T>((ref) {
  // کدتان
});
```

### چگونه تست کنیم:
1. Console رو باز کنید
2. بین صفحات جابجا شوید  
3. دکمه‌های تست رو فشار دهید
4. پیام‌های lifecycle رو ببینید

### قدم بعدی:
قسمت ۷: Testing و Integration با API های واقعی

موفق باشید! 🚀

---

## فایل‌های کامل برای کپی:

### lib/providers/simple_providers.dart
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider موقتی - خودکار پاک می‌شه
final searchProvider = StateProvider.autoDispose<String>((ref) {
  print('🟢 Search Provider ساخته شد!');
  
  ref.onDispose(() {
    print('🔴 Search Provider پاک شد!');
  });
  
  return '';
});

// Provider دائمی - همیشه در حافظه می‌مونه  
final userProvider = StateProvider<String?>((ref) {
  print('🟦 User Provider ساخته شد!');
  return null;
});

// Provider هوشمند که شرطی keepAlive می‌شه
final smartProvider = StateProvider.autoDispose<Map<String, dynamic>>((ref) {
  print('🧠 Smart Provider ساخته شد!');
  
  final data = {
    'important': false,
    'value': 0,
  };
  
  // اگر مهم شد، در حافظه نگه دار
  ref.listen<Map<String, dynamic>>(
    ref.provider,
    (previous, next) {
      if (next['important'] == true) {
        print('🔒 داده مهم شد! keepAlive کردیم');
        ref.keepAlive();
      }
    },
  );
  
  ref.onDispose(() {
    print('🧠 Smart Provider پاک شد!');
  });
  
  return data;
});
```

### کل مدت آموزش: دقیقاً 15 دقیقه! ⏱️