SET SCHEMA 'common';

START TRANSACTION;

SET standard_conforming_strings=off;
SET escape_string_warning=off;
SET CONSTRAINTS ALL DEFERRED;


CREATE TABLE common.border (
    id serial4 NOT NULL,
	"name" varchar NOT NULL,
    fromarea varchar(16) NOT NULL,
    toarea varchar(16) NOT NULL,
    validfrom date NULL,
	validthrough date NULL,
	status varchar NULL,
    capacity int2,
    voltage int4,
    datasource int4 NOT NULL,
    lastupdate TIMESTAMPTZ NOT NULL,
    UNIQUE(fromarea,toarea),
    CONSTRAINT border_pk PRIMARY KEY (id)
);

-- common.border foreign keys
ALTER TABLE common.border ADD CONSTRAINT area_from_fk FOREIGN KEY (fromarea) REFERENCES common.area(eic);
ALTER TABLE common.border ADD CONSTRAINT area_to_fk FOREIGN KEY (toarea) REFERENCES common.area(eic);
ALTER TABLE common.border ADD CONSTRAINT border_datasource_fk FOREIGN KEY(datasource) REFERENCES common.datasource(id);

COMMIT;

INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AL-GR','10YAL-KESH-----5','10YGR-HTSO-----Y',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AL-ME','10YAL-KESH-----5','10YCS-CG-TSO---S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AL-RS','10YAL-KESH-----5','10YCS-SERBIATSOV',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AL-XK','10YAL-KESH-----5','10Y1001C--00100H',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AT-CH','10YAT-APG------L','10YCH-SWISSGRIDZ',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AT-CZ','10YAT-APG------L','10YCZ-CEPS-----N',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AT-DE(Amprion)','10YAT-APG------L','10YDE-RWENET---I',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AT-DE(TenneT)','10YAT-APG------L','10YDE-EON------1',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AT-DE(TransnetBW)','10YAT-APG------L','10YDE-ENBW-----N',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AT-HU','10YAT-APG------L','10YHU-MAVIR----U',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AT-IT','10YAT-APG------L','10YIT-GRTN-----B',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('AT-SI','10YAT-APG------L','10YSI-ELES-----O',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BE-DE(Amprion)','10YBE----------2','10YDE-RWENET---I',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BE-FR','10YBE----------2','10YFR-RTE------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BE-GB','10YBE----------2','10YGB----------A',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BE-LU','10YBE----------2','10YLU-CEGEDEL-NQ',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BE-NL','10YBE----------2','10YNL----------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BA-HR','10YBA-JPCC-----D','10YHR-HEP------M',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BA-ME','10YBA-JPCC-----D','10YCS-CG-TSO---S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BA-RS','10YBA-JPCC-----D','10YCS-SERBIATSOV',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BG-GR','10YCA-BULGARIA-R','10YGR-HTSO-----Y',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BG-MK','10YCA-BULGARIA-R','10YMK-MEPSO----8',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BG-RO','10YCA-BULGARIA-R','10YRO-TEL------P',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BG-RS','10YCA-BULGARIA-R','10YCS-SERBIATSOV',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('BG-TR','10YCA-BULGARIA-R','10YTR-TEIAS----W',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HR-BA','10YHR-HEP------M','10YBA-JPCC-----D',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HR-HU','10YHR-HEP------M','10YHU-MAVIR----U',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HR-RS','10YHR-HEP------M','10YCS-SERBIATSOV',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HR-SI','10YHR-HEP------M','10YSI-ELES-----O',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('CZ-AT','10YCZ-CEPS-----N','10YAT-APG------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('CZ-DE(50Hertz)','10YCZ-CEPS-----N','10YDE-VE-------2',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('CZ-DE(TenneT)','10YCZ-CEPS-----N','10YDE-EON------1',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('CZ-PL','10YCZ-CEPS-----N','10YPL-AREA-----S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('CZ-SK','10YCZ-CEPS-----N','10YSK-SEPS-----K',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('PL-DE(50Hertz)','10YPL-AREA-----S','10YDE-VE-------2',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DK-DE(50Hertz)','10Y1001A1001A796','10YDE-VE-------2',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DK-DE(TenneT)','10Y1001A1001A796','10YDE-EON------1',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DK-GB','10Y1001A1001A796','10YGB----------A',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DK-NL','10Y1001A1001A796','10YNL----------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DK-NO','10Y1001A1001A796','10YNO-0--------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DK-SE','10Y1001A1001A796','10YSE-1--------K',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('EE-FI','10Y1001A1001A39I','10YFI-1--------U',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('EE-LV','10Y1001A1001A39I','10YLV-1001A00074',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('EE-RU','10Y1001A1001A39I','10Y1001A1001A49F',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FI-EE','10YFI-1--------U','10Y1001A1001A39I',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FI-NO','10YFI-1--------U','10YNO-0--------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FI-RU','10YFI-1--------U','10Y1001A1001A49F',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FI-SE','10YFI-1--------U','10YSE-1--------K',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FR-BE','10YFR-RTE------C','10YBE----------2',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FR-CH','10YFR-RTE------C','10YCH-SWISSGRIDZ',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FR-DE(Amprion)','10YFR-RTE------C','10YDE-RWENET---I',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FR-DE(TransnetBW)','10YFR-RTE------C','10YDE-ENBW-----N',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FR-ES','10YFR-RTE------C','10YES-REE------0',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FR-GB','10YFR-RTE------C','10YGB----------A',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('FR-IT','10YFR-RTE------C','10YIT-GRTN-----B',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GE-AM','10Y1001A1001B012','10Y1001A1001B004',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GE-AZ','10Y1001A1001B012','10Y1001A1001B05V',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GE-RU','10Y1001A1001B012','10Y1001A1001A49F',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GE-TR','10Y1001A1001B012','10YTR-TEIAS----W',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(50Hertz)-CZ','10YDE-VE-------2','10YCZ-CEPS-----N',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(50Hertz)-DK','10YDE-VE-------2','10Y1001A1001A796',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(50Hertz)-PL','10YDE-VE-------2','10YPL-AREA-----S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(Amprion)-AT','10YDE-RWENET---I','10YAT-APG------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(Amprion)-BE','10YDE-RWENET---I','10YBE----------2',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(Amprion)-CH','10YDE-RWENET---I','10YCH-SWISSGRIDZ',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(Amprion)-FR','10YDE-RWENET---I','10YFR-RTE------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(Amprion)-LU','10YDE-RWENET---I','10YLU-CEGEDEL-NQ',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(Amprion)-NL','10YDE-RWENET---I','10YNL----------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(TenneT)-AT','10YDE-EON------1','10YAT-APG------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(TenneT)-CZ','10YDE-EON------1','10YCZ-CEPS-----N',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(TenneT)-DK','10YDE-EON------1','10Y1001A1001A796',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(TenneT)-NL','10YDE-EON------1','10YNL----------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(TenneT)-NO','10YDE-EON------1','10YNO-0--------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(TenneT)-SE','10YDE-EON------1','10YSE-1--------K',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(TransnetBW)-AT','10YDE-ENBW-----N','10YAT-APG------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(TransnetBW)-CH','10YDE-ENBW-----N','10YCH-SWISSGRIDZ',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('DE(TransnetBW)-FR','10YDE-ENBW-----N','10YFR-RTE------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GR-AL','10YGR-HTSO-----Y','10YAL-KESH-----5',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GR-BG','10YGR-HTSO-----Y','10YCA-BULGARIA-R',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GR-IT','10YGR-HTSO-----Y','10YIT-GRTN-----B',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GR-MK','10YGR-HTSO-----Y','10YMK-MEPSO----8',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GR-TR','10YGR-HTSO-----Y','10YTR-TEIAS----W',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HU-AT','10YHU-MAVIR----U','10YAT-APG------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HU-HR','10YHU-MAVIR----U','10YHR-HEP------M',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HU-RO','10YHU-MAVIR----U','10YRO-TEL------P',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HU-RS','10YHU-MAVIR----U','10YCS-SERBIATSOV',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HU-SI','10YHU-MAVIR----U','10YSI-ELES-----O',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HU-SK','10YHU-MAVIR----U','10YSK-SEPS-----K',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HU-UA','10YHU-MAVIR----U','10YUA-WEPS-----0',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('HU-UA','10YHU-MAVIR----U','10Y1001C--000182',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('IE-GB','10YIE-1001A00010','10YGB----------A',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('IE-NIE','10YIE-1001A00010','10Y1001A1001A016',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('IT-AT','10YIT-GRTN-----B','10YAT-APG------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('IT-CH','10YIT-GRTN-----B','10YCH-SWISSGRIDZ',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('IT-FR','10YIT-GRTN-----B','10YFR-RTE------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('IT-GR','10YIT-GRTN-----B','10YGR-HTSO-----Y',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('IT-ME','10YIT-GRTN-----B','10YCS-CG-TSO---S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('IT-MT','10YIT-GRTN-----B','10Y1001A1001A93C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('IT-SI','10YIT-GRTN-----B','10YSI-ELES-----O',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('XK-AL','10Y1001C--00100H','10YAL-KESH-----5',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('XK-ME','10Y1001C--00100H','10YCS-CG-TSO---S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('XK-MK','10Y1001C--00100H','10YMK-MEPSO----8',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('XK-RS','10Y1001C--00100H','10YCS-SERBIATSOV',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('LV-EE','10YLV-1001A00074','10Y1001A1001A39I',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('LV-LT','10YLV-1001A00074','10YLT-1001A0008Q',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('LV-RU','10YLV-1001A00074','10Y1001A1001A49F',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('LT-BY','10YLT-1001A0008Q','10Y1001A1001A51S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('LT-LV','10YLT-1001A0008Q','10YLV-1001A00074',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('LT-PL','10YLT-1001A0008Q','10YPL-AREA-----S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('LT-RU','10YLT-1001A0008Q','10Y1001A1001A49F',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('LT-SE','10YLT-1001A0008Q','10YSE-1--------K',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('LU-BE','10YLU-CEGEDEL-NQ','10YBE----------2',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('LU-DE(Amprion)','10YLU-CEGEDEL-NQ','10YDE-RWENET---I',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('MT-IT','10Y1001A1001A93C','10YIT-GRTN-----B',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('MD-RO','10Y1001A1001A990','10YRO-TEL------P',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('MD-UA','10Y1001A1001A990','10Y1001C--000182',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('ME-AL','10YCS-CG-TSO---S','10YAL-KESH-----5',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('ME-BA','10YCS-CG-TSO---S','10YBA-JPCC-----D',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('ME-IT','10YCS-CG-TSO---S','10YIT-GRTN-----B',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('ME-RS','10YCS-CG-TSO---S','10YCS-SERBIATSOV',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('ME-XK','10YCS-CG-TSO---S','10Y1001C--00100H',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NL-BE','10YNL----------L','10YBE----------2',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NL-DE(Amprion)','10YNL----------L','10YDE-RWENET---I',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NL-DE(TenneT)','10YNL----------L','10YDE-EON------1',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NL-DK','10YNL----------L','10Y1001A1001A796',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NL-GB','10YNL----------L','10YGB----------A',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NL-NO','10YNL----------L','10YNO-0--------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('MK-BG','10YMK-MEPSO----8','10YCA-BULGARIA-R',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('MK-GR','10YMK-MEPSO----8','10YGR-HTSO-----Y',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('MK-RS','10YMK-MEPSO----8','10YCS-SERBIATSOV',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('MK-XK','10YMK-MEPSO----8','10Y1001C--00100H',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NO-DE(TenneT)','10YNO-0--------C','10YDE-EON------1',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NO-DK','10YNO-0--------C','10Y1001A1001A796',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NO-FI','10YNO-0--------C','10YFI-1--------U',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NO-GB','10YNO-0--------C','10YGB----------A',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NO-NL','10YNO-0--------C','10YNL----------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('NO-SE','10YNO-0--------C','10YSE-1--------K',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('PL-CZ','10YPL-AREA-----S','10YCZ-CEPS-----N',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('PL-LT','10YPL-AREA-----S','10YLT-1001A0008Q',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('PL-SE','10YPL-AREA-----S','10YSE-1--------K',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('PL-SK','10YPL-AREA-----S','10YSK-SEPS-----K',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('PL-UA','10YPL-AREA-----S','10Y1001A1001A869',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('PT-ES','10YPT-REN------W','10YES-REE------0',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RO-BG','10YRO-TEL------P','10YCA-BULGARIA-R',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RO-HU','10YRO-TEL------P','10YHU-MAVIR----U',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RO-MD','10YRO-TEL------P','10Y1001A1001A990',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RO-RS','10YRO-TEL------P','10YCS-SERBIATSOV',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RO-UA','10YRO-TEL------P','10YUA-WEPS-----0',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RS-AL','10YCS-SERBIATSOV','10YAL-KESH-----5',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RS-BA','10YCS-SERBIATSOV','10YBA-JPCC-----D',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RS-BG','10YCS-SERBIATSOV','10YCA-BULGARIA-R',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RS-HR','10YCS-SERBIATSOV','10YHR-HEP------M',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RS-HU','10YCS-SERBIATSOV','10YHU-MAVIR----U',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RS-ME','10YCS-SERBIATSOV','10YCS-CG-TSO---S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RS-MK','10YCS-SERBIATSOV','10YMK-MEPSO----8',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RS-RO','10YCS-SERBIATSOV','10YRO-TEL------P',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('RS-XK','10YCS-SERBIATSOV','10Y1001C--00100H',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SK-CZ','10YSK-SEPS-----K','10YCZ-CEPS-----N',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SK-HU','10YSK-SEPS-----K','10YHU-MAVIR----U',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SK-PL','10YSK-SEPS-----K','10YPL-AREA-----S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SK-UA','10YSK-SEPS-----K','10YUA-WEPS-----0',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SI-AT','10YSI-ELES-----O','10YAT-APG------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SI-HR','10YSI-ELES-----O','10YHR-HEP------M',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SI-HU','10YSI-ELES-----O','10YHU-MAVIR----U',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SI-IT','10YSI-ELES-----O','10YIT-GRTN-----B',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('ES-FR','10YES-REE------0','10YFR-RTE------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('ES-PT','10YES-REE------0','10YPT-REN------W',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SE-DE(TenneT)','10YSE-1--------K','10YDE-EON------1',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SE-DK','10YSE-1--------K','10Y1001A1001A796',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SE-FI','10YSE-1--------K','10YFI-1--------U',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SE-LT','10YSE-1--------K','10YLT-1001A0008Q',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SE-NO','10YSE-1--------K','10YNO-0--------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('SE-PL','10YSE-1--------K','10YPL-AREA-----S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('CH-AT','10YCH-SWISSGRIDZ','10YAT-APG------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('CH-DE(Amprion)','10YCH-SWISSGRIDZ','10YDE-RWENET---I',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('CH-DE(TransnetBW)','10YCH-SWISSGRIDZ','10YDE-ENBW-----N',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('CH-FR','10YCH-SWISSGRIDZ','10YFR-RTE------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('CH-IT','10YCH-SWISSGRIDZ','10YIT-GRTN-----B',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('TR-BG','10YTR-TEIAS----W','10YCA-BULGARIA-R',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('TR-GE','10YTR-TEIAS----W','10Y1001A1001B012',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('TR-GR','10YTR-TEIAS----W','10YGR-HTSO-----Y',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('UA-BY','10Y1001C--000182','10Y1001A1001A51S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('UA-HU','10Y1001C--000182','10YHU-MAVIR----U',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('UA-MD','10Y1001C--000182','10Y1001A1001A990',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('UA-PL','10Y1001C--000182','10YPL-AREA-----S',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('UA-RO','10Y1001C--000182','10YRO-TEL------P',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('UA-RU','10Y1001C--000182','10Y1001A1001A49F',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('UA-SK','10Y1001C--000182','10YSK-SEPS-----K',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GB-BE','10YGB----------A','10YBE----------2',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GB-DK','10YGB----------A','10Y1001A1001A796',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GB-FR','10YGB----------A','10YFR-RTE------C',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GB-IE','10YGB----------A','10YIE-1001A00010',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GB-NIE','10YGB----------A','10Y1001A1001A016',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GB-NL','10YGB----------A','10YNL----------L',1,'2024-05-28');
INSERT INTO common.border ("name", fromarea, toarea, datasource, lastupdate) VALUES('GB-NO','10YGB----------A','10YNO-0--------C',1,'2024-05-28');
