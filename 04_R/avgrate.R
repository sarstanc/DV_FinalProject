require("rjson")
require("RCurl")
require("ggplot2")
#join and import data
df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select ZIP_CODE, CENSUS, resrate, indrate, comrate, 
(to_number(resrate) )/3 as Avg_rate
FROM POPULATION p INNER JOIN UNEMPLOYMENT u ON p.ZIP_CODE=u.ZIP 
INNER JOIN UTILITY_RATES r on p.ZIP_CODE=r.ZIP
WHERE resrate != 0 AND indrate !=0 AND comrate != 0
ORDER BY Avg_rate desc
"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal',USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)


head(df)
#Needs some vis? help?
pop <- ggplot(df, aes(x=ZIP_CODE, y=CENSUS))
pop <- pop + geom_point() + ggtitle("Population by Zipcode")
pop
