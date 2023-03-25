SET DEFINE OFF

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (1, 1, to_date('03-Jan-23', 'DD-MON-RR'), 'UNPAID', 1000, to_date('03-Jan-23', 'DD-MON-RR'));

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (2, 5, to_date('06-Jan-23', 'DD-MON-RR'), 'UNPAID', 5000, to_date('06-Jan-23', 'DD-MON-RR'));

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (3, 1, to_date('08-Jan-23', 'DD-MON-RR'), 'UNPAID', 1000, to_date('08-Jan-23', 'DD-MON-RR'));

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (4, 1, to_date('13-Jan-23', 'DD-MON-RR'), 'UNPAID', 4000, to_date('25-Jan-23', 'DD-MON-RR'));

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (5, 2, to_date('03-Feb-23', 'DD-MON-RR'), 'UNPAID', 2000, to_date('03-Feb-23', 'DD-MON-RR'));

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (6, 1, to_date('03-Feb-23', 'DD-MON-RR'), 'UNPAID', 1750, to_date('03-Feb-23', 'DD-MON-RR'));

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (7, 3, to_date('05-Feb-23', 'DD-MON-RR'), 'UNPAID', 1500, to_date('05-Feb-23', 'DD-MON-RR'));

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (8, 4, to_date('11-Feb-23', 'DD-MON-RR'), 'UNPAID', 250, to_date('11-Feb-23', 'DD-MON-RR'));

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (9, 5, to_date('11-Feb-23', 'DD-MON-RR'), 'UNPAID', 250, to_date('11-Feb-23', 'DD-MON-RR'));

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (10, 5, to_date('13-Feb-23', 'DD-MON-RR'), 'UNPAID', 500, to_date('13-Feb-23', 'DD-MON-RR'));

INSERT INTO ADMIN.VOUCHER (INVOICE_ID, VENDOR_ID, INVOICE_DATE, STATUS, GROSS_AMT, ACCOUNTING_DATE) 
VALUES (11, 5, to_date('16-Feb-23', 'DD-MON-RR'), 'UNPAID', 800, to_date('25-Feb-23', 'DD-MON-RR'));

commit;

UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=1;
UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=2;
UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=3;
UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=4;
UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=5;
UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=6;
UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=7;
UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=8;
UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=9;
UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=10;
UPDATE ADMIN.VOUCHER SET STATUS='PAID' WHERE INVOICE_ID=11;

commit;