data RunnerTimesRecord = RunnerTimes String String [Float]
                         deriving (Show)

usain = RunnerTimes "Usain Bolt" null [9.79, 9.98, 9.77, 9.63]

event (RunnerTimes _ e _) = e

-- DATE
--date Date = Date Int Int Int -- M/D/Y
--month (Date x _ _) = x
--day (Date _ x _) = x
--year (Date _ _ x) = x

-- FAMILY TREE
type FirstName = String
type LastName = String
type Parents = [Person]
type Children = [Person]
--type Birthdate = Date

data Person = Person FirstName LastName Parents Children

firstName (Person first _ _ _ _) = first
lastName (Person _ last _ _ _) = last
fullname (Person p) = first ++ " " ++ last