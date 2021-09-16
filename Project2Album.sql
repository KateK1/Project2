select *
from Progect2.dbo.Albums

--Общая информация
Select min([Year]) as MinYear, max([Year]) as MaxYear, count(distinct Artist) as Артисты,
count(distinct Genre) as Жанры, count(distinct Country) as Страны
from Progect2.dbo.Albums

--Количество альбомов в год
select [Year], count(Album) as КоличествоВГод
from Progect2.dbo.Albums
group by [Year]
order by [Year]

---Топ 10 артистов по количеству альбомов
select top 10 Artist, count(Album) as Количество
from Progect2.dbo.Albums
group by [Artist]
order by count(Album) desc

--Количество по жанрам
select Genre, count(Album) as Количество
from Progect2.dbo.Albums
group by [Genre]
order by count(Album) desc

--Количество по топ 3 жанрам
select 'Rock' as Жанр, count(Album) as Количество
from Progect2.dbo.Albums
where Genre like '%Rock%'
union
select 'Funk' as Жанр, count(Album) as Количество
from Progect2.dbo.Albums
where Genre like '%Funk%'
union
select 'Hip Hop' as Жанр, count(Album) as Количество
from Progect2.dbo.Albums
where Genre like '%Hip Hop%'

--Субжарны жанра Рок
select top 10 Subgenre, count(Album) as Количество
from Progect2.dbo.Albums
where subgenre <>'None' 
and subgenre <>'ЛОЖЬ'
and subgenre like '%Rock%'
group by [Subgenre]
order by count(Album) desc

--Альбомы по странам
select Country, count(Album) as Количество
from Progect2.dbo.Albums
where Country is not NULL
group by Country
order by count(Album) desc


--Среднее место
select SUM(Number) as SumOfNumbers, Artist, count(Album) as КоличествоАльбомов, cast(SUM(Number)/count(Album) as int) as СреднееМесто
from Progect2.dbo.Albums
group by Artist
order by SUM(Number)/count(Album)

--Артист и даты выходов альбомов
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

--Годы существования группы
select distinct Artist, StartY, FinY
from Progect2.dbo.Albums

