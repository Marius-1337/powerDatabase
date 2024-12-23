SET SCHEMA 'common';

START TRANSACTION;

UPDATE area SET CTA=TRUE, MBA=TRUE, SCA=TRUE WHERE eic = '10Y1001A1001A016'; 
UPDATE area SET SCA=TRUE, MBA=TRUE, CTA=TRUE, BZN=TRUE WHERE eic = '10Y1001A1001A39I'; 
UPDATE area SET IPA=TRUE, BZN=TRUE, MBA=TRUE, SCA=TRUE WHERE eic = '10Y1001A1001A44P'; 
UPDATE area SET SCA=TRUE, MBA=TRUE, BZN=TRUE, IPA=TRUE WHERE eic = '10Y1001A1001A45N'; 
UPDATE area SET IPA=TRUE, BZN=TRUE, MBA=TRUE, SCA=TRUE WHERE eic = '10Y1001A1001A46L'; 
UPDATE area SET SCA=TRUE, MBA=TRUE, BZN=TRUE, IPA=TRUE WHERE eic = '10Y1001A1001A47J'; 
UPDATE area SET IPA=TRUE, IBA=TRUE, BZN=TRUE, MBA=TRUE, SCA=TRUE WHERE eic = '10Y1001A1001A48H'; 
UPDATE area SET SCA=TRUE, MBA=TRUE, BZN=TRUE, CTA=TRUE WHERE eic = '10Y1001A1001A49F'; 
UPDATE area SET CTA=TRUE, BZN=TRUE, MBA=TRUE, SCA=TRUE WHERE eic = '10Y1001A1001A50U'; 
UPDATE area SET SCA=TRUE, MBA=TRUE, BZN=TRUE, CTA=TRUE WHERE eic = '10Y1001A1001A51S'; 
UPDATE area SET BZN=TRUE, MBA=TRUE, SCA=TRUE, LFB=TRUE, SNA=TRUE WHERE eic = '10Y1001A1001A59C'; 
UPDATE area SET BZN=TRUE WHERE eic = '10Y1001A1001A63L'; 
UPDATE area SET BZN=TRUE WHERE eic = '10Y1001A1001A64J'; 
UPDATE area SET BZN=TRUE WHERE eic = '10Y1001A1001A66F'; 
UPDATE area SET BZN=TRUE WHERE eic = '10Y1001A1001A67D'; 
UPDATE area SET BZN=TRUE WHERE eic = '10Y1001A1001A68B'; 
UPDATE area SET BZN=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10Y1001A1001A699'; 
UPDATE area SET MBA=TRUE, SCA=TRUE, BZN=TRUE WHERE eic = '10Y1001A1001A70O'; 
UPDATE area SET BZN=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10Y1001A1001A71M'; 
UPDATE area SET MBA=TRUE, SCA=TRUE, BZN=TRUE WHERE eic = '10Y1001A1001A72K'; 
UPDATE area SET BZN=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10Y1001A1001A73I'; 
UPDATE area SET MBA=TRUE, SCA=TRUE, BZN=TRUE WHERE eic = '10Y1001A1001A74G'; 
UPDATE area SET BZN=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10Y1001A1001A75E'; 
UPDATE area SET MBA=TRUE, SCA=TRUE, BZN=TRUE WHERE eic = '10Y1001A1001A76C'; 
UPDATE area SET BZN=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10Y1001A1001A77A'; 
UPDATE area SET MBA=TRUE, BZN=TRUE WHERE eic = '10Y1001A1001A788'; 
UPDATE area SET CTA=TRUE WHERE eic = '10Y1001A1001A796';
UPDATE area SET BZN=TRUE WHERE eic = '10Y1001A1001A80L'; 
UPDATE area SET BZN=TRUE WHERE eic = '10Y1001A1001A81J'; 
UPDATE area SET BZN=TRUE, IPA=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10Y1001A1001A82H'; 
UPDATE area SET MBA=TRUE, SCA=TRUE WHERE eic = '10Y1001A1001A84D'; 
UPDATE area SET SCA=TRUE, MBA=TRUE WHERE eic = '10Y1001A1001A85B'; 
UPDATE area SET SCA=TRUE, BZN=TRUE, CTA=TRUE WHERE eic = '10Y1001A1001A869'; 
UPDATE area SET BZN=TRUE, SCA=TRUE WHERE eic = '10Y1001A1001A893'; 
UPDATE area SET BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10Y1001A1001A93C'; 
UPDATE area SET MBA=TRUE, SCA=TRUE, CTA=TRUE, BZN=TRUE WHERE eic = '10Y1001A1001A990'; 
UPDATE area SET BZN=TRUE, CTA=TRUE WHERE eic = '10Y1001A1001B004'; 
UPDATE area SET CTA=TRUE, BZN=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10Y1001A1001B012'; 
UPDATE area SET BZN=TRUE, CTA=TRUE WHERE eic = '10Y1001A1001B05V'; 
UPDATE area SET BZN=TRUE, MBA=TRUE, SCA=TRUE WHERE eic = '10Y1001C--00003F'; 
UPDATE area SET SCA=TRUE, MBA=TRUE, BZN=TRUE, CTA=TRUE WHERE eic = '10Y1001C--000182'; 
UPDATE area SET BZA=TRUE WHERE eic = '10Y1001C--00038X';
UPDATE area SET SCA=TRUE, MBA=TRUE, BZN=TRUE WHERE eic = '10Y1001C--00096J'; 
UPDATE area SET BZN=TRUE WHERE eic = '10Y1001C--00098F'; 
UPDATE area SET BZN=TRUE, CTA=TRUE, MBA=TRUE, LFB=TRUE, LFA=TRUE WHERE eic = '10Y1001C--00100H'; 
UPDATE area SET BZN=TRUE WHERE eic = '10Y1001C--001219'; 
UPDATE area SET REG=TRUE WHERE eic = '10Y1001C--00137V'; 
UPDATE area SET REG=TRUE WHERE eic = '10Y1001C--00138T'; 
UPDATE area SET LFB=TRUE, LFA=TRUE, BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10YAL-KESH-----5'; 
UPDATE area SET MBA=TRUE, SCA=TRUE, IPA=TRUE, CTA=TRUE, BZN=TRUE, LFA=TRUE, LFB=TRUE WHERE eic = '10YAT-APG------L'; 
UPDATE area SET LFA=TRUE, BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10YBA-JPCC-----D'; 
UPDATE area SET MBA=TRUE, SCA=TRUE, CTA=TRUE, BZN=TRUE, LFA=TRUE, LFB=TRUE WHERE eic = '10YBE----------2'; 
UPDATE area SET LFB=TRUE, LFA=TRUE, BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10YCA-BULGARIA-R';
UPDATE area SET SCA=TRUE, LFB=TRUE WHERE eic = '10YCB-GERMANY--8';
UPDATE area SET LFB=TRUE WHERE eic = '10YCB-JIEL-----9'; 
UPDATE area SET LFB=TRUE WHERE eic = '10YCB-POLAND---Z'; 
UPDATE area SET LFB=TRUE WHERE eic = '10YCB-SI-HR-BA-3'; 
UPDATE area SET LFB=TRUE, LFA=TRUE, SCA=TRUE, MBA=TRUE, CTA=TRUE, BZN=TRUE WHERE eic = '10YCH-SWISSGRIDZ';
UPDATE area SET BZN=TRUE, CTA=TRUE, MBA=TRUE, SCA=TRUE, LFA=TRUE WHERE eic = '10YCS-CG-TSO---S'; 
UPDATE area SET LFA=TRUE, SCA=TRUE, MBA=TRUE, CTA=TRUE, BZN=TRUE WHERE eic = '10YCS-SERBIATSOV'; 
UPDATE area SET BZN=TRUE, CTA=TRUE, MBA=TRUE, SCA=TRUE WHERE eic = '10YCY-1001A0003J'; 
UPDATE area SET SCA=TRUE, MBA=TRUE, CTA=TRUE, BZN=TRUE, LFA=TRUE, LFB=TRUE WHERE eic = '10YCZ-CEPS-----N';
UPDATE area SET LFA=TRUE, CTA=TRUE, SCA=TRUE WHERE eic = '10YDE-ENBW-----N'; 
UPDATE area SET SCA=TRUE, CTA=TRUE, LFA=TRUE WHERE eic = '10YDE-EON------1'; 
UPDATE area SET LFA=TRUE, CTA=TRUE, SCA=TRUE WHERE eic = '10YDE-RWENET---I'; 
UPDATE area SET SCA=TRUE, CTA=TRUE, LFA=true WHERE eic = '10YDE-VE-------2'; 
UPDATE area SET BZN=TRUE WHERE eic = '10YDK-1-------AA'; 
UPDATE area SET IPA=TRUE, IBA=TRUE, BZN=TRUE, SCA=TRUE, MBA=TRUE, LFA=TRUE WHERE eic = '10YDK-1--------W';
UPDATE area SET LFA=TRUE, MBA=TRUE, SCA=TRUE, IBA=TRUE, IPA=TRUE, BZN=TRUE WHERE eic = '10YDK-2--------M';
UPDATE area SET CTA=TRUE, BZA=TRUE WHERE eic = '10YDOM-1001A082L'; 
UPDATE area SET BZA=TRUE, BZN=TRUE WHERE eic = '10YDOM-CZ-DE-SKK'; 
UPDATE area SET BZA=TRUE WHERE eic = '10YDOM-PL-SE-LT2'; 
UPDATE area SET LFB=TRUE, LFA=TRUE, BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10YES-REE------0';
UPDATE area SET MBA=TRUE, SCA=TRUE, CTA=TRUE, BZN=TRUE, IPA=TRUE, IBA=TRUE WHERE eic = '10YFI-1--------U';
UPDATE area SET BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE, LFB=TRUE, LFA=TRUE WHERE eic = '10YFR-RTE------C';
UPDATE area SET LFA=TRUE, LFB=TRUE, SNA=TRUE, MBA=TRUE, SCA=TRUE, CTA=TRUE, BZN=TRUE WHERE eic = '10YGB----------A';
UPDATE area SET BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE, LFB=TRUE, LFA=TRUE WHERE eic = '10YGR-HTSO-----Y';
UPDATE area SET LFA=TRUE, MBA=TRUE, SCA=TRUE, CTA=TRUE, BZN=TRUE WHERE eic = '10YHR-HEP------M'; 
UPDATE area SET BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE, LFA=TRUE, LFB=TRUE WHERE eic = '10YHU-MAVIR----U'; 
UPDATE area SET MBA=TRUE, SCA=TRUE, CTA=TRUE WHERE eic = '10YIE-1001A00010'; 
UPDATE area SET CTA=TRUE, SCA=TRUE, MBA=TRUE, LFB=TRUE, LFA=TRUE WHERE eic = '10YIT-GRTN-----B';
UPDATE area SET MBA=TRUE, SCA=TRUE, CTA=TRUE, BZN=TRUE WHERE eic = '10YLT-1001A0008Q'; 
UPDATE area SET CTA=TRUE WHERE eic = '10YLU-CEGEDEL-NQ';
UPDATE area SET CTA=TRUE, BZN=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10YLV-1001A00074';
UPDATE area SET MBA=TRUE, SCA=TRUE, BZN=TRUE, CTA=TRUE, LFA=TRUE WHERE eic = '10YMK-MEPSO----8';
UPDATE area SET LFA=TRUE, LFB=TRUE, CTA=TRUE, BZN=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10YNL----------L';
UPDATE area SET MBA=TRUE, SCA=TRUE, CTA=TRUE WHERE eic = '10YNO-0--------C'; 
UPDATE area SET BZN=TRUE, IBA=TRUE, IPA=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10YNO-1--------2'; 
UPDATE area SET MBA=TRUE, SCA=TRUE, IPA=TRUE, IBA=TRUE, BZN=TRUE WHERE eic = '10YNO-2--------T'; 
UPDATE area SET BZN=TRUE, IBA=TRUE, IPA=TRUE, SCA=TRUE, MBA=TRUE WHERE eic = '10YNO-3--------J'; 
UPDATE area SET MBA=TRUE, SCA=TRUE, IPA=TRUE, IBA=TRUE, BZN=TRUE WHERE eic = '10YNO-4--------9'; 
UPDATE area SET BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE, BZA=TRUE, LFA=TRUE WHERE eic = '10YPL-AREA-----S'; 
UPDATE area SET LFA=TRUE, LFB=TRUE, MBA=TRUE, SCA=TRUE, CTA=TRUE, BZN=TRUE WHERE eic = '10YPT-REN------W'; 
UPDATE area SET BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE, LFB=TRUE, LFA=TRUE WHERE eic = '10YRO-TEL------P';
UPDATE area SET MBA=TRUE, SCA=TRUE, CTA=TRUE WHERE eic = '10YSE-1--------K';
UPDATE area SET BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE, LFA=TRUE WHERE eic = '10YSI-ELES-----O';
UPDATE area SET LFA=TRUE, LFB=TRUE, MBA=TRUE, SCA=TRUE, CTA=TRUE, BZN=TRUE WHERE eic = '10YSK-SEPS-----K'; 
UPDATE area SET BZN=TRUE, CTA=TRUE, SCA=TRUE, MBA=TRUE, LFB=TRUE, LFA=TRUE WHERE eic = '10YTR-TEIAS----W'; 
UPDATE area SET LFA=TRUE, LFB=TRUE, MBA=TRUE, SCA=TRUE, CTA=TRUE, BZN=TRUE WHERE eic = '10YUA-WEPS-----0'; 
UPDATE area SET BZN=TRUE WHERE eic = '11Y0-0000-0265-K';
UPDATE area SET BZN=TRUE WHERE eic = '46Y000000000007M';
UPDATE area SET BZN=TRUE WHERE eic = '50Y0JVU59B4JWQCU';
COMMIT;