require("data.table")
require("ggplot2")
require("gridExtra")
require("readxl")

#####
# 2019
#####
# download file
url = "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2019.xlsx"
path = tempfile()
download.file(url, path, mode="wb")
# read file
dt_19 = data.table(read_excel(path, sheet = 1, skip = 3,
                              col_names = c("country_name", "country_code", "region", "cpi_score", "cpi_rank", "cpi_se", "cpi_sources", "cpi_ci_low", "cpi_ci_high", "cpi_adb_cpia", "cpi_bf_sgi", "cpi_bf_bti", "cpi_eiu_cr", "cpi_fh_nit", "cpi_gi_crr", "cpi_imd_wcy", "cpi_perc_arg", "cpi_prs_icrg", "cpi_vodp", "cpi_wb_cpia", "cpi_wef_eos", "cpi_wjp_rol")))
# year
dt_19[, year := 2019]

#####
# 2018
#####
# download file
url = "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2018.xlsx"
path = tempfile()
download.file(url, path, mode="wb")
# read file
dt_18 = data.table(read_excel(path, sheet = 1, skip = 3,
                              col_names = c("country_name", "country_code", "region", "cpi_score", "cpi_rank", "cpi_se", "cpi_sources", "cpi_ci_high", "cpi_ci_low", "cpi_adb_cpia", "cpi_bf_sgi", "cpi_bf_bti", "cpi_eiu_cr", "cpi_fh_nit", "cpi_gi_crr", "cpi_imd_wcy", "cpi_perc_arg", "cpi_prs_icrg", "cpi_wb_cpia", "cpi_wef_eos", "cpi_wjp_rol", "cpi_vodp")))
# year
dt_18[, year := 2018]

#####
# 2017
#####
# download file
url = "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2017.xlsx"
path = tempfile()
download.file(url, path, mode="wb")
# read file
list1 = excel_sheets(path)[-c(1:3)]
list2 = lapply(list1, read_excel, path = path, skip = 2)
dt_17 = rbindlist(list2, fill = TRUE)
# standard column names
colnames(dt_17) = c("country_name", "country_code", "cpi_score", "cpi_rank", "cpi_se", "cpi_ci_low", "cpi_ci_high", "cpi_sources", "cpi_wb_cpia", "cpi_wef_eos", "cpi_gi_crr", "cpi_bf_bti", "cpi_adb_cpia", "cpi_imd_wcy", "cpi_bf_sgi", "cpi_wjp_rol", "cpi_prs_icrg", "cpi_vodp", "cpi_eiu_cr", "cpi_fh_nit", "cpi_perc_arg", "dup1", "dup2", "dup3", "dup4")
# remove duplicates
dt_17 = dt_17[(!duplicated(country_name)) & (!is.na(country_name)) & !(country_name == "REGIONAL AVERAGE"), ]
# year
dt_17[, year := 2017]

#####
# 2016
#####
# download file
url = "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2016.xlsx"
path = tempfile()
download.file(url, path, mode="wb")
# read file
dt_16 = data.table(read_excel(path, sheet = 1, skip = 1,
                              col_names = c("country_name", "cpi_score", "cpi_rank", "region", "country_code", "cpi_wb_cpia", "cpi_wef_eos", "cpi_gi_crr", "cpi_bf_bti", "cpi_adb_cpia", "cpi_imd_wcy", "cpi_bf_sgi", "cpi_wjp_rol", "cpi_prs_icrg", "cpi_vodp", "cpi_eiu_cr", "cpi_fh_nit", "cpi_perc_arg", "dup1", "dup2", "dup3", "cpi_sources", "cpi_se", "cpi_ci_low", "cpi_ci_high", "cpi_min", "cpi_max", "oecd", "g20", "brics", "eu", "arab", "n/a")))
# year
dt_16[, year := 2016]

#####
# 2015
#####
# download file
url = "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2015.xlsx"
path = tempfile()
download.file(url, path, mode="wb")
# read file
dt_15 = data.table(read_excel(path, sheet = 1, skip = 1,
                              col_names = c("cpi_rank", "country_name", "country_code", "region", "cpi_score", "cpi_sources", "cpi_se", "cpi_min", "cpi_max", "cpi_ci_low", "cpi_ci_high", "cpi_wb_cpia", "cpi_wef_eos", "cpi_bf_bti", "cpi_adb_cpia", "cpi_imd_wcy", "cpi_bf_sgi", "cpi_wjp_rol", "cpi_prs_icrg", "cpi_eiu_cr", "cpi_ihs_gi", "cpi_perc_arg", "cpi_fh_nit")))
