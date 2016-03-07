
--Haskell has lazy evaluation...

infiniteList = [1,2..]
infiniteList !! 82 --> 82
length infiniteList --> will hang

--QED