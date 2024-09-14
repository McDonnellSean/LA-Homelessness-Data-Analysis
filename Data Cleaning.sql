-- Disable safe updates to allow deletions
SET SQL_SAFE_UPDATES = 0; 

-- Remove rows where LACity = 2
DELETE FROM `Data by census`.`hc24-data-by-census-subtract`
WHERE LACity = 2;

-- Re-enable safe updates
SET SQL_SAFE_UPDATES = 1;

-- Summarize data for 'Los Angeles city'
SELECT 
    Year,
    City,
    LACity,
    Community_Name,
    SPA, 
    sd, 
    cd, 
    ca_ssd, 
    us_cd,
    ca_sad, 
    SUM(totStreetSingAdult) AS totStreetSingAdult,
    SUM(totStreetFamHH) AS totStreetFamHH,
    SUM(totStreetFamMem) AS totStreetFamMem,
    SUM(totSafeParkSingAdult) AS totSafeParkSingAdult,
    SUM(totSafeParkFamHH) AS totSafeParkFamHH,
    SUM(totSafeParkFamMem) AS totSafeParkFamMem,
    SUM(totCars) AS totCars,
    SUM(totVans) AS totVans,
    SUM(totCampers) AS totCampers,
    SUM(totTents) AS totTents,
    SUM(totEncamp) AS totEncamp,
    SUM(totESAdultSingAdult) AS totESAdultSingAdult,
    SUM(totESAdultFamHH) AS totESAdultFamHH,
    SUM(totESAdultFamMem) AS totESAdultFamMem,
    SUM(totESYouthSingYouth) AS totESYouthSingYouth,
    SUM(totESYouthFamHH) AS totESYouthFamHH,
    SUM(totESYouthFamMem) AS totESYouthFamMem,
    SUM(totESYouthUnaccYouth) AS totESYouthUnaccYouth,
    SUM(totTHAdultSingAdult) AS totTHAdultSingAdult,
    SUM(totTHAdultFamHH) AS totTHAdultFamHH,
    SUM(totTHAdultFamMem) AS totTHAdultFamMem,
    SUM(totTHYouthSingYouth) AS totTHYouthSingYouth,
    SUM(totTHYouthFamHH) AS totTHYouthFamHH,
    SUM(totTHYouthFamMem) AS totTHYouthFamMem,
    SUM(totTHYouthUnaccYouth) AS totTHYouthUnaccYouth,
    SUM(totSHAdultSingAdult) AS totSHAdultSingAdult,
    SUM(totSHAdultFamHH) AS totSHAdultFamHH,
    SUM(totSHAdultFamMem) AS totSHAdultFamMem,
    SUM(totSHYouthSingYouth) AS totSHYouthSingYouth,
    SUM(totSHYouthFamHH) AS totSHYouthFamHH,
    SUM(totSHYouthFamMem) AS totSHYouthFamMem,
    SUM(totSHYouthUnaccYouth) AS totSHYouthUnaccYouth,
    SUM(totESPeople) AS totESPeople,
    SUM(totTHPeople) AS totTHPeople,
    SUM(totSHPeople) AS totSHPeople,
    SUM(totSheltPeople) AS totSheltPeople
FROM 
    `hc24-data-by-census-subtract`
WHERE 
    Community_Name = 'Los Angeles city'
GROUP BY 
    Year, City, LACity, Community_Name, SPA, sd, cd, ca_ssd, ca_sad, us_cd;

