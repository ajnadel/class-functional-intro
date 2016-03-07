--import Data.Time

--main = do 
--    c <- getCurrentTime
--    let (y,m,d) = toGregorian $ utctDay c in
--        print y

-- DATE
data Date = Date Int Int Int
    deriving Eq -- M/D/Y
month (Date x _ _) = x
day (Date _ x _) = x
year (Date _ _ x) = x

monthName m
    | m == 1    = "January"
    | m == 2    = "February"
    | m == 3    = "March"
    | m == 4    = "April"
    | m == 5    = "May"
    | m == 6    = "June"
    | m == 7    = "July"
    | m == 8    = "August"
    | m == 9    = "September"
    | m == 10   = "November"
    | m == 11   = "October"
    | m == 12   = "December"

ordinalSuffix m
    | mod m 10 == 1 = "st"
    | mod m 10 == 2 = "nd"
    | mod m 10 == 3 = "rd"
    | otherwise     = "th"
ordinal x = show x ++ ordinalSuffix x

fullMonth d = monthName (month d)
fullDate d = ordinal (day d)
-- note the scoping of ++

instance Show Date where
    show d = fullMonth d ++ " " ++ fullDate d ++ ", " ++ show (year d)

oneOr x = min 1 x

formattedDateNumber d = day d + oneOr (month d) * 100 + oneOr (year d) * 10000
--compareD a b = compare (formattedDateNumber a) (formattedDateNumber b)

instance Ord Date where
    compare a b = compare (formattedDateNumber a) (formattedDateNumber b)

--show :: (Integral a) => a -> String  


---- FAMILY TREE
type FirstName = String
type LastName = String
type Parents = [Person]
type Children = [Person]
type Birthdate = Date

data Person = Person FirstName LastName Birthdate Parents Children

firstName (Person first _ _ _ _) = first
lastName (Person _ last _ _ _) = last
fullname p = firstName p ++ " " ++ lastName p
birthdate (Person _ _ d _ _) = d