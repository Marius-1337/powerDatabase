-- Table: common.area
SET SCHEMA 'common';

START TRANSACTION;

SET standard_conforming_strings=off;
SET escape_string_warning=off;
SET CONSTRAINTS ALL DEFERRED;

CREATE TABLE "area" (
    id serial4 NOT NULL,
    eic varchar(16) NOT NULL,
    name varchar NOT NULL,
    countrycode char(2) NOT NULL,
    BZN boolean NULL,
    BZA boolean NULL,
    CTA boolean NULL,
    MBA boolean NULL,
    IBA boolean NULL,
    IPA boolean NULL,
    LFA boolean NULL,
    LFB boolean NULL,
    REG boolean NULL,
    SCA boolean NULL,
    SNA boolean NULL,
  	CONSTRAINT area_pk PRIMARY KEY (id)
);

COMMENT on column area.BZN is 'BZN — Bidding Zone';
COMMENT on column area.BZA is 'BZA — Bidding Zone Aggregation';
COMMENT on column area.CTA is 'CTA — Control Area';
COMMENT on column area.MBA is 'MBA — Market Balance Area';
COMMENT on column area.IBA is 'IBA — Imbalance Area';
COMMENT on column area.IPA is 'IPA — Imbalance Price Area';
COMMENT on column area.LFA is 'LFA — Load Frequency Control Area';
COMMENT on column area.LFB is 'LFB — Load Frequency Control Block';
COMMENT on column area.REG is 'REG — Region';
COMMENT on column area.SCA is 'SCA — Scheduling Area';
COMMENT on column area.SNA is 'SNA — Synchronous Area';

ALTER TABLE "area" ADD CONSTRAINT "area_ibfk_1" FOREIGN KEY ("countrycode") REFERENCES "country" ("code") ON UPDATE CASCADE DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX ON "country" ("continent");
CREATE UNIQUE INDEX eic_unique_index ON area (eic);

COMMIT;

