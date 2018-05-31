Thu 31 May 2018 15:37:25 AEST 

A new favourite language that I experiment with from time to time is Haskell <URL to haskell website<>

One program that was fun to write is this one that scrambles the letters in words. Some scientists have shown that as long as the first and last letters of words that we read are in the correct place then we can understand the correct meaning of the word.

My incarnation is available at  https://github.com/MatrixMike/Haskell/tree/master/backwards .

To compile the program use

ghc --make backwards.hs

ghc is the glasgow haskell compiler and can be downloaded on a Linux type machine with 

apt-get install ghc

Here is some sample text to process 
zxxzx

and here is the result after processing with the above mentioned program
asdad



Notice that some words appear the same after processing :
<ol><li>first and last latters need to be in the same position after as before
</li><li>two letter words cannot be changed because the placing would be wrong
</li><li>three letter words would be the same due to the application of the earlier rules
</li><li>words with punctuation adjoining the letter sequence are, at the moment, treated as if they include the punctuation
</li>
</ol>

