DROP TABLE prescriptions;
DROP TABLE patients;
DROP TABLE drugs;
DROP SEQUENCE drugs_seq;
DROP SEQUENCE prescriptions_seq;


CREATE TABLE patients(
    patient_id VARCHAR2(20) PRIMARY KEY,
    patient_name VARCHAR2(20) NOT NULL,
    patient_address VARCHAR2(200) NOT NULL,
    patient_phone VARCHAR2(20) NOT NULL
);

CREATE TABLE drugs(
    drug_number NUMBER(10) PRIMARY KEY,
    drug_name VARCHAR2(40) UNIQUE NOT NULL,
    drug_price NUMBER(10) DEFAULT 5000 NOT NULL,
    ingredient VARCHAR2(50) NOT NULL,
    company_name VARCHAR2(40) NOT NULL
);

CREATE SEQUENCE drugs_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;
CREATE TABLE prescriptions(
    prescription_no NUMBER(6) PRIMARY KEY,
    patient_id VARCHAR2(20) REFERENCES patients(patient_id),
    doctor_name VARCHAR2(20) NOT NULL,
    drug_number NUMBER(10) REFERENCES drugs(drug_number) NOT NULL,
    days_medication NUMBER(3) NOT NULL,
    prescription_date DATE DEFAULT sysdate NOT NULL
);

CREATE SEQUENCE prescriptions_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100000
    NOCYCLE
    NOCACHE;

-- 더미데이터
Insert into HR.PATIENTS (PATIENT_ID,PATIENT_NAME,PATIENT_ADDRESS,PATIENT_PHONE) values ('123456-1234567','홍길동','서울시 마포구','101-1234-1234');
Insert into HR.PATIENTS (PATIENT_ID,PATIENT_NAME,PATIENT_ADDRESS,PATIENT_PHONE) values ('980123-1234567','김철수','서울시 마포구','010-1111-2222');
Insert into HR.PATIENTS (PATIENT_ID,PATIENT_NAME,PATIENT_ADDRESS,PATIENT_PHONE) values ('941215-2234321','박영희','서울시 종로구','010-8282-8888');
Insert into HR.PATIENTS (PATIENT_ID,PATIENT_NAME,PATIENT_ADDRESS,PATIENT_PHONE) values ('910623-1284351','김철수','인천시 부평구','010-2580-2580');
Insert into HR.PATIENTS (PATIENT_ID,PATIENT_NAME,PATIENT_ADDRESS,PATIENT_PHONE) values ('881226-1231252','이춘섭','인천시 미추홀구','010-8431-8941');
REM INSERTING into HR.DRUGS
SET DEFINE OFF;
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (drugs_seq.NEXTVAL,'미녹시온정',38000,'미녹시딜','오스코리아제약');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (drugs_seq.NEXTVAL,'판콜아이시럽',3000,'덱시부프로펜','동화약품');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (drugs_seq.NEXTVAL,'겔포스엘현탁액',7000,'인산알루미늄겔','보령');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (drugs_seq.NEXTVAL,'가나릴정',30000,'이토프리드염산염','일동제약');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (drugs_seq.NEXTVAL,'뉴발탄플러스정',20000,'발사르탄','신일제약');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (drugs_seq.NEXTVAL,'미루바정',25000,'수산화마그네슘','씨엠지제약');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (drugs_seq.NEXTVAL,'타이레놀500mg정',12000,'아세트아미노펜','한국얀센');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (drugs_seq.NEXTVAL,'어린이타이레놀160mg',15000,'아세트아미노펜','한국얀센');
Insert into HR.DRUGS (DRUG_NUMBER,DRUG_NAME,DRUG_PRICE,INGREDIENT,COMPANY_NAME) values (drugs_seq.NEXTVAL,'프로페시아정1밀리그램',50000,'피나스테리드','한국오가논');
REM INSERTING into HR.PRESCRIPTIONS
SET DEFINE OFF;
Insert into HR.PRESCRIPTIONS (PRESCRIPTION_NO,PATIENT_ID,DOCTOR_NAME,DRUG_NUMBER,DAYS_MEDICATION,PRESCRIPTION_DATE) values (prescriptions_seq.NEXTVAL,'910623-1284351','황의사',2,3,to_date('20/02/07','RR/MM/DD'));
Insert into HR.PRESCRIPTIONS (PRESCRIPTION_NO,PATIENT_ID,DOCTOR_NAME,DRUG_NUMBER,DAYS_MEDICATION,PRESCRIPTION_DATE) values (prescriptions_seq.NEXTVAL,'941215-2234321','이돌팔이',3,3,to_date('21/06/28','RR/MM/DD'));
Insert into HR.PRESCRIPTIONS (PRESCRIPTION_NO,PATIENT_ID,DOCTOR_NAME,DRUG_NUMBER,DAYS_MEDICATION,PRESCRIPTION_DATE) values (prescriptions_seq.NEXTVAL,'910623-1284351','황의사',2,3,to_date('22/10/10','RR/MM/DD'));
Insert into HR.PRESCRIPTIONS (PRESCRIPTION_NO,PATIENT_ID,DOCTOR_NAME,DRUG_NUMBER,DAYS_MEDICATION,PRESCRIPTION_DATE) values (prescriptions_seq.NEXTVAL,'123456-1234567','최돌팔이',5,4,to_date('23/05/03','RR/MM/DD'));

commit;