-- STILL NEED TO TICK the bools after creating areas, done in area-setattributes
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A016','NIE','IE');             --  CTA|NIE, MBA|SEM(SONI), SCA|NIE
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A39I','EE','EE');              --  SCA|EE, MBA|EE, CTA|EE, BZN|EE, Estonia (EE)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A44P','SE1','SE');             --  IPA|SE1, BZN|SE1, MBA|SE1, SCA|SE1
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A45N','SE2','SE');             --  SCA|SE2, MBA|SE2, BZN|SE2, IPA|SE2
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A46L','SE3','SE');             --  IPA|SE3, BZN|SE3, MBA|SE3, SCA|SE3
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A47J','SE4','SE');             --  SCA|SE4, MBA|SE4, BZN|SE4, IPA|SE4
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A48H','NO','NO');              --  IPA|NO5, IBA|NO5, BZN|NO5, MBA|NO5, SCA|NO5
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A49F','RU','RU');              --  SCA|RU, MBA|RU, BZN|RU, CTA|RU
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A50U','RU-KGD','RU');          --  CTA|RU-KGD, BZN|RU-KGD, MBA|RU-KGD, SCA|RU-KGD
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A51S','BY','BY');              --  SCA|BY, MBA|BY, BZN|BY, CTA|BY
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A59C','IE(SEM)','IE');         --  BZN|IE(SEM), MBA|IE(SEM), SCA|IE(SEM), LFB|IE-NIE, SNA|Ireland
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A63L','DE-AT-LU','DE');        --  BZN|DE-AT-LU
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A64J','NO10A','NO');           --  BZN|NO1A
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A65H','DK','DK');              --  Denmark (DK)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A66F','IT-GR','IT');           --  BZN|IT-GR
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A67D','IT-North-SI','IT');     --  BZN|IT-North-SI
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A68B','IT-North','IT');        --  BZN|IT-North-CH
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A699','IT-Brindisi','IT');     --  BZN|IT-Brindisi, SCA|IT-Brindisi, MBA|IT-Z-Brindisi
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A70O','IT-Centre-North','IT'); --  MBA|IT-Z-Centre-North, SCA|IT-Centre-North, BZN|IT-Centre-North
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A71M','IT-Centre-South','IT'); --  BZN|IT-Centre-South, SCA|IT-Centre-South, MBA|IT-Z-Centre-South
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A72K','IT-Foggia','IT');       --  MBA|IT-Z-Foggia, SCA|IT-Foggia, BZN|IT-Foggia
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A73I','IT-North','IT');        --  BZN|IT-North, SCA|IT-North, MBA|IT-Z-North
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A74G','IT-Sardinia','IT');     --  MBA|IT-Z-Sardinia, SCA|IT-Sardinia, BZN|IT-Sardinia
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A75E','IT-Sicily','IT');       --  BZN|IT-Sicily, SCA|IT-Sicily, MBA|IT-Z-Sicily
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A76C','IT-Z-Priolo','IT');     --  MBA|IT-Z-Priolo, SCA|IT-Priolo, BZN|IT-Priolo
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A77A','IT-Rossano','IT');      --  BZN|IT-Rossano, SCA|IT-Rossano, MBA|IT-Z-Rossano
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A788','IT-South','IT');        --  MBA|IT-Z-South, SCA|IT-South, BZN|IT-South
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A796','DK','DK');              --  CTA|DK
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A80L','IT-North-AT','IT');     --  BZN|IT-North-AT
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A81J','IT-North-FR','IT');     --  BZN|IT-North-FR
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A82H','DE-LU','DE');           --  BZN|DE-LU, IPA|DE-LU, SCA|DE-LU, MBA|DE-LU
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A83F','DE','DE');              --  Germany (DE)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A84D','IT-MACRZONENORTH','IT');--  MBA|IT-MACRZONENORTH, SCA|IT-MACRZONENORTH
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A85B','IT-MACRZONESOUTH','IT');--  SCA|IT-MACRZONESOUTH, MBA|IT-MACRZONESOUTH
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A869','UA-DobTPP','UA');       --  SCA|UA-DobTPP, BZN|UA-DobTPP, CTA|UA-DobTPP
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A877','IT-Malta','IT');        --  BZN|IT-Malta
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A885','IT-SACOAC','IT');       --  BZN|IT-SACOAC
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A893','IT-SACODC','IT');       --  BZN|IT-SACODC, SCA|IT-SACODC
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A92E','UK','GB');              --  United Kingdom (UK)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A93C','Malta','MT');           --  Malta (MT), BZN|MT, CTA|MT, SCA|MT, MBA|MT
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A990','MD','MD');              --  MBA|MD, SCA|MD, CTA|MD, BZN|MD, Moldova (MD)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001B004','AM','AM');              --  Armenia (AM), BZN|AM, CTA|AM
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001B012','GE','GE');              --  CTA|GE, BZN|GE, Georgia (GE), SCA|GE, MBA|GE
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001B05V','AZ','AZ');              --  Azerbaijan (AZ), BZN|AZ, CTA|AZ
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00003F','UA','UA');              --  BZN|UA, Ukraine (UA), MBA|UA, SCA|UA
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--000182','UA-IPS','UA');          --  SCA|UA-IPS, MBA|UA-IPS, BZN|UA-IPS, CTA|UA-IPS
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00038X','CZ-DE-SK-LT-SE4','CZ'); --  BZA|CZ-DE-SK-LT-SE4
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00095L','SWE','SE');             --  REG|SWE
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00096J','IT-Calabria','IT');     --  SCA|IT-Calabria, MBA|IT-Z-Calabria, BZN|IT-Calabria
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00098F','GB(IFA)','GB');         --  BZN|GB(IFA)
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00100H','XK','XK');              --  BZN|XK, CTA|XK, Kosovo (XK), MBA|XK, LFB|XK, LFA|XK
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--001219','NO2A','NO');            --  BZN|NO2A
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00137V','ITALYNORTH','IT');      --  REG|ITALYNORTH
INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00138T','GRIT','GR');            --  REG|GRIT
INSERT INTO common.area (eic, name, countrycode) VALUES('10YAL-KESH-----5','AL','AL');              --  LFB|AL, LFA|AL, BZN|AL, CTA|AL, Albania (AL), SCA|AL, MBA|AL
INSERT INTO common.area (eic, name, countrycode) VALUES('10YAT-APG------L','AT','AT');              --  MBA|AT, SCA|AT, Austria (AT), IPA|AT, CTA|AT, BZN|AT, LFA|AT, LFB|AT
INSERT INTO common.area (eic, name, countrycode) VALUES('10YBA-JPCC-----D','BA','BA');              --  LFA|BA, BZN|BA, CTA|BA, Bosnia and Herz. (BA), SCA|BA, MBA|BA
INSERT INTO common.area (eic, name, countrycode) VALUES('10YBE----------2','BE','BE');              --  MBA|BE, SCA|BE, Belgium (BE), CTA|BE, BZN|BE, LFA|BE, LFB|BE
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCA-BULGARIA-R','BG','BG');              --  LFB|BG, LFA|BG, BZN|BG, CTA|BG, Bulgaria (BG), SCA|BG, MBA|BG
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCB-GERMANY--8','DE_DK1_LU','DE');       --  SCA|DE_DK1_LU, LFB|DE_DK1_LU
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCB-JIEL-----9','RS_MK_ME','RS');        --  LFB|RS_MK_ME
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCB-POLAND---Z','PL','PL');              --  LFB|PL
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCB-SI-HR-BA-3','SI-HR_BA','SI');        --  LFB|SI_HR_BA
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCH-SWISSGRIDZ','CH','CH');              --  LFB|CH, LFA|CH, SCA|CH, MBA|CH, Switzerland (CH), CTA|CH, BZN|CH
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCS-CG-TSO---S','ME','ME');              --  BZN|ME, CTA|ME, Montenegro (ME), MBA|ME, SCA|ME, LFA|ME
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCS-SERBIATSOV','RS','RS');              --  LFA|RS, SCA|RS, MBA|RS, Serbia (RS), CTA|RS, BZN|RS
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCY-1001A0003J','CY','CY');              --  BZN|CY, CTA|CY, Cyprus (CY), MBA|CY, SCA|CY
INSERT INTO common.area (eic, name, countrycode) VALUES('10YCZ-CEPS-----N','CZ','CZ');              --  SCA|CZ, MBA|CZ, Czech Republic (CZ), CTA|CZ, BZN|CZ, LFA|CZ, LFB|CZ
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDE-ENBW-----N','DE(TransnetBW)','DE');  --  LFA|DE(TransnetBW), CTA|DE(TransnetBW), SCA|DE(TransnetBW)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDE-EON------1','DE(TenneT)','DE');      --  SCA|DE(TenneT GER), CTA|DE(TenneT GER), LFA|DE(TenneT GER)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDE-RWENET---I','DE(Amprion)','DE');     --  LFA|DE(Amprion), CTA|DE(Amprion), SCA|DE(Amprion)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDE-VE-------2','DE(50Hertz)','DE');     --  SCA|DE(50Hertz), CTA|DE(50Hertz), LFA|DE(50Hertz), BZA|DE(50HzT)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDK-1-------AA','DK1A','DK');            --  BZN|DK1A
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDK-1--------W','DK1','DK');             --  IPA|DK1, IBA|DK1, BZN|DK1, SCA|DK1, MBA|DK1, LFA|DK1
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDK-2--------M','DK2','DK');             --  LFA|DK2, MBA|DK2, SCA|DK2, IBA|DK2, IPA|DK2, BZN|DK2
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDOM-1001A082L','PL-CZ','PL');           --  CTA|PL-CZ, BZA|PL-CZ
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDOM-CZ-DE-SKK','CZ-DE-SK','CZ');        --  BZA|CZ-DE-SK, BZN|CZ+DE+SK
INSERT INTO common.area (eic, name, countrycode) VALUES('10YDOM-PL-SE-LT2','LT-SE4','LT');          --  BZA|LT-SE4
INSERT INTO common.area (eic, name, countrycode) VALUES('10YES-REE------0','ES','ES');              --  LFB|ES, LFA|ES, BZN|ES, Spain (ES), CTA|ES, SCA|ES, MBA|ES
INSERT INTO common.area (eic, name, countrycode) VALUES('10YFI-1--------U','FI','FI');              --  MBA|FI, SCA|FI, CTA|FI, Finland (FI), BZN|FI, IPA|FI, IBA|FI
INSERT INTO common.area (eic, name, countrycode) VALUES('10YFR-RTE------C','FR','FR');              --  BZN|FR, France (FR), CTA|FR, SCA|FR, MBA|FR, LFB|FR, LFA|FR
INSERT INTO common.area (eic, name, countrycode) VALUES('10YGB----------A','GB','GB');              --  LFA|GB, LFB|GB, SNA|GB, MBA|GB, SCA|GB, CTA|National Grid, BZN|GB
INSERT INTO common.area (eic, name, countrycode) VALUES('10YGR-HTSO-----Y','GR','GR');              --  BZN|GR, Greece (GR), CTA|GR, SCA|GR, MBA|GR, LFB|GR, LFA|GR
INSERT INTO common.area (eic, name, countrycode) VALUES('10YHR-HEP------M','HR','HR');              --  LFA|HR, MBA|HR, SCA|HR, CTA|HR, Croatia (HR), BZN|HR
INSERT INTO common.area (eic, name, countrycode) VALUES('10YHU-MAVIR----U','HU','HU');              --  BZN|HU, Hungary (HU), CTA|HU, SCA|HU, MBA|HU, LFA|HU, LFB|HU
INSERT INTO common.area (eic, name, countrycode) VALUES('10YIE-1001A00010','IE','IE');              --  MBA|SEM(EirGrid), SCA|IE, CTA|IE, Ireland (IE)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YIT-GRTN-----B','IT','IT');              --  Italy (IT), CTA|IT, SCA|IT, MBA|IT, LFB|IT, LFA|IT
INSERT INTO common.area (eic, name, countrycode) VALUES('10YLT-1001A0008Q','LT','LT');              --  MBA|LT, SCA|LT, CTA|LT, Lithuania (LT), BZN|LT
INSERT INTO common.area (eic, name, countrycode) VALUES('10YLU-CEGEDEL-NQ','LU','LU');              --  Luxembourg (LU), CTA|LU
INSERT INTO common.area (eic, name, countrycode) VALUES('10YLV-1001A00074','LV','LV');              --  CTA|LV, Latvia (LV), BZN|LV, SCA|LV, MBA|LV
INSERT INTO common.area (eic, name, countrycode) VALUES('10YMK-MEPSO----8','MK','MK');              --  MBA|MK, SCA|MK, BZN|MK, North Macedonia (MK), CTA|MK, LFA|MK
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNL----------L','NL','NL');              --  LFA|NL, LFB|NL, CTA|NL, Netherlands (NL), BZN|NL, SCA|NL, MBA|NL
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNO-0--------C','NO','NO');              --  MBA|NO, SCA|NO, Norway (NO), CTA|NO
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNO-1--------2','NO1','NO');             --  BZN|NO1, IBA|NO1, IPA|NO1, SCA|NO1, MBA|NO1
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNO-2--------T','NO2','NO');             --  MBA|NO2, SCA|NO2, IPA|NO2, IBA|NO2, BZN|NO2
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNO-3--------J','NO3','NO');             --  BZN|NO3, IBA|NO3, IPA|NO3, SCA|NO3, MBA|NO3
INSERT INTO common.area (eic, name, countrycode) VALUES('10YNO-4--------9','NO4','NO');             --  MBA|NO4, SCA|NO4, IPA|NO4, IBA|NO4, BZN|NO4
INSERT INTO common.area (eic, name, countrycode) VALUES('10YPL-AREA-----S','PL','PL');              --  BZN|PL, Poland (PL), CTA|PL, SCA|PL, MBA|PL, BZA|PL, LFA|PL
INSERT INTO common.area (eic, name, countrycode) VALUES('10YPT-REN------W','PT','PT');              --  LFA|PT, LFB|PT, MBA|PT, SCA|PT, CTA|PT, Portugal (PT), BZN|PT
INSERT INTO common.area (eic, name, countrycode) VALUES('10YRO-TEL------P','RO','RO');              --  BZN|RO, Romania (RO), CTA|RO, SCA|RO, MBA|RO, LFB|RO, LFA|RO
INSERT INTO common.area (eic, name, countrycode) VALUES('10YSE-1--------K','SE','SE');              --  MBA|SE, SCA|SE, CTA|SE, Sweden (SE)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YSI-ELES-----O','SI','SI');              --  Slovenia (SI), BZN|SI, CTA|SI, SCA|SI, MBA|SI, LFA|SI
INSERT INTO common.area (eic, name, countrycode) VALUES('10YSK-SEPS-----K','SK','SK');              --  LFA|SK, LFB|SK, MBA|SK, SCA|SK, CTA|SK, BZN|SK, Slovakia (SK)
INSERT INTO common.area (eic, name, countrycode) VALUES('10YTR-TEIAS----W','TR','TR');              --  Turkey (TR), BZN|TR, CTA|TR, SCA|TR, MBA|TR, LFB|TR, LFA|TR
INSERT INTO common.area (eic, name, countrycode) VALUES('10YUA-WEPS-----0','UA-BEI','UA');          --  LFA|UA-BEI, LFB|UA-BEI, MBA|UA-BEI, SCA|UA-BEI, CTA|UA-BEI, BZN|UA-BEI
INSERT INTO common.area (eic, name, countrycode) VALUES('11Y0-0000-0265-K','GB(IFA2)','GB');        --  BZN|GB(ElecLink) 17Y0000009369493 BZN|GB(IFA2)
INSERT INTO common.area (eic, name, countrycode) VALUES('46Y000000000007M','DK1-NO1','DK');         --  BZN|DK1-NO1
INSERT INTO common.area (eic, name, countrycode) VALUES('50Y0JVU59B4JWQCU','NO2NSL','NO');          --  BZN|NO2NSL


-- No idea what to do with these ¯\_(ツ)_/¯
-- these have not been inserted into the area table, should go somewhere else, if they are needed at all.
--INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001A1001A91G','Nordic',                --  SNA|Nordic, REG|Nordic, LFB|Nordic
--INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00059P','CORE',                  --  REG|CORE
--INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00090V','AFRR',                  --  REG|AFRR, SCA|AFRR
--INSERT INTO common.area (eic, name, countrycode) VALUES('10YDOM-REGION-1V','CWE',                   --  REG|CWE
--INSERT INTO common.area (eic, name, countrycode) VALUES('10YEU-CONT-SYNC0','Continental Europe',    --  SNA|Continental Europe
--INSERT INTO common.area (eic, name, countrycode) VALUES('10Y1001C--00119X','IN',                    --  SCA|IN
--INSERT INTO common.area (eic, name, countrycode) VALUES('9999999999999999','IS','IS'                --  Iceland (IS)