-- Summarize data by Council District
SELECT 
    cd,  -- Council District
    SUM(totStreetSingAdult) AS totStreetSingAdult,
    SUM(totStreetFamHH) AS totStreetFamHH,
    SUM(totStreetFamMem) AS totStreetFamMem,
    SUM(totSafeParkSingAdult) AS totSafeParkSingAdult,
    SUM(totSafeParkFamHH) AS totSafeParkFamHH,
    SUM(totSafeParkFamMem) AS totSafeParkFamMem,
    SUM(totCars) AS totCars,
    SUM(totVans) AS totVans,
    SUM(totCampers) AS totCampers,
    SUM(totTents) AS totTents,
    SUM(totEncamp) AS totEncamp,
    SUM(totESAdultSingAdult) AS totESAdultSingAdult,
    SUM(totESAdultFamHH) AS totESAdultFamHH,
    SUM(totESAdultFamMem) AS totESAdultFamMem,
    SUM(totESYouthSingYouth) AS totESYouthSingYouth,
    SUM(totESYouthFamHH) AS totESYouthFamHH,
    SUM(totESYouthFamMem) AS totESYouthFamMem,
    SUM(totESYouthUnaccYouth) AS totESYouthUnaccYouth,
    SUM(totTHAdultSingAdult) AS totTHAdultSingAdult,
    SUM(totTHAdultFamHH) AS totTHAdultFamHH,
    SUM(totTHAdultFamMem) AS totTHAdultFamMem,
    SUM(totTHYouthSingYouth) AS totTHYouthSingYouth,
    SUM(totTHYouthFamHH) AS totTHYouthFamHH,
    SUM(totTHYouthFamMem) AS totTHYouthFamMem,
    SUM(totTHYouthUnaccYouth) AS totTHYouthUnaccYouth,
    SUM(totSHAdultSingAdult) AS totSHAdultSingAdult,
    SUM(totSHAdultFamHH) AS totSHAdultFamHH,
    SUM(totSHAdultFamMem) AS totSHAdultFamMem,
    SUM(totSHYouthSingYouth) AS totSHYouthSingYouth,
    SUM(totSHYouthFamHH) AS totSHYouthFamHH,
    SUM(totSHYouthFamMem) AS totSHYouthFamMem,
    SUM(totSHYouthUnaccYouth) AS totSHYouthUnaccYouth,
    SUM(totESPeople) AS totESPeople,
    SUM(totTHPeople) AS totTHPeople,
    SUM(totSHPeople) AS totSHPeople,
    SUM(totSheltPeople) AS totSheltPeople
FROM 
    `hc24-data-by-census-subtract`
GROUP BY 
    cd
ORDER BY 
    cd;

-- Analyze street vs sheltered, individual vs family homelessness by Council District
SELECT 
    cd,  -- Council District
    -- Street Homelessness
    SUM(
        totStreetSingAdult + totStreetFamMem + totSafeParkSingAdult + totSafeParkFamMem + 
        totCars + totVans + totCampers + totTents + totEncamp
    ) AS totalStreetHomeless,
    -- Sheltered Homelessness
    SUM(totESPeople + totTHPeople + totSHPeople) AS totalShelteredHomeless,
    -- Individual Homelessness
    SUM(
        totStreetSingAdult + totSafeParkSingAdult + totESAdultSingAdult + totESYouthSingYouth + 
        totESYouthUnaccYouth + totTHAdultSingAdult + totTHYouthSingYouth + totTHYouthUnaccYouth + 
        totSHAdultSingAdult + totSHYouthSingYouth + totSHYouthUnaccYouth
    ) AS totalIndividualHomeless,
    -- Family Household Homelessness
    SUM(
        totStreetFamHH + totSafeParkFamHH + totESAdultFamHH + totESYouthFamHH + 
        totTHAdultFamHH + totTHYouthFamHH + totSHAdultFamHH + totSHYouthFamHH
    ) AS totalFamilyHouseholdHomeless,
    -- Family Member Homelessness
    SUM(
        totStreetFamMem + totSafeParkFamMem + totESAdultFamMem + totESYouthFamMem + 
        totTHAdultFamMem + totTHYouthFamMem + totSHAdultFamMem + totSHYouthFamMem
    ) AS totalFamilyMemberHomeless,
    -- Emergency Shelter People
    SUM(totESPeople) AS totalESPeople,
    -- Transitional Housing People
    SUM(totTHPeople) AS totalTHPeople,
    -- Safe Haven People
    SUM(totSHPeople) AS totalSHPeople,
    -- Total Homelessness
    SUM(
        totStreetSingAdult + totStreetFamMem + totSafeParkSingAdult + totSafeParkFamMem + 
        totCars + totVans + totCampers + totTents + totEncamp + totESPeople + totTHPeople + totSHPeople
    ) AS totalHomeless
FROM 
    `hc24-data-by-census-subtract`
GROUP BY 
    cd
ORDER BY 
    cd;
