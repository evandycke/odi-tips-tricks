-- Analyse les KM utilisés dans les interfaces

SELECT P.POP_NAME,
         LKM.TRT_NAME LKM,
         IKM.TRT_NAME IKM,
         CKM.TRT_NAME CKM
FROM SNP_SRC_SET SRC
INNER JOIN SNP_DATA_SET D
    ON D.I_DATA_SET = SRC.I_DATA_SET
INNER JOIN SNP_POP P
    ON P.I_POP = D.I_POP
INNER JOIN SNP_TRT LKM
    ON LKM.I_TRT = SRC.I_TRT_KLM
INNER JOIN SNP_TRT IKM
    ON IKM.I_TRT = P.I_TRT_KIM
INNER JOIN SNP_TRT CKM
    ON CKM.I_TRT = P.I_TRT_KCM
WHERE 1=1
        AND P.POP_NAME LIKE '%SDE%' --and LKM.TRT_NAME LIKE '%' --and IKM.TRT_NAME LIKE '%' --and CKM.TRT_NAME LIKE '%'
ORDER BY  P.POP_NAME;