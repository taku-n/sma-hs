{-# OPTIONS -Wall -Werror #-}

import Data.List

sma :: Fractional a => Int -> [a] -> [a]
sma period xs = map average $ window period $ replicate (pred period) (head xs) ++ xs

window :: Int -> [a] -> [[a]]
window period xs = take (length xs - pred period) $ map (take period) (tails xs)

average :: Fractional a => [a] -> a
average [] = 0
average xs = sum xs / fromIntegral (length xs)