# year
dt_15[, year := 2015]

#####
# 2014
#####
# download file
url = "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2014.xlsx"
path = tempfile()
dir = tempdir()
download.file(url, path, mode="wb")
# read file
dt_14 = data.table(read_excel(path, sheet = 1, skip = 1,
                              col_names = c("cpi_rank", "country_name", "country_code", "region", "cpi_score", "cpi_sources", "cpi_se", "cpi_min", "cpi_max", "cpi_ci_low", "cpi_ci_high", "cpi_adb_cpia", "cpi_bf_sgi", "cpi_bf_bti", "cpi_imd_wcy", "cpi_prs_icrg", "cpi_wb_cpia", "cpi_wef_eos", "cpi_wjp_rol", "cpi_eiu_cr", "cpi_ihs_gi", "cpi_perc_arg", "cpi_fh_nit")))
# year
dt_14[, year := 2014]

#####
# 2013
#####
# download file
url = "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2013.xlsx"
path = tempfile()
dir = tempdir()
download.file(url, path, mode="wb")
# read file
dt_13 = data.table(read_excel(path, sheet = 1, skip = 3,
                              col_names = c("cpi_rank", "country_name", "country_code", "ifs_code", "region", "dup1", "cpi_score", "cpi_sources", "cpi_se", "cpi_ci_low", "cpi_ci_high", "cpi_min", "cpi_max", "cpi_adb_cpia", "cpi_bf_sgi", "cpi_bf_bti", "cpi_imd_wcy", "cpi_prs_icrg", "cpi_wb_cpia", "cpi_wef_eos", "cpi_wjp_rol", "cpi_eiu_cr", "cpi_ihs_gi", "cpi_perc_arg", "cpi_ti_bps", "cpi_fh_nit")))
# year
dt_13[, year := 2013]

#####
# 2012
#####
# download file
url = "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2012.xlsx"
path = tempfile()
dir = tempdir()
download.file(url, path, mode="wb")
# read file
dt_12 = data.table(read_excel(path, sheet = 1, skip = 2,
                              col_names = c("cpi_rank", "country_name", "region", "cpi_score", "dup1", "cpi_sources", "cpi_se", "cpi_ci_low", "cpi_ci_high", "cpi_min", "cpi_max", "cpi_adb_cpia", "cpi_bf_sgi", "cpi_bf_bti", "cpi_imd_wcy", "cpi_prs_icrg", "cpi_wb_cpia", "cpi_wef_eos", "cpi_wjp_rol", "cpi_eiu_cr", "cpi_ihs_gi", "cpi_perc_arg", "cpi_ti_bps", "cpi_fh_nit")))
# year
dt_12[, year := 2012]

#####
# 2011
#####
# download file
url = "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2011.xlsx"
path = tempfile()
dir = tempdir()
download.file(url, path, mode="wb")

path = "C:/Users/desk/google_drive/research/_packages/ipsed/data-raw/cpi/cpi_2011.xlsx"
# read file
dt_11 = data.table(read_excel(path, sheet = 1, skip = 2,
                              col_names = c("cpi_rank", "country_name", "cpi_score", "dup1", "cpi_sources", "cpi_se", "cpi_min", "cpi_max", "cpi_ci_low", "cpi_ci_high", "cpi_adb_gr", "cpi_adb_cpia", "cpi_bf_sgi", "cpi_bf_bti", "cpi_eiu_cr", "cpi_fh_nit", "cpi_ihs_gi", "cpi_imd_wcy_2010", "cpi_imd_wcy", "cpi_perc_arg_2010", "cpi_perc_arg", "cpi_prs_icrg", "cpi_ti_bps", "cpi_wb_cpia", "cpi_wef_eos_2010", "cpi_wef_eos", "cpi_wjp_rol")))
# year
dt_11[, year := 2011]

#####
# 2010
#####
# download file
url = "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2010.xlsx"
path = tempfile()
download.file(url, path, mode="wb")
# read file
dt_10 = data.table(read_excel(path, sheet = 1, skip = 4,
                              col_names = c("cpi_rank", "country_name", "cpi_score", "cpi_sources", "cpi_se", "cpi_min", "cpi_max", "cpi_ci_low", "cpi_ci_high", "cpi_adb_cpia", "cpi_adb_gr", "cpi_bf_bti", "cpi_eiu_cr", "cpi_fh_nit", "cpi_ihs_gi", "cpi_imd_wcy_2009", "cpi_imd_wcy", "cpi_perc_arg_2009", "cpi_perc_arg", "cpi_wb_cpia", "cpi_wef_eos_2009", "cpi_wef_eos")))
