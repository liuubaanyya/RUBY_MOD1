#var 18
# Функція для обчислення значення F
def calculate_F(a, b, c, x)
  ac = a.to_i & 0x7FFFFFFF
  bc = b.to_i & 0x7FFFFFFF
  cc = c.to_i & 0x7FFFFFFF

  if x < 0 && bc != 0
    result = (ac * x**3 + bc * x**2).to_f
  elsif x > 0 && bc == 0
    result = ((x - ac) / (x - cc)).to_f
  else
    result = ((x + 5) / (cc * (x - 10))).to_f
  end

  if ac.zero? && bc.zero? && cc.zero?
    result.to_i
  else
    result
  end
end

# Зчитуємо значення a, b, c, Xнач., Xкін., dX з клавіатури
print "Введіть значення a: "
a = gets.to_f
print "Введіть значення b: "
b = gets.to_f
print "Введіть значення c: "
c = gets.to_f
print "Введіть початкове значення X: "
Xнач = gets.to_f
print "Введіть кінцеве значення X: "
Xкін = gets.to_f
print "Введіть крок dX: "
dX = gets.to_f

# Виводимо заголовок таблиці
puts "X\t\tF(X)"

# Обчислюємо та виводимо значення F на інтервалі з заданим кроком
X = Xнач
while X <= Xкін
  F = calculate_F(a, b, c, X)
  puts "#{X}\t\t#{F}"
  X += dX
end
