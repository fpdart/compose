# Compose with language operators

Try to use composition functions with language operators!
You can use right (classic) and left composition.

You have two ways to define your composition: `>>` and `*`. Its same!
For calling you need to use `<` (from left function) or `>` (from right function).

### Examples
```dart
var addOne = (x) => x + 1;
var minusOne = (x) => x - 1;
var add = (x, v) => x + v;

print(c() >> addOne >> minusOne >> ((_) => add(1, _ * 2)) > 3); // 7
print(c() >> addOne >> minusOne >> ((_) => add(1, _ * 2)) < 3); // 7

print(c() * addOne * ((_) => _ * 2) > 4); // 9
print(c() * addOne * ((_) => _ * 2) < 4); // 10
```