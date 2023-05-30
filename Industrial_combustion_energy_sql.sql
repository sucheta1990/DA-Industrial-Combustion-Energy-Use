use project_da_2;
select * from raw_data_csv;

--  MMBtu_TOTAL for Ethane & Ethanol 
select fuel_type, sum(mmbtu_total ) as ethane_total_mm_btu from raw_data_csv
where fuel_type in ('ethane','Ethanol (100%)' )
group by fuel_type;

--    Average GWht_TOTAL for 3M Company Facility
select FACILITY_NAME, avg(`GWht_TOTAL`) as average_values from raw_data_csv
where FACILITY_NAME ='3M Company'
group by FACILITY_NAME;

--  Unit Name trend (1950-2020) Vs GWht_TOTAL
select unit_name,sum(GWht_TOTAL) from raw_q3
where unit_name between 1950 and 2020
group by unit_name 
order by unit_name,sum(GWht_TOTAL);



-- %share of mmbtu)total and gwht_total over the regions

select MECS_Region,sum(mmbtu_total)/(select sum(mmbtu_total) from raw_data_csv)*100 as mmbtu_total ,
sum(gwht_total)/(select sum(gwht_total )from raw_data_csv)*100 as total_gwth
from  raw_data_csv
group by (1);

-- PRIMARY_NAICS_TITLE Vs Facility Name and Fuel Type Stats
select PRIMARY_NAICS_TITLE,fuel_type,FACILITY_NAME, gwht_total  from raw_data_csv
-- group by (FACILITY_NAME)
--  order by (4)





