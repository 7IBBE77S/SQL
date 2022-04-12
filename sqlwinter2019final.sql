

--first
select nameFirst + ', ' + namelast as Name, G as GP, AB, R, H, B2 as [2B], B3 as [3B],HR, RBI, 
1*singles + 2*B2 + 3*B3 + 4*HR as TB, BB, SO as K, SB, H/(Case when AB=0 then 1.0 else AB end) as 'BA',
 (H+BB+HBP)/(Case when (AB+BB+HBP)=0 then 1.0 else (AB+BB+HBP) end) as OBP, (1*singles + 2*B2 + 3*B3 + 4*HR)/
(Case when AB=0 then 1.0 else AB end) as SLG, 
(H+BB+HBP)/(Case when (AB+BB+HBP)=0 then 1.0 else (AB+BB+HBP) end) + (1*singles + 2*B2 + 3*B3 + 4*HR)/
(Case when AB=0 then 1.0 else AB end) as OPS from vwPlayersBatting
where yearid = '2010' and teamID = 'NYA'
order by BA desc

--second
select nameFirst + ', ' + namelast as Name, (H/(Case when AB=0 then 1.0 else AB end)) as BA from vwPlayersBatting
where H/(Case when AB=0 then 1.0 else AB end) = (
select max(H/(Case when AB=0 then 1.0 else AB end)) as 'BA' from vwPlayersBatting
where AB > 500 and yearid = '2010' and teamID = 'NYA') and yearid = '2010' and teamID = 'NYA'

--third
select nameFirst + ', ' + namelast as Name,(H+BB+HBP)/(Case when (AB+BB+HBP)=0 then 1.0 else (AB+BB+HBP)end) as OBP from vwPlayersBatting 
where (H+BB+HBP)/(Case when (AB+BB+HBP)=0 then 1.0 else (AB+BB+HBP)end) = (
select max(OBP) as OBP from (
select nameFirst + ', ' + namelast as Name, (H+BB+HBP)/(Case when (AB+BB+HBP)=0 then 1.0 else (AB+BB+HBP)end) as OBP from vwPlayersBatting
where yearid = '2010' and teamID = 'NYA') as OBP) and yearid = '2010' and teamID = 'NYA'

--fourth
select nameFirst + ', ' + namelast as Name, HR from vwPlayersBatting
where hr = (
select max(HR) from vwPlayersBatting
where yearid = '2010' and teamID = 'NYA') and yearid = '2010' and teamID = 'NYA'

--fifth
select nameFirst + ', ' + namelast as Name, rbi from vwPlayersBatting
where rbi = (
select max(RBI) from vwPlayersBatting
where yearid = '2010' and teamID = 'NYA') and yearid = '2010' and teamID = 'NYA'

--sixth
select nameFirst + ', ' + namelast as Name, H from vwPlayersBatting
where H = (
select max(H) from vwPlayersBatting
where yearid = '2010' and teamID = 'NYA') and yearid = '2010' and teamID = 'NYA'

--seventh
select sum(G) as GP, sum(AB) as AB, sum(R) as R, sum(H) as H, sum(B2) as [2B], sum(B3) as [3B], sum(HR) as HR, sum(RBI) as RBI, sum(1*singles + 2*B2 + 3*B3 + 4*HR) as TB, sum(BB) as BB, sum(SO) as K,
sum(SB) as SB, sum(H/(Case when AB=0 then 1.0 else AB end)) as 'BA', sum((H+BB+HBP)/(Case when (AB+BB+HBP)=0 then 1.0 else (AB+BB+HBP) end)) as OBP,
sum((1*singles + 2*B2 + 3*B3 + 4*HR)/
(Case when AB=0 then 1.0 else AB end)) as SLG, sum((H+BB+HBP)/(Case when (AB+BB+HBP)=0 then 1.0 else (AB+BB+HBP) end) + (1*singles + 2*B2 + 3*B3 + 4*HR)/
(Case when AB=0 then 1.0 else AB end)) as OPS from vwPlayersBatting
where yearid = '2010' and teamID = 'NYA'
order by BA desc 