# year
dt_10[, year := 2010]

#####
# 2009-1997
#####
urls_csv = c("https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2009.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2008.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2007.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2006.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2005.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2004.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2003.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2002.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2001.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_2000.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_1999.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_1998.csv",
             "https://github.com/abissellsiders/ipsed/raw/master/data-raw/cpi/cpi_1997.csv")
download_fread_csv = function(x) {
  year = 2010 - x
  url = urls_csv[x]
  # download file
  path = tempfile()
  download.file(url, path, mode="wb")
  # read csv
  dt = fread(path)
  # standard column names
  colnames(dt) = c("country_name", "country_code", "region", "cpi_score", "cpi_rank", "interval")[1:dim(dt)[2]]
  # year
  dt[, year := year]
  # return
  return(dt)
}
list_09 = lapply(1:13, download_fread_csv)

#####
# 1980-85, 1988-92, 1993-96
#####
# manually exported to spreadsheet pages 5-6 with Adobe Acrobat DC: https://www.transparency.org/files/content/tool/1996_CPI_EN.pdf
# manually added variances for 1993-96, 1988-92, 1980-85
# dt = data.table(read_excel("C:/Users/desk/Downloads/1996_CPI_EN.xlsx"))
# dput(dt)
dt = structure(list(country_name = c("New Zealand", "Denmark", "Sweden", "Finland", "Canada", "Norway", "Singapore", "Switzerland", "Netherlands", "Australia", "Ireland", "United Kingdom", "Germany", "Israel", "United States", "Austria", "Japan", "Hong Kong", "France", "Belgium", "Chile", "Portugal", "South Africa", "Poland", "Czech Republic", "Malaysia", "Korea", "Greece", "Taiwan", "Jordan", "Hungary", "Spain", "Turkey", "Italy", "Argentina", "Bolivia", "Thailand", "Mexico", "Ecuador", "Brazil", "Egypt", "Colombia", "Uganda", "Philippines", "Indonesia", "India", "Russia (USSR)", "Venezuela", "Cameroon", "China", "Bangladesh", "Kenya", "Pakistan", "Nigeria"),
                    cpi_93_96 = c(9.43, 9.33, 9.08, 9.05, 8.96, 8.87, 8.80, 8.76, 8.71, 8.60, 8.45, 8.44, 8.27, 7.71, 7.66, 7.59, 7.05, 7.01, 6.96, 6.84, 6.80, 6.53, 5.68, 5.57, 5.37, 5.32, 5.02, 5.01, 4.98, 4.89, 4.86, 4.31, 3.54, 3.42, 3.41, 3.40, 3.33, 3.30, 3.19, 2.96, 2.84, 2.73, 2.71, 2.69, 2.65, 2.63, 2.58, 2.50, 2.46, 2.43, 2.29, 2.21, 1.00, 0.69),
                    variance_93_96 = c(0.39, 0.44, 0.3, 0.23, 0.15, 0.2, 2.36, 0.24, 0.25, 0.48, 0.44, 0.25, 0.53, 1.41, 0.19, 0.41, 2.61, 1.79, 1.58, 1.41, 2.53, 1.17, 3.3, 3.63, 2.11, 0.13, 2.3, 3.37, 0.87, 0.17, 2.19, 2.48, 0.3, 4.78, 0.54, 0.64, 1.24, 0.22, 0.42, 1.07, 6.64, 2.41, 8.72, 0.49, 0.95, 0.12, 0.94, 0.4, 2.98, 0.52, 1.57, 3.69, 2.52, 6.37),
                    sources_93_96 = c(6, 6, 6, 6, 6, 6, 10, 6, 6, 6, 6, 7, 6, 5, 7, 6, 9, 9, 6, 6, 7, 6, 6, 4, 4, 9, 9, 6, 9, 4, 6, 6, 6, 6, 6, 4, 10, 7, 4, 7, 4, 6, 4, 8, 10, 9, 5, 7, 4, 9, 4, 4, 5, 4),
                    cpi_88_92 = c(9.30, 8.88, 8.71, 8.88, 8.97, 8.69, 9.16, 9.00, 9.03, 8.20, 7.68, 8.26, 8.13, 7.44, 7.76, 7.14, 7.25, 6.87, 7.45, 7.40, 5.51, 5.50, 7.00, 5.20, 5.20, 5.10, 3.50, 5.05, 5.14, 5.51, 5.22, 5.06, 4.05, 4.30, 5.91, 1.34, 1.85, 2.23, 3.27, 3.51, 1.75, 2.71, 3.27, 1.96, 0.57, 2.89, 3.27, 2.50, 3.43, 4.73, 0.00, 1.60, 1.90, 0.63),
                    sources_88_92 = c(3, 3, 3, 3, 3, 3, 4, 3, 3, 3, 3, 3, 3, 2, 3, 3, 4, 4, 3, 3, 2, 3, 3, 1, 1, 4, 4, 3, 4, 2, 2, 3, 3, 3, 2, 1, 4, 3, 2, 3, 2, 2, 1, 3, 4, 3, 1, 3, 2, 3, 1, 2, 3, 2),
                    cpi_80_85 = c(8.41, 8.01, 8.01, 8.14, 8.41, 8.41, 8.41, 8.41, 8.41, 8.41, 8.28, 8.01, 8.14, 7.27, 8.41, 7.35, 7.75, 7.35, 8.41, 8.28, 6.53, 4.46, 7.35, 3.64, 5.13, 6.29, 3.93, 4.20, 5.95, 5.30, 1.63, 6.82, 4.06, 4.86, 4.94, 0.67, 2.42, 1.87, 4.54, 4.67, 1.12, 3.27, 0.67, 1.04, 0.20, 3.67, 5.13, 3.19, 4.59, 5.13, 0.78, 3.27, 1.52, 0.99),
                    sources_80_85 = c(2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 1, 2, 2, 2, 2)),
               row.names = c(NA, -54L),
               class = c("data.table", "data.frame"))
