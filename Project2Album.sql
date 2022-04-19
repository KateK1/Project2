select *
from Progect2.dbo.Albums

--Main info
Select min([Year]) as MinYear, max([Year]) as MaxYear, count(distinct Artist) as Артисты,
count(distinct Genre) as Жанры, count(distinct Country) as Страны
from Progect2.dbo.Albums

--Albums per year
select [Year], count(Album) as КоличествоВГод
from Progect2.dbo.Albums
group by [Year]
order by [Year]

--Artists in descending order by album's amount
select distinct Artist, count(Album) as Количество
from Progect2.dbo.Albums
group by [Artist]
order by count(Album) desc

--Albums by genre
select Genre, count(Album) as Количество
from Progect2.dbo.Albums
group by [Genre]
order by count(Album) desc


--Albums by country
select Country, count(Album) as Количество
from Progect2.dbo.Albums
where Country is not NULL
group by Country
order by count(Album) desc


--Artist and dates of albums release
SELECT Artist, STRING_AGG([Year], ', ') AS ДатыВыхода
from Progect2.dbo.Albums
GROUP BY Artist

SELECT Artist, 
SUBSTRING(cast(ДатыВыхода as nvarchar(max)), 1, 4) AS A1,
SUBSTRING(cast(ДатыВыхода as nvarchar(max)), 7, 4) AS A2,
SUBSTRING(cast(ДатыВыхода as nvarchar(max)), 13, 4) AS A3,
SUBSTRING(cast(ДатыВыхода as nvarchar(max)), 19, 4) AS A4,
SUBSTRING(cast(ДатыВыхода as nvarchar(max)), 25, 4) AS A5,
SUBSTRING(cast(ДатыВыхода as nvarchar(max)), 31, 4) AS A6,
SUBSTRING(cast(ДатыВыхода as nvarchar(max)), 37, 4) AS A7,
SUBSTRING(cast(ДатыВыхода as nvarchar(max)), 43, 4) AS A8,
SUBSTRING(cast(ДатыВыхода as nvarchar(max)), 49, 4) AS A9,
SUBSTRING(cast(ДатыВыхода as nvarchar(max)), 55, 4) AS A10
FROM Progect2.dbo.AlYear



--Artist's active years
select Number, Artist, Album, [Year], StartY, FinY, Country,
CASE WHEN Genre LIKE '%,%'
         THEN LEFT(Genre, CHARINDEX(',', Genre) - 1) END AS MGenre,
CASE WHEN Genre not LIKE '%,%'
         THEN SUBSTRING(Genre, CHARINDEX(',', Genre) + 1, LEN(Genre)) END AS MGenre
from Progect2.dbo.Albums

