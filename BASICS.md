# Haskell

Recursion is important to Haskell because unlike imperative languages, you do computations in Haskell by declaring what something is instead of declaring how you get it. That's why there are no while loops or for loops in Haskell and instead we many times have to use recursion to declare what something is.

## Basics

The part before the pipe is called the output function, x is the variable, N is the input set and x <= 10 is the predicate.

```haskell
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

length' xs = sum [1 | _ <- xs]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
```

Use pattern matching on function parameters

```haskell
firstThreeElements (x:y:z:_) = [x,y,z]

head' :: (Eq a) => [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x
```

Whereas pattern matching on function parameters can only be done when defining functions, case expressions can be used pretty much anywhere

```haskell
header' :: [a] -> a
header' xs = case xs of
            [] -> error "No head for empty lists!"
            (x:_) -> x
```

Keep a reference the the whole object with `@`

```haskell
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
```

Define generic types of a function

```haskell
read "5" :: Int
read :: String -> Int
```

let keyword

```haskell
x = 4 * (let a = 9 in a + 1) + 2

y = [let square x = x * x in (square 5, square 3, square 2)]
```

Define values used multiple times in functions with let

```haskell
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * r
        topArea = 3 * h
    in  sideArea + topArea
```

Alternatively use `where` clause

```haskell
largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0
```

Function application with `$` is right-associative

```haskell
sum $ map sqrt [1..130]

map ($ 3) [(4+), (10*), (^2), sqrt]
```

Function composition

```haskell
let x = map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
let v = map (negate . sum . tail) [[1..5],[3..6],[1..7]]
```

Point free style

```haskell
sum' xs = foldl (+) 0 xs
sum' = foldl (+) 0
```

## Other

```haskell
Circle :: Float -> Float -> Float -> Shape
Rectangle :: Float -> Float -> Float -> Float -> Shape
data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

-- Paamayim Nekudotayim
-- Record syntax
data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     , height :: Float
                     , phoneNumber :: String
                     , flavor :: String
                     } deriving (Show)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving (Eq, Ord, Show, Read, Bounded, Enum)

type String' = [Char]

-- Type parameters
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

class Eq' a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x == y = not (x /= y)
    x /= y = not (x == y)

instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False
```


