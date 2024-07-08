SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET escape_string_warning=off;
SET default_tablespace = '';
SET default_table_access_method = heap;

START TRANSACTION;
SET SCHEMA 'common';
-- STILL NEED TO TICK the bools after creating areas, this is done in area-setattributes
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A016','NIE','IE') ON CONFLICT (eic) DO NOTHING;             --  CTA|NIE, MBA|SEM(SONI), SCA|NIE
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A39I','EE','EE') ON CONFLICT (eic) DO NOTHING;              --  SCA|EE, MBA|EE, CTA|EE, BZN|EE, Estonia (EE)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A44P','SE1','SE') ON CONFLICT (eic) DO NOTHING;             --  IPA|SE1, BZN|SE1, MBA|SE1, SCA|SE1
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A45N','SE2','SE') ON CONFLICT (eic) DO NOTHING;             --  SCA|SE2, MBA|SE2, BZN|SE2, IPA|SE2
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A46L','SE3','SE') ON CONFLICT (eic) DO NOTHING;             --  IPA|SE3, BZN|SE3, MBA|SE3, SCA|SE3
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A47J','SE4','SE') ON CONFLICT (eic) DO NOTHING;             --  SCA|SE4, MBA|SE4, BZN|SE4, IPA|SE4
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A48H','NO','NO') ON CONFLICT (eic) DO NOTHING;              --  IPA|NO5, IBA|NO5, BZN|NO5, MBA|NO5, SCA|NO5
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A49F','RU','RU') ON CONFLICT (eic) DO NOTHING;              --  SCA|RU, MBA|RU, BZN|RU, CTA|RU
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A50U','RU-KGD','RU') ON CONFLICT (eic) DO NOTHING;          --  CTA|RU-KGD, BZN|RU-KGD, MBA|RU-KGD, SCA|RU-KGD
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A51S','BY','BY') ON CONFLICT (eic) DO NOTHING;              --  SCA|BY, MBA|BY, BZN|BY, CTA|BY
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A59C','IE(SEM)','IE') ON CONFLICT (eic) DO NOTHING;         --  BZN|IE(SEM), MBA|IE(SEM), SCA|IE(SEM), LFB|IE-NIE, SNA|Ireland
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A63L','DE-AT-LU','DE') ON CONFLICT (eic) DO NOTHING;        --  BZN|DE-AT-LU
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A64J','NO10A','NO') ON CONFLICT (eic) DO NOTHING;           --  BZN|NO1A
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A65H','DK','DK') ON CONFLICT (eic) DO NOTHING;              --  Denmark (DK)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A66F','IT-GR','IT') ON CONFLICT (eic) DO NOTHING;           --  BZN|IT-GR
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A67D','IT-North-SI','IT') ON CONFLICT (eic) DO NOTHING;     --  BZN|IT-North-SI
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A68B','IT-North','IT') ON CONFLICT (eic) DO NOTHING;        --  BZN|IT-North-CH
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A699','IT-Brindisi','IT') ON CONFLICT (eic) DO NOTHING;     --  BZN|IT-Brindisi, SCA|IT-Brindisi, MBA|IT-Z-Brindisi
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A70O','IT-Centre-North','IT') ON CONFLICT (eic) DO NOTHING; --  MBA|IT-Z-Centre-North, SCA|IT-Centre-North, BZN|IT-Centre-North
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A71M','IT-Centre-South','IT') ON CONFLICT (eic) DO NOTHING; --  BZN|IT-Centre-South, SCA|IT-Centre-South, MBA|IT-Z-Centre-South
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A72K','IT-Foggia','IT') ON CONFLICT (eic) DO NOTHING;       --  MBA|IT-Z-Foggia, SCA|IT-Foggia, BZN|IT-Foggia
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A73I','IT-North','IT') ON CONFLICT (eic) DO NOTHING;        --  BZN|IT-North, SCA|IT-North, MBA|IT-Z-North
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A74G','IT-Sardinia','IT') ON CONFLICT (eic) DO NOTHING;     --  MBA|IT-Z-Sardinia, SCA|IT-Sardinia, BZN|IT-Sardinia
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A75E','IT-Sicily','IT') ON CONFLICT (eic) DO NOTHING;       --  BZN|IT-Sicily, SCA|IT-Sicily, MBA|IT-Z-Sicily
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A76C','IT-Z-Priolo','IT') ON CONFLICT (eic) DO NOTHING;     --  MBA|IT-Z-Priolo, SCA|IT-Priolo, BZN|IT-Priolo
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A77A','IT-Rossano','IT') ON CONFLICT (eic) DO NOTHING;      --  BZN|IT-Rossano, SCA|IT-Rossano, MBA|IT-Z-Rossano
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A788','IT-South','IT') ON CONFLICT (eic) DO NOTHING;        --  MBA|IT-Z-South, SCA|IT-South, BZN|IT-South
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A796','DK','DK') ON CONFLICT (eic) DO NOTHING;              --  CTA|DK
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A80L','IT-North-AT','IT') ON CONFLICT (eic) DO NOTHING;     --  BZN|IT-North-AT
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A81J','IT-North-FR','IT') ON CONFLICT (eic) DO NOTHING;     --  BZN|IT-North-FR
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A82H','DE-LU','DE') ON CONFLICT (eic) DO NOTHING;           --  BZN|DE-LU, IPA|DE-LU, SCA|DE-LU, MBA|DE-LU
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A83F','DE','DE') ON CONFLICT (eic) DO NOTHING;              --  Germany (DE)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A84D','IT-MACRZONENORTH','IT') ON CONFLICT (eic) DO NOTHING;--  MBA|IT-MACRZONENORTH, SCA|IT-MACRZONENORTH
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A85B','IT-MACRZONESOUTH','IT') ON CONFLICT (eic) DO NOTHING;--  SCA|IT-MACRZONESOUTH, MBA|IT-MACRZONESOUTH
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A869','UA-DobTPP','UA') ON CONFLICT (eic) DO NOTHING;       --  SCA|UA-DobTPP, BZN|UA-DobTPP, CTA|UA-DobTPP
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A877','IT-Malta','IT') ON CONFLICT (eic) DO NOTHING;        --  BZN|IT-Malta
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A885','IT-SACOAC','IT') ON CONFLICT (eic) DO NOTHING;       --  BZN|IT-SACOAC
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A893','IT-SACODC','IT') ON CONFLICT (eic) DO NOTHING;       --  BZN|IT-SACODC, SCA|IT-SACODC
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A92E','UK','GB') ON CONFLICT (eic) DO NOTHING;              --  United Kingdom (UK)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A93C','Malta','MT') ON CONFLICT (eic) DO NOTHING;           --  Malta (MT), BZN|MT, CTA|MT, SCA|MT, MBA|MT
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A990','MD','MD') ON CONFLICT (eic) DO NOTHING;              --  MBA|MD, SCA|MD, CTA|MD, BZN|MD, Moldova (MD)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001B004','AM','AM') ON CONFLICT (eic) DO NOTHING;              --  Armenia (AM), BZN|AM, CTA|AM
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001B012','GE','GE') ON CONFLICT (eic) DO NOTHING;              --  CTA|GE, BZN|GE, Georgia (GE), SCA|GE, MBA|GE
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001B05V','AZ','AZ') ON CONFLICT (eic) DO NOTHING;              --  Azerbaijan (AZ), BZN|AZ, CTA|AZ
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00003F','UA','UA') ON CONFLICT (eic) DO NOTHING;              --  BZN|UA, Ukraine (UA), MBA|UA, SCA|UA
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--000182','UA-IPS','UA') ON CONFLICT (eic) DO NOTHING;          --  SCA|UA-IPS, MBA|UA-IPS, BZN|UA-IPS, CTA|UA-IPS
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00038X','CZ-DE-SK-LT-SE4','CZ') ON CONFLICT (eic) DO NOTHING; --  BZA|CZ-DE-SK-LT-SE4
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00095L','SWE','SE') ON CONFLICT (eic) DO NOTHING;             --  REG|SWE
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00096J','IT-Calabria','IT') ON CONFLICT (eic) DO NOTHING;     --  SCA|IT-Calabria, MBA|IT-Z-Calabria, BZN|IT-Calabria
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00098F','GB(IFA)','GB') ON CONFLICT (eic) DO NOTHING;         --  BZN|GB(IFA)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00100H','XK','XK') ON CONFLICT (eic) DO NOTHING;              --  BZN|XK, CTA|XK, Kosovo (XK), MBA|XK, LFB|XK, LFA|XK
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--001219','NO2A','NO') ON CONFLICT (eic) DO NOTHING;            --  BZN|NO2A
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00137V','ITALYNORTH','IT') ON CONFLICT (eic) DO NOTHING;      --  REG|ITALYNORTH
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00138T','GRIT','GR') ON CONFLICT (eic) DO NOTHING;            --  REG|GRIT
INSERT INTO common.area (eic, name, countrycode) VALUES('10YAL-KESH-----5','AL','AL') ON CONFLICT (eic) DO NOTHING;              --  LFB|AL, LFA|AL, BZN|AL, CTA|AL, Albania (AL), SCA|AL, MBA|AL
INSERT INTO common.area (eic, name, countrycode) VALUES('10YAT-APG------L','AT','AT') ON CONFLICT (eic) DO NOTHING;              --  MBA|AT, SCA|AT, Austria (AT), IPA|AT, CTA|AT, BZN|AT, LFA|AT, LFB|AT
INSERT INTO common.area (eic, name, countrycode) VALUES('10YBA-JPCC-----D','BA','BA') ON CONFLICT (eic) DO NOTHING;              --  LFA|BA, BZN|BA, CTA|BA, Bosnia and Herz. (BA), SCA|BA, MBA|BA
INSERT INTO common.area (eic, name, countrycode) VALUES('10YBE----------2','BE','BE') ON CONFLICT (eic) DO NOTHING;              --  MBA|BE, SCA|BE, Belgium (BE), CTA|BE, BZN|BE, LFA|BE, LFB|BE
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCA-BULGARIA-R','BG','BG') ON CONFLICT (eic) DO NOTHING;              --  LFB|BG, LFA|BG, BZN|BG, CTA|BG, Bulgaria (BG), SCA|BG, MBA|BG
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCB-GERMANY--8','DE_DK1_LU','DE') ON CONFLICT (eic) DO NOTHING;       --  SCA|DE_DK1_LU, LFB|DE_DK1_LU
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCB-JIEL-----9','RS_MK_ME','RS') ON CONFLICT (eic) DO NOTHING;        --  LFB|RS_MK_ME
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCB-POLAND---Z','PL','PL') ON CONFLICT (eic) DO NOTHING;              --  LFB|PL
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCB-SI-HR-BA-3','SI-HR_BA','SI') ON CONFLICT (eic) DO NOTHING;        --  LFB|SI_HR_BA
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCH-SWISSGRIDZ','CH','CH') ON CONFLICT (eic) DO NOTHING;              --  LFB|CH, LFA|CH, SCA|CH, MBA|CH, Switzerland (CH), CTA|CH, BZN|CH
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCS-CG-TSO---S','ME','ME') ON CONFLICT (eic) DO NOTHING;              --  BZN|ME, CTA|ME, Montenegro (ME), MBA|ME, SCA|ME, LFA|ME
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCS-SERBIATSOV','RS','RS') ON CONFLICT (eic) DO NOTHING;              --  LFA|RS, SCA|RS, MBA|RS, Serbia (RS), CTA|RS, BZN|RS
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCY-1001A0003J','CY','CY') ON CONFLICT (eic) DO NOTHING;              --  BZN|CY, CTA|CY, Cyprus (CY), MBA|CY, SCA|CY
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCZ-CEPS-----N','CZ','CZ') ON CONFLICT (eic) DO NOTHING;              --  SCA|CZ, MBA|CZ, Czech Republic (CZ), CTA|CZ, BZN|CZ, LFA|CZ, LFB|CZ
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDE-ENBW-----N','DE(TransnetBW)','DE') ON CONFLICT (eic) DO NOTHING;  --  LFA|DE(TransnetBW), CTA|DE(TransnetBW), SCA|DE(TransnetBW)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDE-EON------1','DE(TenneT)','DE') ON CONFLICT (eic) DO NOTHING;      --  SCA|DE(TenneT GER), CTA|DE(TenneT GER), LFA|DE(TenneT GER)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDE-RWENET---I','DE(Amprion)','DE') ON CONFLICT (eic) DO NOTHING;     --  LFA|DE(Amprion), CTA|DE(Amprion), SCA|DE(Amprion)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDE-VE-------2','DE(50Hertz)','DE') ON CONFLICT (eic) DO NOTHING;     --  SCA|DE(50Hertz), CTA|DE(50Hertz), LFA|DE(50Hertz), BZA|DE(50HzT)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDK-1-------AA','DK1A','DK') ON CONFLICT (eic) DO NOTHING;            --  BZN|DK1A
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDK-1--------W','DK1','DK') ON CONFLICT (eic) DO NOTHING;             --  IPA|DK1, IBA|DK1, BZN|DK1, SCA|DK1, MBA|DK1, LFA|DK1
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDK-2--------M','DK2','DK') ON CONFLICT (eic) DO NOTHING;             --  LFA|DK2, MBA|DK2, SCA|DK2, IBA|DK2, IPA|DK2, BZN|DK2
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDOM-1001A082L','PL-CZ','PL') ON CONFLICT (eic) DO NOTHING;           --  CTA|PL-CZ, BZA|PL-CZ
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDOM-CZ-DE-SKK','CZ-DE-SK','CZ') ON CONFLICT (eic) DO NOTHING;        --  BZA|CZ-DE-SK, BZN|CZ+DE+SK
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDOM-PL-SE-LT2','LT-SE4','LT') ON CONFLICT (eic) DO NOTHING;          --  BZA|LT-SE4
INSERT INTO common.area (eic, name, countrycode) VALUES('10YES-REE------0','ES','ES') ON CONFLICT (eic) DO NOTHING;              --  LFB|ES, LFA|ES, BZN|ES, Spain (ES), CTA|ES, SCA|ES, MBA|ES
INSERT INTO common.area (eic, name, countrycode) VALUES('10YFI-1--------U','FI','FI') ON CONFLICT (eic) DO NOTHING;              --  MBA|FI, SCA|FI, CTA|FI, Finland (FI), BZN|FI, IPA|FI, IBA|FI
INSERT INTO common.area (eic, name, countrycode) VALUES('10YFR-RTE------C','FR','FR') ON CONFLICT (eic) DO NOTHING;              --  BZN|FR, France (FR), CTA|FR, SCA|FR, MBA|FR, LFB|FR, LFA|FR
INSERT INTO common.area (eic, name, countrycode) VALUES('10YGB----------A','GB','GB') ON CONFLICT (eic) DO NOTHING;              --  LFA|GB, LFB|GB, SNA|GB, MBA|GB, SCA|GB, CTA|National Grid, BZN|GB
INSERT INTO common.area (eic, name, countrycode) VALUES('10YGR-HTSO-----Y','GR','GR') ON CONFLICT (eic) DO NOTHING;              --  BZN|GR, Greece (GR), CTA|GR, SCA|GR, MBA|GR, LFB|GR, LFA|GR
INSERT INTO common.area (eic, name, countrycode) VALUES('10YHR-HEP------M','HR','HR') ON CONFLICT (eic) DO NOTHING;              --  LFA|HR, MBA|HR, SCA|HR, CTA|HR, Croatia (HR), BZN|HR
INSERT INTO common.area (eic, name, countrycode) VALUES('10YHU-MAVIR----U','HU','HU') ON CONFLICT (eic) DO NOTHING;              --  BZN|HU, Hungary (HU), CTA|HU, SCA|HU, MBA|HU, LFA|HU, LFB|HU
INSERT INTO common.area (eic, name, countrycode) VALUES('10YIE-1001A00010','IE','IE') ON CONFLICT (eic) DO NOTHING;              --  MBA|SEM(EirGrid), SCA|IE, CTA|IE, Ireland (IE)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YIT-GRTN-----B','IT','IT') ON CONFLICT (eic) DO NOTHING;              --  Italy (IT), CTA|IT, SCA|IT, MBA|IT, LFB|IT, LFA|IT
INSERT INTO common.area (eic, name, countrycode) VALUES('10YLT-1001A0008Q','LT','LT') ON CONFLICT (eic) DO NOTHING;              --  MBA|LT, SCA|LT, CTA|LT, Lithuania (LT), BZN|LT
INSERT INTO common.area (eic, name, countrycode) VALUES('10YLU-CEGEDEL-NQ','LU','LU') ON CONFLICT (eic) DO NOTHING;              --  Luxembourg (LU), CTA|LU
INSERT INTO common.area (eic, name, countrycode) VALUES('10YLV-1001A00074','LV','LV') ON CONFLICT (eic) DO NOTHING;              --  CTA|LV, Latvia (LV), BZN|LV, SCA|LV, MBA|LV
INSERT INTO common.area (eic, name, countrycode) VALUES('10YMK-MEPSO----8','MK','MK') ON CONFLICT (eic) DO NOTHING;              --  MBA|MK, SCA|MK, BZN|MK, North Macedonia (MK), CTA|MK, LFA|MK
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNL----------L','NL','NL') ON CONFLICT (eic) DO NOTHING;              --  LFA|NL, LFB|NL, CTA|NL, Netherlands (NL), BZN|NL, SCA|NL, MBA|NL
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNO-0--------C','NO','NO') ON CONFLICT (eic) DO NOTHING;              --  MBA|NO, SCA|NO, Norway (NO), CTA|NO
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNO-1--------2','NO1','NO') ON CONFLICT (eic) DO NOTHING;             --  BZN|NO1, IBA|NO1, IPA|NO1, SCA|NO1, MBA|NO1
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNO-2--------T','NO2','NO') ON CONFLICT (eic) DO NOTHING;             --  MBA|NO2, SCA|NO2, IPA|NO2, IBA|NO2, BZN|NO2
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNO-3--------J','NO3','NO') ON CONFLICT (eic) DO NOTHING;             --  BZN|NO3, IBA|NO3, IPA|NO3, SCA|NO3, MBA|NO3
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNO-4--------9','NO4','NO') ON CONFLICT (eic) DO NOTHING;             --  MBA|NO4, SCA|NO4, IPA|NO4, IBA|NO4, BZN|NO4
INSERT INTO common.area (eic, name, countrycode) VALUES('10YPL-AREA-----S','PL','PL') ON CONFLICT (eic) DO NOTHING;              --  BZN|PL, Poland (PL), CTA|PL, SCA|PL, MBA|PL, BZA|PL, LFA|PL
INSERT INTO common.area (eic, name, countrycode) VALUES('10YPT-REN------W','PT','PT') ON CONFLICT (eic) DO NOTHING;              --  LFA|PT, LFB|PT, MBA|PT, SCA|PT, CTA|PT, Portugal (PT), BZN|PT
INSERT INTO common.area (eic, name, countrycode) VALUES('10YRO-TEL------P','RO','RO') ON CONFLICT (eic) DO NOTHING;              --  BZN|RO, Romania (RO), CTA|RO, SCA|RO, MBA|RO, LFB|RO, LFA|RO
INSERT INTO common.area (eic, name, countrycode) VALUES('10YSE-1--------K','SE','SE') ON CONFLICT (eic) DO NOTHING;              --  MBA|SE, SCA|SE, CTA|SE, Sweden (SE)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YSI-ELES-----O','SI','SI') ON CONFLICT (eic) DO NOTHING;              --  Slovenia (SI), BZN|SI, CTA|SI, SCA|SI, MBA|SI, LFA|SI
INSERT INTO common.area (eic, name, countrycode) VALUES('10YSK-SEPS-----K','SK','SK') ON CONFLICT (eic) DO NOTHING;              --  LFA|SK, LFB|SK, MBA|SK, SCA|SK, CTA|SK, BZN|SK, Slovakia (SK)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YTR-TEIAS----W','TR','TR') ON CONFLICT (eic) DO NOTHING;              --  Turkey (TR), BZN|TR, CTA|TR, SCA|TR, MBA|TR, LFB|TR, LFA|TR
INSERT INTO common.area (eic, name, countrycode) VALUES('10YUA-WEPS-----0','UA-BEI','UA') ON CONFLICT (eic) DO NOTHING;          --  LFA|UA-BEI, LFB|UA-BEI, MBA|UA-BEI, SCA|UA-BEI, CTA|UA-BEI, BZN|UA-BEI
INSERT INTO common.area (eic, name, countrycode) VALUES('11Y0-0000-0265-K','GB(IFA2)','GB') ON CONFLICT (eic) DO NOTHING;        --  BZN|GB(ElecLink) 17Y0000009369493 BZN|GB(IFA2)
INSERT INTO common.area (eic, name, countrycode) VALUES('46Y000000000007M','DK1-NO1','DK') ON CONFLICT (eic) DO NOTHING;         --  BZN|DK1-NO1
INSERT INTO common.area (eic, name, countrycode) VALUES('50Y0JVU59B4JWQCU','NO2NSL','NO') ON CONFLICT (eic) DO NOTHING;          --  BZN|NO2NSL


-- No idea what to do with these ¯\_(ツ)_/¯
-- these have not been inserted into the area table, should go somewhere else, if they are needed at all.
--INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A91G','Nordic',                --  SNA|Nordic, REG|Nordic, LFB|Nordic
--INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00059P','CORE',                  --  REG|CORE
--INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00090V','AFRR',                  --  REG|AFRR, SCA|AFRR
--INSERT INTO common.area (eic, name, countrycode) VALUES('10YDOM-REGION-1V','CWE',                   --  REG|CWE
--INSERT INTO common.area (eic, name, countrycode) VALUES('10YEU-CONT-SYNC0','Continental Europe',    --  SNA|Continental Europe
--INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00119X','IN',                    --  SCA|IN
--INSERT INTO common.area (eic, name, countrycode) VALUES('9999999999999999','IS','IS'                --  Iceland (IS)

COMMIT;