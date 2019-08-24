* Clean up the DPIP dataset on IP geolocations
*
insheet using ../data/dbip-city-2017-04.csv, comma clear

rename v1 ip_start
rename v2 ip_end
rename v3 country
rename v4 stateprov
rename v5 city


keep if country=="US"

*    Idea is: a given 3-block IP can be converted
*    to an int, then placed in one of the intervals
*        [ip_start_int, ip_end_int]
*    to match with city.

split ip_start, parse(.) generate(ips_)
destring ips_*,replace force
keep if ~missing(ips_1)
drop ips_4
gen ip_start_int = ips_3 + 1000*ips_2 + 1000^2*ips_1

split ip_end, parse(.) generate(ipe_)
destring ipe_*,replace force
drop ipe_4
keep if ~missing(ipe_1)
gen ip_end_int = ipe_3 + 1000*ipe_2 + 1000^2*ipe_1

format ip_end_int ip_start_int %9.0f
preserve
   keep ip_end_int ip_start_int stateprov city
   outsheet using ip_range_to_city.csv,comma replace
restore

compress
save ../data/dbip_data_clean.dta,replace
