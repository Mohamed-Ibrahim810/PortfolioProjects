
select * from CovidDeaths
order by 3,4

select * from CovidVaccinations
order by 3,4


--select the data that I am going to be using

select location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths
order by 2


--The percentage of people who died by covid

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths
where location like 'china'
order by 1,2


--The percentage of people who got covid
select location, date, total_cases, population, (total_cases/population) as CasesPercentage
from CovidDeaths
where location like 'egypt'
order by 2


--Looking at countries with the highest infection rate

select location, population, MAX(total_cases) as Total_Cases,
MAX((total_cases/population))*100 as Infection_Rate
from CovidDeaths
--where location like 'egypt'
where continent is not null
group by location, population
order by 4


--Looking at countries with the highest death rate

select location, population, MAX(total_deaths) as Total_Deaths,
MAX((total_deaths/population))*100 as Death_Rate
from CovidDeaths
--where location like 'egypt'
where continent is not null
GROUP by location, population
order by 4


--global numbers

select  sum(Distinct(population)) as Globalpopulation, sum(new_cases) Total_casese,
sum(cast(new_deaths as int)) Total_deaths,
(sum(cast(new_deaths as int))/sum(new_cases))*100 as Death_Percentage_In_cases,
(sum(cast(new_deaths as int))/sum(Distinct(population)))*100 as Death_Percentage_In_population
from CovidDeaths
where continent is not null
--group by date
order by 1,2

select *
from CovidVaccinations


--The percentage of people who got Vaccinated

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER
(Partition by dea.location Order by dea.location, dea.Date) as VaccinatedPeople
--CONVERT(int,vac.new_vaccinations)....
from CovidDeaths dea
join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3


--using CTE

with populationVaccines(continent, location, date, population, new_vaccinations,VaccinatedPeople)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER
(Partition by dea.location Order by dea.location, dea.Date) as VaccinatedPeople
from CovidDeaths dea
join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
)
select *, (VaccinatedPeople/population)*100 as Percentage_Of_VaccinatedPeople
from populationVaccines
order by 2,3


--Using Temp Table

Drop table if exists #populationVaccines
create table #populationVaccines
(
Continent nvarchar(20),
Location nvarchar(50),
Date datetime,
population numeric,
new_vaccinations numeric,
VaccinatedPeople numeric
)

insert into #populationVaccines

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER
(Partition by dea.location Order by dea.location, dea.Date) as VaccinatedPeople
from CovidDeaths dea
join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
order by 2,3

select *, (VaccinatedPeople/population)*100 as Percentage_Of_VaccinatedPeople
from #populationVaccines


--Create view to store data for later visualization

create view populationVaccines
as 
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER
(Partition by dea.location Order by dea.location, dea.Date) as VaccinatedPeople
--CONVERT(int,vac.new_vaccinations)....
from CovidDeaths dea
join CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null

select * from populationVaccines














