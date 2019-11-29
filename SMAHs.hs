{-# OPTIONS -Wall -Werror #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module SMAHs
( sma
) where

import Data.List
import Foreign.C.Types
import Foreign.Marshal.Array
import Foreign.Ptr

sma :: CInt -> Ptr CDouble -> Ptr CDouble -> CInt -> IO ()
sma period dst src len =
  do
    src_list <- peekArray (fromIntegral len) src
    let
      dst_list = sma' (fromIntegral period) src_list
    pokeArray dst dst_list

sma' :: Fractional a => Int -> [a] -> [a]
sma' period xs = map average $ window period $ replicate (pred period) (head xs) ++ xs

window :: Int -> [a] -> [[a]]
window period xs = take (length xs - pred period) $ map (take period) (tails xs)

average :: Fractional a => [a] -> a
average [] = 0
average xs = sum xs / fromIntegral (length xs)

foreign export ccall sma :: CInt -> Ptr CDouble -> Ptr CDouble -> CInt -> IO ()
