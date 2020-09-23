#mutates and changes character to numeric
mut_snap <-function(x,n){
  temp_n <- seq(2,n+1,1)
  x <- x %>% mutate_at(temp_n,parse_number)
  for (i in 1:n){
    nam <-paste("snapraw",i,sep= "")
    x <- add_column(x, snapraw = 0,.after =1+(2*(i-1)))
  } 
  x
}
### just for shits variables
A<- 1
B<- 2
rawurls <- c("https://subscribers.footballguys.com/teams/teampage-rav-6.php",
"https://subscribers.footballguys.com/teams/teampage-buf-6.php",
"https://subscribers.footballguys.com/teams/teampage-cin-6.php",
'https://subscribers.footballguys.com/teams/teampage-cle-6.php',
"https://subscribers.footballguys.com/teams/teampage-den-6.php",
"https://subscribers.footballguys.com/teams/teampage-htx-6.php",
"https://subscribers.footballguys.com/teams/teampage-clt-6.php",
"https://subscribers.footballguys.com/teams/teampage-jax-6.php",
"https://subscribers.footballguys.com/teams/teampage-kan-6.php",
"https://subscribers.footballguys.com/teams/teampage-sdg-6.php",
"https://subscribers.footballguys.com/teams/teampage-rai-6.php",
"https://subscribers.footballguys.com/teams/teampage-mia-6.php",
"https://subscribers.footballguys.com/teams/teampage-nwe-6.php",
"https://subscribers.footballguys.com/teams/teampage-nyj-6.php",
"https://subscribers.footballguys.com/teams/teampage-pit-6.php",
"https://subscribers.footballguys.com/teams/teampage-oti-6.php",
"https://subscribers.footballguys.com/teams/teampage-crd-6.php",
"https://subscribers.footballguys.com/teams/teampage-atl-6.php",
"https://subscribers.footballguys.com/teams/teampage-car-6.php",
"https://subscribers.footballguys.com/teams/teampage-chi-6.php",
"https://subscribers.footballguys.com/teams/teampage-dal-6.php",
"https://subscribers.footballguys.com/teams/teampage-det-6.php",
"https://subscribers.footballguys.com/teams/teampage-gnb-6.php",
"https://subscribers.footballguys.com/teams/teampage-ram-6.php",
"https://subscribers.footballguys.com/teams/teampage-min-6.php",
"https://subscribers.footballguys.com/teams/teampage-nor-6.php",
"https://subscribers.footballguys.com/teams/teampage-nyg-6.php",
"https://subscribers.footballguys.com/teams/teampage-phi-6.php",
"https://subscribers.footballguys.com/teams/teampage-sea-6.php",
"https://subscribers.footballguys.com/teams/teampage-sfo-6.php",
"https://subscribers.footballguys.com/teams/teampage-tam-6.php",
"https://subscribers.footballguys.com/teams/teampage-was-6.php")
teamnames <- c(	'BAL',	'BUF',	'CIN',	'CLE',	'DEN'	,'HOU'	,'IND',	'JAX'	,'KC'	,'LAC',	'LV',	'MIA'	,'NE',	'NYJ'	,'PIT',	'TEN',
               	'ARI'	,'ATL',	'CAR'	,'CHI',	'DAL'	,'DET',	'GB'	,'LAR',	'MIN',	'NO'	,'NYG'	,'PHI'	,'SEA',	'SF',	'TB',	'WAS')
urls <- data.frame(teamnames,rawurls)
