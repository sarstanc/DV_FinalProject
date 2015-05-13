require("rjson")
require("RCurl")

#join and import data
df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select ZIP_CODE, CENSUS, resrate, substr(unemp_rate,1,length(unemp_rate)-1) as unemployment_Percentage
FROM POPULATION p INNER JOIN UNEMPLOYMENT u ON p.ZIP_CODE=u.ZIP 
INNER JOIN UTILITY_RATES r on p.ZIP_CODE=r.ZIP 
WHERE unemp_rate IS NOT NULL AND resrate != 0
ORDER BY lpad(unemployment_Percentage,2) desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal',USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

head(df)