dt_93 = rbindlist(lapply(1996:1993, function(x){dt[, c("country_name", "cpi_93_96", "sources_93_96"), with = FALSE][, year := x]}))
colnames(dt_93) = c("country_name", "cpi_score", "cpi_sources", "year")
dt_88 = rbindlist(lapply(1992:1988, function(x){dt[, c("country_name", "cpi_88_92", "sources_88_92"), with = FALSE][, year := x]}))
colnames(dt_88) = c("country_name", "cpi_score", "cpi_sources", "year")
dt_80 = rbindlist(lapply(1985:1980, function(x){dt[, c("country_name", "cpi_80_85", "sources_80_85"), with = FALSE][, year := x]}))
colnames(dt_80) = c("country_name", "cpi_score", "cpi_sources", "year")

#####
# combine data
#####
cpi = rbindlist(c(list(dt_19, dt_18, dt_17, dt_16, dt_15, dt_14, dt_13, dt_12, dt_11, dt_10), list_09, list(dt_93, dt_88, dt_80)), fill=TRUE)

#####
# clean country names
#####
# qa checks
# sort(unique(cpi[["country_name"]]))

# character conversions
country_names = cpi[["country_name"]]
country_names = gsub("&", "and", country_names)
country_names = gsub("´|’", "'", country_names)
country_names = gsub("\\.|,|\\(|\\)", "", country_names)
country_names = tolower(country_names)
country_names = gsub(" the | of | of the ", " ", country_names)
country_names = gsub("  ", " ", country_names)
country_names = gsub("^the | of$| the$", "", country_names)

# lowercase
cpi[, country_name := country_names]

# brunei
cpi[grep("brunei", country_name), country_name := "brunei"]
# cabo verde
cpi[grep("verde", country_name), country_name := "cabo verde"]
# cote d'ivoire
cpi[grep("voire|ivory", country_name), country_name := "cote d'ivoire"]
# czechia
cpi[grep("czech", country_name), country_name := "czechia"]
# dominican republic
cpi[grep("dominican", country_name), country_name := "dominican republic"]
# eswatini
cpi[grep("swaziland", country_name), country_name := "eswatini"]
# guinea bissau
cpi[grep("bissau", country_name), country_name := "guinea-bissau"]
# kiribati
cpi[grep("ribati", country_name), country_name := "kiribati"]
# kyrgyzstan
cpi[grep("kyrgyz", country_name), country_name := "kyrgyzstan"]
# kuwait
cpi[grep("kuw.it", country_name), country_name := "kuwait"]
# macao
cpi[grep("maca", country_name), country_name := "macao"]
# macedonia
cpi[grep("maced", country_name), country_name := "north macedonia"]
# moldova
cpi[grep("moldov", country_name), country_name := "moldova"]
# palestine
cpi[grep("palest", country_name), country_name := "palestine"]
# slovakia
cpi[grep("slovak", country_name), country_name := "slovakia"]
# vietnam
cpi[grep("viet {0,1}nam", country_name), country_name := "vietnam"]
# usa
cpi[grep("^usa$|united states", country_name), country_name := "united states"]
# qa check
# grep("brunei|verde|voire|ivory|czech|dominican|swaziland|bissau|ribati|kyrgyz|kuw.it|maca|maced|moldov|palest|slovak|viet {0,1}nam|united states", unique(cpi[["country_name"]]), value = TRUE)

