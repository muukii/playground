#! stack runghc

myfunc x = x * 2
add a b = a + b

number 10 = print "ten"
number x = print x

main = do
  print "Hello, World"
  
  let bar = "bar"
  print bar
  
  -- print foo
  -- where
  --   foo = "foo"

  print (myfunc 2)
  print $ myfunc 2
  print $ add 2 2
  print $ 2 `add` 2
  print $ (+) 4 10
  
  print $ 5 + 2
  print $ 5 - 2
  print $ 5 * 2
  print $ 5 / 2
  print $ div 5 2
  print $ mod 5 2
  print $ 5 `div` 2
  print $ 5 `mod` 2


  if 1 == 1
    then print "waf"
    else print "wof"

  number 10
  number 11
