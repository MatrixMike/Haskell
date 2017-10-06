import System.IO
-- 06.10.2017 19:07:39
main = do
    putStr "how are you today? "
    hFlush stdout
    input <- hGetLine stdin
--  process input
    putStr $ "test1 " ++ input
    


-- https://wiki.haskell.org/GHC:FAQ#If_I_print_out_a_string_using_putStr.2C_and_then_attempt_to_read_some_input_using_hGetLine.2C_I_don.27t_see_the_output_from_the_putStr.
