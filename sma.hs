{-# OPTIONS -Wall -Werror #-}

import Data.List

sma :: Fractional a => Int -> [a] -> [a]
sma period xs = map average $ window period (replicate (pred period) (head xs) ++ xs)

window :: Int -> [a] -> [[a]]
window period xs = drop period $ map reverse $ map (take period) $ map reverse $ inits xs

average :: (Fractional a, Foldable t) => t a -> a
average xs = sum xs / fromIntegral (length xs)
