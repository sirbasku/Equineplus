
--Analyze Breed in Data2 mixed with some crap and misspellings
select distinct Data2, count(*)
from user_horse
group by Data2

select h.HorseName, h.RegistrationNumber
FROM user_Horse h
where data2 = 'Egyptia;n'