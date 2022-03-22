
SELECT * 
FROM breed_info;

SELECT * 
FROM intelligence_info;

CREATE TABLE analysis
AS
(SELECT breed_info.weight,
  breed_info.height,
  breed_info.breed_group,
  breed_info.bred_for,
  intelligence_info.classification,
  intelligence_info.breed
FROM breed_info
INNER JOIN intelligence_info ON
intelligence_info.breed = breed_info.breed);

-- show all data in complete table
select * from analysis;
-- narrow down table keeping only dogs that the breed group and what they were bred for is known
select * 
from analysis
where (breed_group != 'Unknown' 
	and bred_for != 'Unknown');
-- show dogs where not all information is present for breed group or what they are bred for
select * 
from analysis
where (breed_group = 'Unknown' 
	or bred_for = 'Unknown');




DROP TABLE intelligence_info;
DROP TABLE breed_info;
DROP TABLE analysis
