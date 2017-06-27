fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

generator = fn n ->
  fizzbuzz.(rem(n, 3), rem(n, 5), n)
end

["Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16]
= [
generator.(10),
generator.(11),
generator.(12),
generator.(13),
generator.(14),
generator.(15),
generator.(16)
]
