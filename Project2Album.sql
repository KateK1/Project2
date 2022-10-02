
-- As the data source was used an Exel table with the following columns:
-- Number - the rate in the top 500
-- Year - release year
-- Album - name of the album
-- Artist - the name of the artist
-- genre - genres of music in the album
-- subgenre - subgenres of music in the album
-- StartY - a year when the artist starts their career
-- FinY - a year when artist end career, if artist steels active - current year

--Main info
Select min([Year]) as MinYear, max([Year]) as MaxYear, count(distinct Artist) as Artist,
count(distinct Genre) as Genre, count(distinct Country) as Country
from Progect2.dbo.Albums

--How many albums from the top 500 was released every year
select [Year], count(Album) as Album_per_year
from Progect2.dbo.Albums
group by [Year]
order by [Year]

-- How many albums from the top 500 every artist released
select distinct Artist, count(Album) as Albums
from Progect2.dbo.Albums
group by [Artist]
order by count(Album) desc

-- How many albums of each genre
select Genre, count(Album) as Albums
from Progect2.dbo.Albums
group by [Genre]
order by count(Album) desc


-- How many albums from each country
select Country, count(Album) as Albums
from Progect2.dbo.Albums
where Country is not NULL
group by Country
order by count(Album) desc


--What years albums were released for each artist
SELECT Artist, STRING_AGG([Year], ', ') AS release
from Progect2.dbo.Albums
GROUP BY Artist

SELECT Artist, 
SUBSTRING(cast(release as nvarchar(max)), 1, 4) AS A1,
SUBSTRING(cast(release as nvarchar(max)), 7, 4) AS A2,
SUBSTRING(cast(release as nvarchar(max)), 13, 4) AS A3,
SUBSTRING(cast(lease as nvarchar(max)), 19, 4) AS A4,
SUBSTRING(cast(release as nvarchar(max)), 25, 4) AS A5,
SUBSTRING(cast(release as nvarchar(max)), 31, 4) AS A6,
SUBSTRING(cast(release as nvarchar(max)), 37, 4) AS A7,
SUBSTRING(cast(release as nvarchar(max)), 43, 4) AS A8,
SUBSTRING(cast(release as nvarchar(max)), 49, 4) AS A9,
SUBSTRING(cast(release as nvarchar(max)), 55, 4) AS A10
FROM Progect2.dbo.AlYear



--What were the active years for each artist
select Number, Artist, Album, [Year], StartY, FinY, Country,
CASE WHEN Genre LIKE '%,%'
         THEN LEFT(Genre, CHARINDEX(',', Genre) - 1) END AS MGenre,
CASE WHEN Genre not LIKE '%,%'
         THEN SUBSTRING(Genre, CHARINDEX(',', Genre) + 1, LEN(Genre)) END AS MGenre
from Progect2.dbo.Albums