# dissolution: soviet union
cpi[country_name %in% c("russia ussr", "russia"), country_name := c("soviet union", "russia")[(year > 1991) + 1], by = c("year")]
# qa check
(l = grep("russia|soviet", unique(cpi[["country_name"]]), value = TRUE))
length(l) == 2

# split: congos
cpi[country_name %in% c("congo democratic republic", "democratic republic congo"), country_name := "congo-kinshasa"]
cpi[country_name %in% c("congo", "congo republic", "republic congo", "congo brazzaville"), country_name := "congo-brazzaville"]
# qa check
(l = grep("congo", unique(cpi[["country_name"]]), value = TRUE))
length(l) == 2

# split: czechoslovakia (occurred in 1993 but CPI didn't add Slovakia until 1997)
cpi[(country_name %in% c("czechia")) & (year < 1997), country_name := c("czechoslovakia")]
(l = grep("czech|slovak", unique(cpi[["country_name"]]), value = TRUE))
length(l) == 3

# split: koreas (occurred in 1950 but CPI didn't add North until 1997)
cpi[(country_name %in% c("korea")) & (year < 1997), country_name := c("korea south")]
cpi[(country_name %in% c("south korea")), country_name := c("korea south")]
# qa check
(l = grep("korea", unique(cpi[["country_name"]]), value = TRUE))
length(l) == 2

# split: sudans
cpi[(country_name == "sudan") & (year >= 2013), country_name := "sudan north"]
(l = grep("sudan", unique(cpi[["country_name"]]), value = TRUE))
length(l) == 3

# qa checks
# View(cpi[is.na(country_name), ])
# View(cpi[(is.na(country_name)) | (country_name %in% c("Country", "Country/Territory", "REGIONAL AVERAGE")), ])
# sort(unique(cpi[["country_name"]]))

#####
# convert country names
#####
# countries = ipsed::countries
# countries = fread("C:/Users/desk/google_drive/research/_packages/ipsed/data-raw/countries.csv")
# convert country codes
short_convert = setNames(countries[["master_short"]], countries[["cpi_country"]])
cpi[, country_code := short_convert[country_name]]
# convert country names
long_convert = setNames(countries[["master_long"]], countries[["cpi_country"]])
cpi[, country_name := long_convert[country_name]]

# qa checks
# dim(cpi[is.na(country_name2), ])

#####
# convert cpi score to numeric
#####
cpi[, cpi_score := gsub(",", ".", cpi_score)]
cpi[, cpi_score := as.numeric(cpi_score)]

#####
# minimum & maximum from interval
#####
pattern = "^(-{0,1}[[:digit:]]).([[:digit:]])[^[:digit:]]*([[:digit:]]){0,2}.([[:digit:]]){0,1}$"
cpi[!is.na(interval), `:=`(cpi_min = as.numeric(gsub(pattern, "\\1.\\2", interval)),
                           cpi_max = as.numeric(gsub(pattern, "\\3.\\4", interval))), by = c("country_name", "year")]

# qa check
# View(cpi[!is.na(interval) & (is.na(cpi_min) | is.na(cpi_max)), c("country_name", "country_code", "year", "cpi_score", "interval", "cpi_min", "cpi_max"), with = FALSE])

#####
# version
#####
cpi[year %in% 2012:2019, `:=`(cpi_version = 3,
                              cpi_weight = 1)]
cpi[year %in% 1998:2011, `:=`(cpi_version = 2,
                              cpi_weight = 1)]
cpi[year %in% 1980:1997, cpi_version := 1]
cpi[year %in% 1997, cpi_weight := 1]
cpi[year %in% 1993:1996, cpi_weight := 1/4]
cpi[year %in% 1988:1992, cpi_weight := 1/5]
cpi[year %in% 1980:1985, cpi_weight := 1/6]
# View(cpi[is.na(version), ])

