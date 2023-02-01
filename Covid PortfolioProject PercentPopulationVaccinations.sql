--- Creating View to store data for later visualitations 

create view `ihsan837.portfolio.PercenrtPopulationVaccinated`  as 
SELECT dea.continent, dea.location, dea.date, vac.population, vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
FROM `ihsan837.portfolio.coviddeaths` dea join `ihsan837.portfolio.covidvaccinations` vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null;


--- query the view

select * from `ihsan837.portfolio.PercenrtPopulationVaccinated`