#####
# rescale cpi scores to same scale 0-1
#####
# rescale values to 0-1
cpi[cpi_version %in% 1:2, cpi_rescaled := cpi_score / 10]
cpi[cpi_version %in% 3, cpi_rescaled := cpi_score / 100]
# error in Brunei 2010
cpi[cpi_rescaled > 1, `:=`(cpi_score = cpi_score / 10,
                           cpi_rescaled = cpi_rescaled / 10)]

#####
# link cpi scores across 2011-2012: method 1
#####
# linked values: set both 2012 and 2011 as having same standard deviation
cpi[year > 2011, cpi_linked := cpi_rescaled]
var12 = var(cpi[year == 2012, ][["cpi_rescaled"]])
var11 = var(cpi[year == 2011, ][["cpi_rescaled"]])
coef = sqrt(var12) / sqrt(var11)
cpi[year < 2012, cpi_linked := cpi_rescaled * coef]
# linked values: set both 2012 and 2011 as having same mean
m12 = mean(cpi[year == 2012, ][["cpi_linked"]])
m11 = mean(cpi[year == 2011, ][["cpi_linked"]])
diff = m12 - m11
cpi[year < 2012, cpi_linked := cpi_linked + diff]

#####
# link cpi scores across 2011-2012: method 2
#####
transfunc = Vectorize(function(x, e = 1.1, m = .5) {
  return(abs(x - m)^e * sign(x - m) + m)
})
onefunc = function(v) {
  v = (v - mean(v)) / (max(v) - min(v))
  v = v - min(v)
  return(v)
}

cpi[year >= 2012, cpi_linked := cpi_rescaled]
cpi[year <= 2011, cpi_linked := transfunc(cpi_rescaled, e = 1.1, m = .625), by = c("year")]

range(cpi[year == 2012, ][["cpi_linked"]])
# hist(cpi[year == 2012, ][["cpi_linked"]], (0:20)/20)
range(cpi[year == 2011, ][["cpi_linked"]])
# hist(cpi[year == 2011, ][["cpi_linked"]], (0:20)/20)

#####
# diagnostics for linking cpi scores
#####
# ks test
dis1 = cpi[year %in% (2011:2011-4), ][["cpi_linked"]]
dis2 = cpi[year %in% (2012:2012+4), ][["cpi_linked"]]
ks.test(dis1, dis2)

# distribution plots
gdt = cpi[year %in% (2011-4):(2012+4), ]
g1 = ggplot(gdt, mapping = aes(fill = factor(year), color = factor(year), x = cpi_rescaled)) + geom_density (alpha = .25)
g2 = ggplot(gdt, mapping = aes(fill = factor(year), color = factor(year), x = cpi_linked)) + geom_density (alpha = .25)
g3 = ggplot(gdt, mapping = aes(fill = year>=2012, color = year>=2012, x = cpi_rescaled)) + geom_density (alpha = .25)
g4 = ggplot(gdt, mapping = aes(fill = year>=2012, color = year>=2012, x = cpi_linked)) + geom_density (alpha = .25)
grid.arrange(g1,g2,g3,g4)

names = copy(cpi)[year == 1985, N := TRUE][N == TRUE, ][["country_name"]]
sdt = copy(cpi)[country_name %in% names, ]
sdt = sdt[, .(mean_rescaled = mean(cpi_rescaled),
             mean_linked = mean(cpi_linked)), by = c("year")]
sdt = melt(sdt, id.vars = "year")
ggplot(sdt, aes(x = year, y = value, color = variable, group = variable)) + geom_point() + geom_line() + geom_vline(xintercept = 2011.5)

ggplot(cpi[country_name %in% names, ], aes(x = year, y = cpi_linked, group = 1)) +
  facet_wrap(~ country_code) +
  geom_line() +
  theme(legend.position="none") +
  geom_vline(xintercept = 2011.5)

#####
# subset data
#####
cpi = cpi[, c("country_code", "country_name", "year", "cpi_version", "cpi_weight", "cpi_score", "cpi_rescaled", "cpi_linked", "cpi_sources", "cpi_se", "cpi_min", "cpi_max", "cpi_adb_cpia", "cpi_bf_sgi", "cpi_bf_bti", "cpi_eiu_cr", "cpi_fh_nit", "cpi_gi_crr", "cpi_imd_wcy", "cpi_perc_arg", "cpi_prs_icrg", "cpi_vodp", "cpi_wb_cpia", "cpi_wef_eos", "cpi_wjp_rol"), with = FALSE]
